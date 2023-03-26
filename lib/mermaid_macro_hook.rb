class MermaidMacroHook < Redmine::Hook::ViewListener
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::JavaScriptHelper

  def view_layouts_base_html_head(context={})
    html = ""
    html << stylesheet_link_tag('redmine_mermaid_macro.css'  , :plugin => 'redmine_mermaid_macro', :media => 'all')
    return html
  end

  def view_layouts_base_html_head(context={})
    # js = ""
    # js << "import mermaid from '#{Setting.plugin_redmine_mermaid_macro['mermaid_url']}';"
    # js << "mermaid.initialize({startOnLoad:true});"
    # return javascript_tag(js, type: 'module').html_safe
    
    js = ""
    js << "{"
    js << "\"imports\": {"
    js << "\"mermaid\": \"#{Setting.plugin_redmine_mermaid_macro['mermaid_url']}\""
    js << "}"
    js << "}"
    return javascript_tag(js, type: 'importmap').html_safe
  end

end
