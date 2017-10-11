class MermaidMacroHookListener < Redmine::Hook::ViewListener
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::JavaScriptHelper

  def view_layouts_base_body_bottom(context={})
    html = ""
    html << javascript_include_tag(Setting.plugin_redmine_mermaid_macro['mermaid_url'])
    html << javascript_tag("mermaid.initialize({startOnLoad:true});")
    return html
  end

end
