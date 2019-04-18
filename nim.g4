grammar nim;

start: (stmt SPACE* '\n'*)*;

stmt: varDec | assignStmt | printStmt | constDec | letDec | complexIfStmt | forLoop | whileLoop 
	| whenStmt | procBlock | block | typeBlock | methodInvoke | instanceMethodInvoke | forEachStmt | emptyStmt | caseStmt;

// varDec: VARIABLE (('\n' INDENT)? IDENTIFIER (COMMA IDENTIFIER)* COLON (dataType | IDENTIFIER) (('\n'* INDENT)? '#' ~('\r' | '\n' | '#')*)?)+;
varDec: VARIABLE
	( (('\n' INDENT)? IDENTIFIER (COMMA IDENTIFIER)* COLON (dataType | IDENTIFIER) '\n'*)
	| (('\n' INDENT)? '#' ~('\r' | '\n' | '#')* '\n'*)
	| assignStmt
	)+;
constDec: CONST (('\n' INDENT)? assignStmt '\n'? (INDENT COMMENT)?)+;
letDec: LET (('\n' INDENT)? assignStmt '\n'? (INDENT COMMENT)?)+;
assignStmt: IDENTIFIER EQUALS_OPERATOR rightHandSideStmt SEMI_COLON? ;

printStmt: (ECHO OPEN_PAREN rightHandSideStmt (COMMA rightHandSideStmt)* CLOSE_PAREN)
		| (ECHO rightHandSideStmt (COMMA rightHandSideStmt)*);
// emptyStmt: '\n';



complexIfStmt: simpleIfStmt simpleElifStmt*  simpleElseStmt?;

simpleIfStmt: (IF NOT? condition COLON '\n'? (INDENT stmt '\n')+)
			| (IF NOT? condition COLON assignStmt)
			| (IF NOT? IDENTIFIER OPEN_PAREN rightHandSideStmt CLOSE_PAREN COLON '\n'? (INDENT stmt '\n')+)
			| (IF NOT? IDENTIFIER OPEN_PAREN rightHandSideStmt CLOSE_PAREN COLON assignStmt);

simpleElifStmt: ELIF rightHandSideStmt EQUALS_EQUALS rightHandSideStmt COLON '\n'? (INDENT stmt '\n')+;

simpleElseStmt: ELSE COLON SPACE* '\n' (INDENT stmt '\n')+;

forLoop: (FOR IDENTIFIER IN CHAR_LIT OP6 CHAR_LIT COLON COMMENT? '\n'? (INDENT stmt '\n')+)
		| (FOR IDENTIFIER IN DIGIT+ OP6 DIGIT+ COLON COMMENT? '\n'? (INDENT stmt '\n')+)
		| (FOR IDENTIFIER IN DIGIT+ OP6 LESS_THAN NEW_IDENTIFIER COLON COMMENT? '\n'? (INDENT stmt '\n')+)
		| (FOR IDENTIFIER (COMMA IDENTIFIER)* IN AT OPEN_BRACK (literal (COMMA literal)*)* CLOSE_BRACK COLON COMMENT? '\n'? (INDENT stmt '\n')+)
		| (FOR IDENTIFIER IN IDENTIFIER OPEN_PAREN IDENTIFIER CLOSE_PAREN COLON COMMENT? '\n'? (INDENT stmt '\n')+);

whileLoop: WHILE (condition | 'true') COLON '\n'? (INDENT (stmt | BREAK) '\n')+;

whenStmt : simpleWhenStmt simpleElifStmt* simpleElseStmt;

simpleWhenStmt: WHEN condition COLON '\n'? (INDENT (stmt | BREAK) '\n')+;

procBlock: PROC IDENTIFIER OPEN_PAREN IDENTIFIER COLON dataType CLOSE_PAREN COLON dataType EQUALS_OPERATOR 
			(('\n' (INDENT stmt '\n')+) | assignStmt | printStmt);

block: BLOCK IDENTIFIER COLON '\n'? (INDENT stmt '\n')+;

typeBlock: TYPE '\n' (INDENT IDENTIFIER EQUALS_OPERATOR 'array' OPEN_BRACK DIGIT+ (OP6 DIGIT+)? COMMA dataType CLOSE_BRACK '\n')+;
emptyStmt: '\n';
methodInvoke: IDENTIFIER OPEN_PAREN IDENTIFIER (COMMA IDENTIFIER)* CLOSE_PAREN;
instanceMethodInvoke: NEW_IDENTIFIER OPEN_PAREN rightHandSideStmt (COMMA rightHandSideStmt)* CLOSE_PAREN;
forEachStmt: 'forEach' OPEN_PAREN IDENTIFIER CLOSE_PAREN;
//instance method invoke stmt?

