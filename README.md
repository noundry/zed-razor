# Razor Pages — Zed Extension

ASP.NET Razor Pages and Blazor support for [Zed](https://zed.dev), providing syntax highlighting for `.cshtml` and `.razor` files with full C# integration. Also includes XML-based highlighting for .NET project files (`.csproj`, `.slnx`, `.sln`).

## Features

- **Razor syntax highlighting** — all Razor directives (`@page`, `@model`, `@using`, `@inject`, `@if`, `@foreach`, `@section`, `@code`, etc.)
- **Full C# highlighting** — classes, methods, generics, LINQ, string interpolation, pattern matching, and more
- **HTML highlighting** — elements, attributes, and embedded content via language injection
- **Razor comments** — `@* ... *@` block comments and standard `// ...` line comments
- **Smart editing** — auto-closing brackets, auto-indentation for Razor control structures, and bracket matching
- **Outline support** — navigate `@section`, `@code` blocks, methods, classes, and HTML elements in the symbol outline
- **.NET project files** — XML-based syntax highlighting for `.csproj`, `.slnx`, and `.sln` files with tag, attribute, and comment support

## Installation

### From the Zed Extensions panel

1. Open Zed
2. Open the Extensions panel (`Ctrl+Shift+X` / `Cmd+Shift+X`)
3. Search for **Razor Pages**
4. Click **Install**

### Manual

Clone this repository into your Zed extensions directory:

```
# macOS / Linux
git clone https://github.com/noundry/zed-razor ~/.config/zed/extensions/installed/razor

# Windows
git clone https://github.com/noundry/zed-razor %LOCALAPPDATA%\Zed\extensions\installed\razor
```

Then restart Zed or reload extensions.

## Supported file types

| Extension | Grammar | Description |
|-----------|---------|-------------|
| `.cshtml` | Razor   | Razor Pages (ASP.NET Core MVC views and pages) |
| `.razor`  | Razor   | Blazor components (server-side and WebAssembly) |
| `.csproj` | XML     | MSBuild C# project files |
| `.slnx`   | XML     | Solution files — XML format (.NET 9+) |
| `.sln`    | XML     | Solution files — classic format (best-effort highlighting) |

## Razor directives

The extension highlights all standard Razor directives:

| Directive | Purpose |
|-----------|---------|
| `@page` | Declares a Razor Page route |
| `@model` | Specifies the page model type |
| `@using` | Imports a namespace |
| `@inject` | Injects a service |
| `@inherits` | Sets the base class |
| `@implements` | Implements an interface |
| `@layout` | Specifies a Blazor layout |
| `@rendermode` | Sets Blazor render mode |
| `@attribute` | Adds a component attribute |
| `@typeparam` | Declares a generic type parameter |
| `@namespace` | Sets the namespace |
| `@section` | Defines a layout section |
| `@preservewhitespace` | Controls whitespace handling |

Control flow: `@if`, `@else if`, `@else`, `@switch`, `@for`, `@foreach`, `@while`, `@do`, `@try`, `@catch`, `@finally`, `@lock`

Expressions: `@await`, `@(explicit)`, implicit inline expressions

## Debugging .NET in Zed

For debugging ASP.NET and Blazor projects directly in Zed, install the companion [zed-netcoredbg](https://github.com/noundry/zed-netcoredbg) extension. It integrates [netcoredbg](https://github.com/Samsung/netcoredbg) as a debug adapter, giving you breakpoints, stepping, variable inspection, and more — all within Zed.

## How it works

This extension uses two tree-sitter grammars:

- [tree-sitter-razor](https://github.com/tris203/tree-sitter-razor) — parses the full Razor template syntax including interleaved HTML, C# code blocks, and Razor directives. HTML content is injected as a separate language layer for proper highlighting.
- [tree-sitter-xml](https://github.com/tree-sitter-grammars/tree-sitter-xml) — provides XML parsing for `.csproj`, `.slnx`, and `.sln` project files.

> **Note:** Classic `.sln` files use a proprietary text format, not XML. The XML grammar provides best-effort highlighting — XML-like portions (comments, GUIDs in quotes) will highlight correctly, while non-XML structure will appear as plain text. The newer `.slnx` format (introduced in .NET 9) is proper XML and highlights fully.

### Extension structure

```
extension.toml              # Extension manifest (grammars: razor, xml)
languages/razor/
  config.toml               # Language configuration (file types, comments, brackets)
  highlights.scm            # Syntax highlighting queries
  injections.scm            # Language injection rules (HTML within Razor)
  brackets.scm              # Bracket matching pairs
  indents.scm               # Auto-indentation rules
  outline.scm               # Symbol outline queries
  overrides.scm             # Scope overrides for comments and strings
languages/csproj/
  config.toml               # .csproj file association
  highlights.scm            # XML highlighting queries
  indents.scm               # Auto-indentation rules
  outline.scm               # Symbol outline queries
languages/slnx/
  config.toml               # .slnx file association
  highlights.scm            # XML highlighting queries
  indents.scm               # Auto-indentation rules
  outline.scm               # Symbol outline queries
languages/sln/
  config.toml               # .sln file association
  highlights.scm            # XML highlighting queries (best-effort)
  indents.scm               # Auto-indentation rules
  outline.scm               # Symbol outline queries
```

## Contributing

Contributions are welcome. Please open an issue or pull request on [GitHub](https://github.com/noundry/zed-razor).

If you find a syntax highlighting issue, include a minimal `.cshtml` or `.razor` snippet that reproduces the problem.

## License

[MIT](LICENSE)
