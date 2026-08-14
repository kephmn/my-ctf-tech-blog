require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class HTMLWithRouge < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
    end

module ApplicationHelper
    def markdown(text)
        renderer = HTMLWithRouge.new(
            filter_html: false,
            hard_wrap: true,
            link_attributes: { rel: 'opener', target: "_blank" })
        options = {
            autolink: true,
            no_intra_emphasis: true,
            fenced_code_blocks: true,
            lax_html_blocks: true,
            strikethrough: true,
            superscript: true
        }
        markdown = Redcarpet::Markdown.new(renderer, options)
        markdown.render(text).html_safe
    end
end
