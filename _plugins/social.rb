# Social media quick-tags, by @pjf
#
# https://github.com/pjf/pjf.github.io/blob/base/_plugins/social.rb
#
# You may use, modify, and redistribute this under the same
# terms as Ruby itself.
#
# ## General usage:
#
#   {% service user-name optional-link-title %}
#
# ## Example usage:
# 
# {% t pjf %}
#   - <a href="http://twitter.com/pjf">@pjf</a>
# 
# {% fb paul.fenwick Paul Fenwick%}
#   - <a href="http://facebook.com/paul.fenwick">Paul Fenwick</a>
#
# While not shown in the examples above, all anchors have the
# 'social-link' class added to them.
# 
# ## Services supported
#
# * t  - twitter
# * fb - facebook
# * gh - github
# * gt - gittip

class Social < Liquid::Tag
  Syntax = /^(\S+)(?:\s+(.*?)\s*)?$/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Syntax then

      user      = $1
      user_text = $2

      # By default our text is just our username
      @text = user

      case tagName
      when 't'
        base  = "https://twitter.com/"
        @text = "@#{user}"
      when 'fb'
        base  = "https://facebook.com/"
      when 'gh'
        base  = "https://github.com/"
      when 'gt'
        base  = "https://gittip.com/"
      else
        raise "Unknown social tag #{tagName}"
      end

      @url = "#{base}#{user}"

      if not user_text.empty?
        @text = user_text
      end

    else
      raise "Badly formatted social tag - #{tagName} #{markup}"
    end
  end

  def render(context)
    "<a href=\"#{@url}\" class=\"social-link\">#{@text}</a>"
  end

  Liquid::Template.register_tag "t",  self
  Liquid::Template.register_tag "fb", self

end
