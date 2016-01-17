grammar Calculator;

// Lexical rules:
LEFT_PARENT   : '(';
RIGHT_PARENT  : ')';
MULTYPLY      : '*';
DIVIDE        : '/';
SUM           : '+';
SUBSTRACT     : '-';
IDENTIFIER    : [a-zA-Z]+;
NUMBER        : [0-9]+;
EQUAL         : '=';
NEW_LINE      : '\r'?'\n';
WS            : [ \t]+ -> skip;

// Grammar rules:
program: statement+;

statement:  expression NEW_LINE
        |   IDENTIFIER EQUAL expression
        |   NEW_LINE
        ;

expression: expression (MULTYPLY | DIVIDE) expression
        |   expression (SUM | SUBSTRACT) expression
        |   LEFT_PARENT expression RIGHT_PARENT
        |   NUMBER
        |   IDENTIFIER
        ;
