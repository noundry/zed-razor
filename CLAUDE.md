# Project Instructions

## CRITICAL: Do NOT create CLAUDE.md files in subdirectories

Never create `CLAUDE.md` files anywhere inside this project except at the root. Zed treats every subdirectory under `languages/` as a language definition and tries to load `config.toml` from it. A stray `CLAUDE.md` in `languages/xml/` or `languages/razor/` creates a phantom language entry that breaks extension loading.

Only this root-level `CLAUDE.md` should exist.

## Project Overview

This is a Zed editor extension providing:
- Razor syntax highlighting (.cshtml, .razor) via tree-sitter-razor
- XML-based highlighting for .NET project files (.csproj, .slnx, .sln) via tree-sitter-xml

## Extension Structure

- `extension.toml` — manifest (grammars, metadata, version)
- `languages/razor/` — Razor language config and queries
- `languages/csproj/` — C# project file config and queries
- `languages/slnx/` — Solution XML config and queries
- `languages/sln/` — Solution file config and queries
- `grammars/` — compiled WASM grammars (gitignored)

## Publishing Workflow

1. Make changes and bump `version` in `extension.toml`
2. Push to `noundry/zed-razor`
3. Update version in PR to `zed-industries/extensions`
