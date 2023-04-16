; (import_declaration
;   "import" @structure.anchor
;   (import_spec_list
;     "(" @structure.open
;     ")" @structure.close
;   )
; )
; 
; (function_declaration
;   "function" @structure.anchor
;   body: (block
;     "{" @structure.open
;     "}" @structure.close
;   )
; )
; 
; (function_declaration
;   (identifier) @structure.anchor
;   (parameter_list
;     "(" @structure.open
;     ("," @structure.separator (_))*
;     ")" @structure.close
;   )
; )
; 
; (method_declaration
;   "function" @structure.anchor
;   body: (block
;     "{" @structure.open
;     "}" @structure.close
;   )
; )
; 
; (call_expression
;   function: (_) @structure.anchor
;   (argument_list
;     "(" @structure.open
;     ("," @structure.separator (_))*
;     ","? @structure.separator
;     ")" @structure.close
;   )
; )
; 
; (composite_literal
;   type: (_) @structure.anchor
;   body: (literal_value
;     "{" @structure.open
;     ("," @structure.separator (_)?)*
;     "}" @structure.close
;   )
; )
; 
; (literal_value
;  "{" @structure.anchor
;  ("," @structure.separator (_)?)*
;  "}" @structure.close
; )
; 
; (if_statement
;   ["if" "else"] @structure.anchor
;   (block
;     "{" @structure.open
;     "}" @structure.close
;   )
; )
; 
; (if_statement
;   "else" @structure.anchor
;   (if_statement
;     "if"
;     (block
;       "{" @structure.open
;       "}" @structure.close
;     )
;   )
; )
; 
; (for_statement
;   "for" @structure.anchor
;   (block
;     "{" @structure.open
;     "}" @structure.close
;   )
; )
; 
; (struct_type
;   "struct" @structure.anchor
;   (field_declaration_list
;     "{" @structure.open
;     "}" @structure.close
;   )
; )
; 
; (interface_type
;   "interface" @structure.anchor
;   "{" @structure.open
;   "}" @structure.close
; )