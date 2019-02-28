module ApplicationHelper
    def markdown(content)
        renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
        options = {
            autolink: true,
            no_intra_emphasis: true, 
            disable_indented_code_blocks: true,
            fenced_code_blocks: true,   
            lax_html_blocks: true,
            strikethrough: true,
            superscript: true,
            filter_html: true,
            hard_wrap: true,
            link_attributes: { rel: 'nofollow', target: "_blank" },
            space_after_headers: true,
            fenced_code_blocks: true,   
    disable_indented_code_blocks: true
        }
        Redcarpet::Markdown.new(renderer, options).render(content).html_safe
    end
   
end
