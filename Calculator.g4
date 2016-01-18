grammar Calculator;

// Lexical rules:
EQUAL         : '=';
LEFT_PARENT   : '(';
RIGHT_PARENT  : ')';
MULTIPLY      : '*';
DIVIDE        : '/';
PLUS          : '+';
MINUS         : '-';
VARIABLE      : [a-zA-Z_][a-zA-Z_0-9]+;
NUMBER        : [0-9]+;
NEW_LINE      : '\r'?'\n';
WS            : [ \t]+ -> skip;
// Comments
COMMENT       : '/*' (COMMENT|.)*? '*/' NEW_LINE? -> skip;
LINE_COMMENT  : '//' .*? NEW_LINE -> skip;

// Grammar rules:
calculator
  : statement+
  ;
statement
  : expression NEW_LINE
  | VARIABLE EQUAL expression NEW_LINE
  | NEW_LINE
  ;

expression
  : MINUS expression
  | LEFT_PARENT expression RIGHT_PARENT
  | expression operator=(MULTIPLY | DIVIDE) expression
  | expression operator=(PLUS | MINUS) expression
  | NUMBER
  | VARIABLE
  ;
