[
 (integer_literal)
 (real_literal)
] @number

[
 (string_literal)
 (char_literal)
] @string

(comment) @comment

(identifier) @variable
(function_declaration (identifier) @function)

["," ";"] @punctuation.delimiter

[
  "="
  "+"
  "-"
] @operator

[
 (primitive_type) 
 (mutability_specifier)
 (bool_literal)
] @keyword

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket
