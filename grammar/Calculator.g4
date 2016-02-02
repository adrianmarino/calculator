grammar Calculator;
// ----------------------------------------------------------------------------
// Lexical rules
// ----------------------------------------------------------------------------
fragment DIGIT  : [0-9];
fragment LETTER : [a-zA-Z] | '_';

EQUAL         : '=';
LEFT_PARENT   : '(';
RIGHT_PARENT  : ')';
MULTIPLY      : '*';
DIVIDE        : '/';
PLUS          : '+';
MINUS         : '-';
NEW_LINE      : '\r'?'\n';
WS            : [ \t]+ -> skip;
LINE_COMMENT  : '//' .*? NEW_LINE -> skip
              ;
COMMENT       : '/*' (COMMENT|.)*? '*/' NEW_LINE? -> skip
              ;
NUMBER        : DIGIT+('.'DIGIT)*
              | '.'DIGIT+
              | DIGIT+
              ;
IDENTIFIER    : LETTER (LETTER | DIGIT)*
              ;
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
  | IDENTIFIER EQUAL expression NEW_LINE                # assignStatement
  | NEW_LINE                                            # blankStatement
  ;
expression
  : MINUS expression                                    # minusExpression
  | LEFT_PARENT expression RIGHT_PARENT                 # parenthesesExpression
  | expression operator=(MULTIPLY | DIVIDE) expression  # multiplyDivideExpression
  | expression operator=(PLUS | MINUS) expression       # addSubtractExpression
  | IDENTIFIER                                          # identifierExpression
  | NUMBER                                              # numberExpression
  ;