condition: (rightHandSideStmt (LESS_THAN EQUALS_OPERATOR? | GREATER_THAN EQUALS_OPERATOR? | EQUALS_EQUALS) rightHandSideStmt) | 'true' | 'false' | IDENTIFIER;
character_literals: CHAR_LIT+;
string_literals: STR_LIT+;
rightHandSideStmt: 'true' | 'false' | STR_LIT | (DIGIT+ | IDENTIFIER) (ADD_OPERATOR (DIGIT+ | IDENTIFIER))* | IDENTIFIER OPEN_BRACK (IDENTIFIER | DIGIT+) CLOSE_BRACK | literal | OPEN_BRACK (literal (COMMA literal)*)* CLOSE_BRACK;
dataType: 'string' | 'int' | 'bool';



caseStmt : simpleCaseStmt simpleOfStmt* simpleElifOfStmt* simpleElseStmt;
simpleOfStmt: OF (IDENTIFIER | STR_LIT) (COMMA (IDENTIFIER | STR_LIT))* COLON '\n'? (INDENT? stmt '\n')+;
simpleElifOfStmt: ELIF rightHandSideStmt COLON COMMENT? '\n'? (INDENT? stmt '\n')+;
simpleCaseStmt: CASE IDENTIFIER COMMENT? '\n'?;

commentStmt: INDENT? COMMENT;
DIGIT: [0-9];
INDENT: (SPACE SPACE SPACE SPACE)+;
NOT_INDENT:
	INDENT* (SPACE | SPACE SPACE | SPACE SPACE SPACE) -> skip;
SPACE: ' ' -> skip;
NEWLINE: [\n\r]+ -> skip;

AND: 'and';
VARIABLE: 'var';
OR: 'or';
NOT: 'not';
DIV: 'div';
SHL: 'shl';
SHR: 'shr';
XOR: 'xor';
MOD: 'mod';
ECHO: 'echo';
IS: 'is';
ISNOT: 'isnot';
OF: 'of';
operator:
	EQUALS_OPERATOR
	| ADD_OPERATOR
	| MUL_OPERATOR
	| MINUS_OPERATOR
	| DIV_OPERATOR
	| BITWISE_NOT_OPERATOR
	| AND_OPERATOR
	| OR_OPERATOR
	| LESS_THAN
	| GREATER_THAN
	| NOT_OPERATOR
	| XOR_OPERATOR;
OP6: '..';
EQUALS_EQUALS : '==';
EQUALS_OPERATOR: '=';
ADD_OPERATOR: '+';
MUL_OPERATOR: '*';
MINUS_OPERATOR: '-';
DIV_OPERATOR: '/';
BITWISE_NOT_OPERATOR: '~';
AND_OPERATOR: '&';
OR_OPERATOR: '|';
LESS_THAN: '<';
GREATER_THAN: '>';
NOT_OPERATOR: '!';
XOR_OPERATOR: '^';
DOT: '.';
COLON: ':';
COMMA: ',';
SEMI_COLON: ';';
ADDR: 'addr';
AS: 'as';
ASM: 'asm';
BIND: 'bind';
BLOCK: 'block';
BREAK: 'break';
CASE: 'case';
CAST: 'cast';
CONCEPT: 'concept';
CONST: 'const';
CONTINUE: 'continue';
CONVERTER: 'converter';
DEFER: 'defer';
DISCARD: 'discard';
DISTINCT: 'distinct';
DO: 'do';
ELIF: 'elif';
ELSE: 'else';
END: 'end';
ENUM: 'enum';
EXCEPT: 'except';
EXPORT: 'export';
FINALLY: 'finally';
FOR: 'for';
FROM: 'from';
FUNC: 'func';
IF: 'if';
IMPORT: 'import';
IN: 'in';
INCLUDE: 'include';
INTERFACE: 'interface';
ITERATOR: 'iterator';
LET: 'let';
MACRO: 'macro';
METHOD: 'method';
MIXIN: 'mixin';
NIL: 'nil';
NOTIN: 'notin';
OBJECT: 'object';
OUT: 'out';
PROC: 'proc';
PTR: 'ptr';
RAISE: 'raise';
REF: 'ref';
RETURN: 'return';
STATIC: 'static';
TEMPLATE: 'template';
TRY: 'try';
TUPLE: 'tuple';
TYPE: 'type';
USING: 'using';
WHEN: 'when';
WHILE: 'while';
YIELD: 'yield';

OPEN_PAREN: '(';
CLOSE_PAREN: ')';
OPEN_BRACE: '{';
CLOSE_BRACE: '}';
OPEN_BRACK: '[';
CLOSE_BRACK: ']';

MODULUS: '%';

