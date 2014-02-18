module Jekyll
  class PullQuote < Liquid::Tag

    # (Options) : (Message)
    Syntax = /^(.*?)\s*:\s*(.*)/

    def initialize(tag_name, markup, tokens)
      super

      if markup =~ Syntax then
          @quote = $2
      else
        raise "Failed to parse #{tag_name}: #{markup} #{tokens}"
      end

    end

    def render(context)
      "<div class=\"pullquote\"> <p> <i class=\"fa fa-quote-left fa-2x pull-left\"> </i> #{@quote} </p> </div>"
    end
  end
end

Liquid::Template.register_tag('pullquote', Jekyll::PullQuote)
