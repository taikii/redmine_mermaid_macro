# Redmine Mermaid Macro Plugin

This plugin adds a `mermaid` graph macro to wiki formated fields. 

About mermaid: https://mermaidjs.github.io

## Example

```
{{mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
}}
```

![Example](doc/images/example.png)

## Installation

1. Clone or copy files into the Redmine plugins directory
   ```
   git clone https://github.com/taikii/redmine_mermaid_macro.git plugins/redmine_mermaid_macro
   ```
2. Restart Redmine

## Configration

You can configure `mermaid.js` URL on `Administration -> Plugins` page.
Default value is UNPKG CDN.
https://unpkg.com/mermaid/dist/mermaid.min.js

## License

[MIT](LICENSE)
