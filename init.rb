Redmine::Plugin.register :redmine_mermaid_macro do
  require 'mermaid_macro_hook'

  name 'Redmine Mermaid Macro plugin'
  author 'Taiki IKEGAME'
  description 'Add mermaid graphs to your wiki.'
  version '0.0.1'
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
      out = ''.html_safe
      out << content_tag('div', text, :class => 'mermaid')
      out
    end
  end
end
