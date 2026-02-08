; HTML Elements

(element "<" . (_) @tag)
(element "</" . (_) @tag)

(element "<" @punctuation.bracket)
(element ">" @punctuation.bracket)
(element "</" @punctuation.bracket)
(element "/>" @punctuation.bracket)

(element "\"" @string)
(element "=" @punctuation.delimiter)

; Razor Directives

[
  "at_page"
  "at_using"
  "at_model"
  "at_rendermode"
  "at_inject"
  "at_implements"
  "at_layout"
  "at_inherits"
  "at_attribute"
  "at_typeparam"
  "at_namespace"
  "at_preservewhitespace"
  "at_block"
  "at_at_escape"
  "at_colon_transition"
] @keyword

[
  "at_lock"
  "at_section"
] @keyword

[
  "at_if"
  "at_switch"
] @keyword

[
  "at_for"
  "at_foreach"
  "at_while"
  "at_do"
] @keyword

[
  "at_try"
  "catch"
  "finally"
] @keyword

[
  "at_implicit"
  "at_explicit"
] @keyword

"at_await" @keyword

(razor_rendermode) @constant
(razor_attribute_name) @attribute
(razor_attribute_modifier) @attribute
(razor_comment) @comment
(html_comment) @comment

; C#

(identifier) @variable

(method_declaration name: (identifier) @function)
(_ function: (identifier) @function)
(local_function_statement name: (identifier) @function)

(interface_declaration name: (identifier) @type)
(class_declaration name: (identifier) @type)
(enum_declaration name: (identifier) @type)
(struct_declaration (identifier) @type)
(record_declaration (identifier) @type)
(namespace_declaration name: (identifier) @type)

(generic_name (identifier) @type)
(type_parameter (identifier) @property.definition)
(parameter type: (identifier) @type)
(type_argument_list (identifier) @type)
(as_expression right: (identifier) @type)
(is_expression right: (identifier) @type)

(constructor_declaration name: (identifier) @constructor)
(destructor_declaration name: (identifier) @constructor)

(_ type: (identifier) @type)

(base_list (identifier) @type)

(predefined_type) @type.builtin

(enum_member_declaration (identifier) @property.definition)

[
  (real_literal)
  (integer_literal)
] @number

[
  (character_literal)
  (string_literal)
  (raw_string_literal)
  (verbatim_string_literal)
  (interpolated_string_expression)
  (interpolation_start)
  (interpolation_quote)
] @string

(escape_sequence) @string.escape

[
  (boolean_literal)
  (null_literal)
] @constant.builtin

(comment) @comment

[
  ";"
  "."
  ","
] @punctuation.delimiter

[
  "--"
  "-"
  "-="
  "&"
  "&="
  "&&"
  "+"
  "++"
  "+="
  "<="
  "<<"
  "<<="
  "=="
  "!"
  "!="
  "=>"
  ">="
  ">>"
  ">>="
  ">>>"
  ">>>="
  "|"
  "|="
  "||"
  "?"
  "??"
  "??="
  "^"
  "^="
  "~"
  "*"
  "*="
  "/"
  "/="
  "%"
  "%="
  ":"
] @operator

"<" @operator
">" @operator
"=" @operator

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  (interpolation_brace)
] @punctuation.bracket

[
  (modifier)
  "this"
  (implicit_type)
] @keyword

[
  "add"
  "alias"
  "as"
  "base"
  "break"
  "case"
  "catch"
  "checked"
  "class"
  "continue"
  "default"
  "delegate"
  "do"
  "else"
  "enum"
  "event"
  "explicit"
  "extern"
  "finally"
  "for"
  "foreach"
  "global"
  "goto"
  "if"
  "implicit"
  "interface"
  "is"
  "lock"
  "namespace"
  "notnull"
  "operator"
  "params"
  "return"
  "remove"
  "sizeof"
  "stackalloc"
  "static"
  "struct"
  "switch"
  "throw"
  "try"
  "typeof"
  "unchecked"
  "using"
  "while"
  "new"
  "await"
  "in"
  "yield"
  "get"
  "set"
  "when"
  "out"
  "ref"
  "from"
  "where"
  "select"
  "record"
  "init"
  "with"
  "let"
] @keyword

(attribute name: (identifier) @attribute)

(parameter
  name: (identifier) @variable.parameter)

(type_parameter_constraints_clause (identifier) @property.definition)

(invocation_expression (member_access_expression name: (identifier) @function))
