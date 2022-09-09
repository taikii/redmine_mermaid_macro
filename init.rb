require File.expand_path('lib/mermaid_macro_hook', __dir__)

Redmine::Plugin.register :redmine_mermaid_macro do
  name 'Redmine Mermaid Macro plugin'
  author 'Taiki IKEGAME'
  description 'Add mermaid graphs to your wiki.'
  version '1.0.1'
  url 'https://github.com/taikii/redmine_mermaid_macro'
  author_url 'https://taikii.github.io'

  settings :default => { 'mermaid_url' => 'https://unpkg.com/mermaid/dist/mermaid.min.js' },
           :partial => 'settings/redmine_mermaid_macro_settings'

  Redmine::WikiFormatting::Macros.register do
    desc "Add mermaid graphs to your wiki. Example:\n\n" +
         "{{mermaid\n" +
         "graph TD;\n" +
         "    A-->B;\n" +
         "    A-->C;\n" +
         "    B-->D;\n" +
         "    C-->D;\n" +
         "}}"
    macro :mermaid do |obj, args, text|
      divid = "mermaid_" + SecureRandom.urlsafe_base64(8)
      out = ''.html_safe
      out << content_tag(:div, text, id: divid, class: 'mermaid')
      out << javascript_tag("if (typeof mermaidInitialized != 'undefined') {mermaid.init(undefined, $('#" + divid + "'));};")
      out
    end
  end
end
