grammar Calculator;
// ----------------------------------------------------------------------------
// Lexical rules
// ----------------------------------------------------------------------------
EQUAL         : '=';
LEFT_PARENT   : '(';
RIGHT_PARENT  : ')';
MULTIPLY      : '*';
DIVIDE        : '/';
PLUS          : '+';
MINUS         : '-';
VARIABLE      : [a-zA-Z]+;
NEW_LINE      : '\r'?'\n';
WS            : [ \t]+ -> skip;

// Comments
COMMENT       : '/*' (COMMENT|.)*? '*/' NEW_LINE? -> skip;
LINE_COMMENT  : '//' .*? NEW_LINE -> skip;

DIGIT         : [0-9];
//
//
// ----------------------------------------------------------------------------
// Grammar rules
// ----------------------------------------------------------------------------
calculator
  : statement+
  ;
statement
  : expression NEW_LINE                                 # printStatement
  | VARIABLE EQUAL expression NEW_LINE                  # assignStatement
  | NEW_LINE                                            # blankStatement
  ;
expression
  : MINUS expression                                    # minusExpression
  | LEFT_PARENT expression RIGHT_PARENT                 # parenthesesExpression
  | expression operator=(MULTIPLY | DIVIDE) expression  # multiplyDivideExpression
  | expression operator=(PLUS | MINUS) expression       # addSubtractExpression
  | VARIABLE                                            # variableExpression
  | number                                              # numberExpression
  ;
number
  : DIGIT+('.'DIGIT)*                                   # doubleNumber
  | '.'DIGIT+                                           # doubleDecimalNumber
  | DIGIT+                                              # integerNumber
  ;
