; identifiers
; -----------
(identifier) @identifier.variable

; Pragma
(pragma_directive) @tag
(solidity_version_comparison_operator _ @tag)

; Literals
; --------
[
 (string)
 (hex_string_literal)
 (unicode_string_literal)
] @string

[
 (number_literal)
] @value.number

[
 (true)
 (false)
] @value.boolean

(comment) @comment

; Definitions and references
; -----------
(type_name) @identifier.type
(primitive_type) @identifier.type
(user_defined_type (identifier) @identifier.type)

(payable_conversion_expression "payable" @identifier.type)
; Ensures that delimiters in mapping( ... => .. ) are not colored like types
(type_name "(" @punctuation.bracket "=>" @punctuation.delimiter ")" @punctuation.bracket)

; Definitions
(struct_declaration 
  name: (identifier) @identifier.type.struct)
(enum_declaration 
  name: (identifier) @identifier.type.enum)
(contract_declaration
  name: (identifier) @identifier.type.class) 
(library_declaration
  name: (identifier) @identifier.type.class) 
(interface_declaration
  name: (identifier) @identifier.type.class)
(event_definition 
  name: (identifier) @identifier.type.class) 
(error_declaration 
  name: (identifier) @identifier.type.class) 
(function_definition
  name:  (identifier) @identifier.function)
(modifier_definition
  name:  (identifier) @identifier.function)

; Use contructor coloring for special functions
(constructor_definition "constructor" @identifier.class)
(fallback_receive_definition "receive" @identifier.class)
(fallback_receive_definition "fallback" @identifier.class)

(struct_member name: (identifier) @identifier.property)
(enum_value) @identifier.constant

; Invocations 
(emit_statement . (identifier) @identifier.type)
; (modifier_invocation (identifier) @identifier.function)

(call_expression . (member_expression property: (identifier) @identifier.function))
(call_expression . (identifier) @identifier.function)

; Function parameters
(call_struct_argument name: (identifier) @identifier.argument)
(event_paramater name: (identifier) @identifier.argument)
(parameter name: (identifier) @identifier.argument)

; Structs and members
(member_expression property: (identifier) @identifier.property)
(struct_expression type: ((identifier) @identifier.type .))
(struct_field_assignment name: (identifier) @identifier.argument)

; Keywords
(meta_type_expression "type" @keyword)
; Keywords
[
 "pragma"
 "is"
 "struct"
 "using"
 "assembly"
 "emit"
 "memory"
 "storage"
 "calldata"
 "var"
 "constant"
 "revert"
 "delete"
 "new"
] @keyword

[
  "function"
  "modifier"
] @keyword.function

[
  "abstract"
  "public"
  "internal"
  "private"
  "external"
  "pure"
  "view"
  "payable"
  (virtual)
  (override_specifier)
] @keyword.modifier

[
  "contract"
  "interface"
  "library"
  "struct"
  "enum"
  "event"
  "error"
] @keyword.construct

[
  "address"
] @keyword.type

[
  "return"
  "returns"
] @keyword.control

; [
;   "this"
;   "super"
; ] @keyword.self

[
  "for"
  "while"
  "do"
  "break"
  "continue"
  "if"
  "else"
  "switch"
  "case"
  "default"
  "try"
  "catch"
] @keyword.condition

"import" @processing
(import_directive "as" @processing)
(import_directive "from" @processing)

(event_paramater "indexed" @keyword)

; Punctuation

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @bracket


[
  "."
  ","
] @punctuation.delimiter

; Operators
[
  "&&"
  "||"
  ">>"
  ">>>"
  "<<"
  "&"
  "^"
  "|"
  "+"
  "-"
  "*"
  "/"
  "%"
  "**"
  "<"
  "<="
  "=="
  "!="
  "!=="
  ">="
  ">"
  "!"
  "~"
  "-"
  "+"
  "++"
  "--"
] @operator