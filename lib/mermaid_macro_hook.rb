class MermaidMacroHook < Redmine::Hook::ViewListener
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::JavaScriptHelper

  def view_layouts_base_html_head(context={})
    html = ""
    html << stylesheet_link_tag('redmine_mermaid_macro.css'  , :plugin => 'redmine_mermaid_macro', :media => 'all')
    return html
  end

  def view_layouts_base_body_bottom(context={})
    html = ""
    html << javascript_include_tag(Setting.plugin_redmine_mermaid_macro['mermaid_url'])
    html << javascript_tag("mermaid.initialize({startOnLoad:true});var mermaidInitialized = 1;")
    return html
  end

end
