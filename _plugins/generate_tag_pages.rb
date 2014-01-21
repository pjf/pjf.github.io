=begin

TagPagination is based upon CaptainCanine's Category Pagination code at
https://github.com/captaincanine/marran.com/blob/master/_plugins/generate_category_pages.rb

Updated by Paul Fenwick for pjf.id.au - http://github.com/pjf/pjf.github.io

## Intro

TagPagination allows Jekyll sites to have index pages for each tag, and to break those 
tag indexes into multiple pages.

## Using

This code belongs in the _plugins directory. 

The following items need to be true:

*   In the _config.yml, there needs to be a line that says "paginate: n", with 'n' being the
    number of links per page.
*   There needs to be an "index.html" page with "tag_index: tag-name" in the YAML front matter. 
    Be sure to use the actual tag name.

If there is a file called `tag_index.html` in the _layouts directory, it will be used for
displaying each tag index beyond the first. This can be overriden by setting the
`tag_index` property in the top-matter of your `index.html` file.

## Example Usage

For instance, if you wanted to have a paginated set of pages for all posts in the "recipes" 
tag, place a file called "index.html" in the "recipes" directory. Make sure that in the 
YAML front matter, there is a line that says "tag_index: recipes".

This plugin is structured so that each tag index page can have its own unique landing page. 
For instance, a page showing all the recipes can be different than the page showing all the blog
entries.

When inside an tag index, you will have access to a paginator object for that tag index.
The use of `{{ paginator.next_page_path }}` and `{{ paginator.previous_page_path }}` is
encouraged.

=end

module Jekyll

  class TagPages < Generator
  
    safe true

    def generate(site)
      
      site.pages.dup.each do |page|
        paginate(site, page) if TagPager.pagination_enabled?(site.config, page)
      end

    end

    def paginate(site, page)

      tag_index = page.data['tag_index']
    
      # sort tags by descending date of publication
      tag_posts = site.tags[tag_index].sort_by { |p| -p.date.to_f }

      # calculate total number of pages
      pages = TagPager.calculate_pages(tag_posts, site.config['paginate'].to_i)

      # iterate over the total number of pages and create a physical page for each
      (1..pages).each do |num_page|
      
        # the TagPager handles the paging and tag data
        pager = TagPager.new(site, num_page, tag_posts, tag_index, pages)

        # the first page is the index, so no page needs to be created. However, the subsequent pages need to be generated
        if num_page > 1
          newpage = TagSubPage.new(site, site.source, tag_index, page.data['tag_layout'])
          newpage.pager = pager
          newpage.dir = File.join(page.dir, "/page#{num_page}")
          site.pages << newpage
        else
          page.pager = pager
        end

      end
    end

  end
  
  class TagPager < Pager

    attr_reader :tag

    def self.pagination_enabled?(config, page)
      page.name == 'index.html' && page.data.key?('tag_index') && !config['paginate'].nil?
    end
    
    # same as the base class, but includes the tag value
    def initialize(site, page, all_posts, tag, num_pages = nil)
      @tag = tag
      super site, page, all_posts, num_pages

      # Prefix our _path variables with our tag name
      # TODO - This sucks! Prefix it with our page path instead!
      
      if @previous_page_path 
        @previous_page_path = "/#{tag}#{@previous_page_path}"
      end

      if @next_page_path
        @next_page_path = "/#{tag}#{@next_page_path}"
      end

    end

    # use the original to_liquid method, but add in tag info
    alias_method :original_to_liquid, :to_liquid
    def to_liquid
      x = original_to_liquid
      x['tag'] = @tag
      x
    end
    
  end
  
  # The TagSubPage class creates a single tag page for the specified tag.
  # This class exists to specify the layout to use for pages after the first index page
  class TagSubPage < Page
    
    def initialize(site, base, tag, layout)
        
      @site = site
      @base = base
      @dir  = tag
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), layout || 'tag_index.html')

      title_prefix             = site.config['tag_title_prefix'] || 'Posts tagged with '
      self.data['title']       = "#{title_prefix}#{tag}"

    end
    
  end

end