TRIPLESTR_LIT: '"""' ()*? '"""';
CHAR_LIT: 
		'\'\\t\'' 
		| '\'\\r\'' 
		| '\'\\c\'' 
		| '\'\\n\'' 
		| '\'\\l\'' 
		| '\'\\f\''  
		| '\'\\v\'' 
		| '\'\\\\\'' 
		| '\'\\"\'' 
		| '\'\\\'\'' 
		| '\'\\a\'' 
		| '\'\\b\'' 
		| '\'\\e\'' 
		| '\'\\x\'' 
		| ('\'' [0-9a-zA-Z] '\'') ;
STR_LIT: '"' (~["\r\n])* '"';
//STR_LIT:
//	'"' (
//		[\p\r\c\l\f\t\v\\\"\'\-]
//		| [\\] [0-9]+
//		| ' '
//		| ',' | ', '
//		| [\a\b\e]
//		| [\x] H H
//		| SPACE
//		| [a-zA-Z0-9?!@#$%^&*()_+=`~}{]
//	)* '"';
RSTR_LIT: ('r' | 'R') STR_LIT;
GENERALIZED_STR_LIT: IDENTIFIER STR_LIT;
GENERALIZED_TRIPLESTR_LIT: IDENTIFIER TRIPLESTR_LIT;

WS: [ \t]+ -> skip;
AT: 'at' | '@';
COMMENT: INDENT? '#' ~('\r' | '\n' | '#')* -> skip;
MULTI_LINE_COMMENT:
	INDENT? (
		('#' MULTI_LINE_COMMENT2 '#')
		| ('#' OPEN_BRACK MULTI_LINE_COMMENT2 CLOSE_BRACK '#')
		| MULTI_LINE_COMMENT2
	) -> skip;

MULTI_LINE_COMMENT2:
	(
		('#' MULTI_LINE_COMMENT2 '#')
		| ('#' OPEN_BRACK MULTI_LINE_COMMENT2 CLOSE_BRACK '#')
		| SINGLE_MULTI_LINE_COMMENT
	) -> skip;

SINGLE_MULTI_LINE_COMMENT:
	'#' OPEN_BRACK ()*? CLOSE_BRACK '#' -> skip;

IDENTIFIER: '$'? LETTER ('_'* (LETTER | DIGIT))*;
H: [A-Fa-f0-9];

LETTER: [a-zA-Z];

literal:
	INT_LIT
	| INT8_LIT
	| INT16_LIT
	| INT32_LIT
	| INT64_LIT
	| UINT_LIT
	| UINT8_LIT
	| UINT16_LIT
	| UINT32_LIT
	| UINT64_LIT
	| FLOAT_LIT
	| FLOAT32_LIT
	| FLOAT64_LIT
	| STR_LIT
	| RSTR_LIT
	| TRIPLESTR_LIT
	| CHAR_LIT
	| NIL;
INT_LIT: HEX_LIT | DEC_LIT | OCT_LIT | BIN_LIT;
HEX_LIT: '0' ('x' | 'X') HEXDIGIT+ ( '_' HEXDIGIT)*;
DEC_LIT: DIGIT+ ( '_' DIGIT+)*;
OCT_LIT: '0' 'o' OCTDIGIT+ ( '_' OCTDIGIT)*;
BIN_LIT: '0' ('b' | 'B') BINDIGIT+ ( '_' BINDIGIT+)*;
INT8_LIT: INT_LIT '\'' ('i' | 'I') '8';
INT16_LIT: INT_LIT '\'' ('i' | 'I') '16';
INT32_LIT: INT_LIT '\'' ('i' | 'I') '32';
INT64_LIT: INT_LIT '\'' ('i' | 'I') '64';
UINT_LIT: INT_LIT '\'' ('u' | 'U');
UINT8_LIT: UINT_LIT '8';
UINT16_LIT: UINT_LIT '16';
UINT32_LIT: UINT_LIT '32';
UINT64_LIT: UINT_LIT '64';
FLOAT_LIT:
	DIGIT+ ('_' DIGIT)* (('.' DIGIT+ ('_' DIGIT)* EXP?) | EXP);
FLOAT32_LIT:
	HEX_LIT '\'' FLOAT32_SUFFIX
	| (FLOAT_LIT | DEC_LIT | OCT_LIT | BIN_LIT) '\'' FLOAT32_SUFFIX;
FLOAT32_SUFFIX: ('f' | 'F') '32';
FLOAT64_LIT:
	HEX_LIT '\'' FLOAT64_SUFFIX
	| (FLOAT_LIT | DEC_LIT | OCT_LIT | BIN_LIT) '\'' FLOAT64_SUFFIX;
FLOAT64_SUFFIX: ( ('f' | 'F') '64') | 'd' | 'D';

EXP: ('e' | 'E') [+-] DIGIT+ ( [_] DIGIT)*;
HEXDIGIT: DIGIT | [A-Fa-f];
OCTDIGIT: [0-7];
BINDIGIT: [0-1];
NEW_IDENTIFIER: (IDENTIFIER | '.')+;
ARRAY_LEN : (IDENTIFIER | '.' | 'len')+;
