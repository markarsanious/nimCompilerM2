grammar nim;

start: (stmt ('\n' | '\r')*)*;

stmt: varDec | assignStmt | printStmt | constDec | letDec | complexIfStmt | forLoop | whileLoop 
	| whenStmt | procBlock | block | typeBlock | methodInvoke | instanceMethodInvoke | emptyStmt 
	| forEachStmt | caseStmt | importStmt | assertStmt;

// varDec: VARIABLE (('\n' INDENT)? IDENTIFIER (COMMA IDENTIFIER)* COLON (dataType | IDENTIFIER) (('\n'* INDENT)? '#' ~('\r' | '\n' | '#')*)?)+;
varDec: VARIABLE
	( (('\n' INDENT)? IDENTIFIER (COMMA IDENTIFIER)* COLON (dataType | IDENTIFIER) '\n'*)
	| (('\n' INDENT)? '#' ~('\r' | '\n' | '#')* '\n'*)
	| assignStmt
	| (IDENTIFIER EQUALS_OPERATOR varComplexIfStmt)
	| (IDENTIFIER EQUALS_OPERATOR AT OPEN_BRACK ((MINUS_OPERATOR? DIGIT+) | IDENTIFIER) (COMMA ((MINUS_OPERATOR? DIGIT+) | IDENTIFIER))* CLOSE_BRACK )
	)+;
constDec: CONST (('\n' INDENT)? assignStmt '\n'? (INDENT COMMENT)?)+;
letDec: LET (('\n' INDENT)? assignStmt '\n'? (INDENT COMMENT)?)+;
assignStmt: (IDENTIFIER EQUALS_OPERATOR AT? (instanceMethodInvoke | rightHandSideStmt) SEMI_COLON? '\n'* INDENT?)
			| (IDENTIFIER EQUALS_OPERATOR methodInvoke ADD_OPERATOR literal);

printStmt: (ECHO OPEN_PAREN rightHandSideStmt (COMMA rightHandSideStmt)* CLOSE_PAREN)
		| (ECHO rightHandSideStmt (COMMA rightHandSideStmt)*)
		| (ECHO methodInvoke);
// emptyStmt: '\n';

assertStmt : 'assert' literal EQUALS_EQUALS literal;

complexIfStmt: simpleIfStmt INDENT? simpleElifStmt* simpleElseStmt?  ('\n' INDENT)?;
varComplexIfStmt: varSimpleIfStmt varSimpleElifStmt* varSimpleElseStmt?;

simpleIfStmt: (IF NOT? condition COLON assignStmt)
			| (IF NOT? condition COLON ('\n' INDENT (stmt | BREAK IDENTIFIER | CONTINUE | 'inc' IDENTIFIER | 'dec' IDENTIFIER))+)
			| (IF NOT? condition COLON ('\n' INDENT (stmt | BREAK IDENTIFIER | CONTINUE)+ '\n'+)+)
			| (IF NOT? condition COLON RETURN)
			| (IF NOT? IDENTIFIER OPEN_PAREN rightHandSideStmt CLOSE_PAREN COLON ('\n' INDENT stmt '\n'*)+)
			| (IF NOT? IDENTIFIER OPEN_PAREN rightHandSideStmt CLOSE_PAREN COLON assignStmt);

simpleElifStmt: (ELIF NOT? condition COLON assignStmt)
			| (ELIF NOT? condition COLON ('\n' INDENT (stmt | BREAK IDENTIFIER | CONTINUE | 'inc' IDENTIFIER | 'dec' IDENTIFIER))+)
			| (ELIF NOT? condition COLON ('\n' INDENT (stmt | BREAK IDENTIFIER | CONTINUE)+ '\n'+)+)
			| (ELIF NOT? condition COLON RETURN)
			| (ELIF NOT? IDENTIFIER OPEN_PAREN rightHandSideStmt CLOSE_PAREN COLON ('\n' INDENT stmt '\n'*)+)
			| (ELIF NOT? IDENTIFIER OPEN_PAREN rightHandSideStmt CLOSE_PAREN COLON assignStmt);

varSimpleIfStmt: IF NOT? condition COLON (rightHandSideStmt | NEW_IDENTIFIER);

varSimpleElifStmt: ELIF NOT? condition COLON (rightHandSideStmt | NEW_IDENTIFIER);

varSimpleElseStmt: INDENT? ELSE COLON (rightHandSideStmt | NEW_IDENTIFIER);

// simpleElifStmt: ELIF condition COLON ('\n' INDENT stmt '\n'*)+;

simpleElseStmt: (INDENT? ELSE COLON (('\n' INDENT (stmt | BREAK))+ | printStmt | assignStmt )+ '\n'* INDENT?);

forLoop: (FOR IDENTIFIER IN CHAR_LIT OP6 CHAR_LIT COLON COMMENT? ('\n' INDENT stmt)+ INDENT*)
		| (FOR IDENTIFIER IN (FORLOOP_RANGE | methodInvoke) COLON COMMENT? ('\n' INDENT stmt)+ INDENT*)
		| (FOR IDENTIFIER IN DIGIT+ OP6 LESS_THAN NEW_IDENTIFIER COLON COMMENT? ('\n' INDENT stmt)+ INDENT*)
		| (FOR IDENTIFIER (COMMA IDENTIFIER)* IN AT OPEN_BRACK ((literal | DIGIT+) (COMMA (literal | DIGIT+))*)* CLOSE_BRACK COLON COMMENT? ('\n' INDENT stmt)+ INDENT*)
		| (FOR IDENTIFIER IN IDENTIFIER OPEN_PAREN IDENTIFIER CLOSE_PAREN COLON COMMENT? ('\n' INDENT stmt)+ INDENT*)
		| (FOR IDENTIFIER IN methodInvoke COLON '\n' INDENT methodInvoke '\n'?)
		| (FOR IDENTIFIER IN IDENTIFIER COLON '\n' INDENT methodInvoke '\n'?);

whileLoop: WHILE (condition | 'true') COLON ('\n' INDENT (stmt | (BREAK IDENTIFIER?)))+;

whenStmt : simpleWhenStmt simpleElifStmt* simpleElseStmt;

simpleWhenStmt: WHEN condition COLON (('\n' INDENT)? (stmt | BREAK))+;

procBlock: (PROC IDENTIFIER (OPEN_BRACK IDENTIFIER CLOSE_BRACK)? OPEN_PAREN (IDENTIFIER ((COLON dataType)| (EQUALS_OPERATOR rightHandSideStmt)) COMMA? )+ CLOSE_PAREN (COLON dataType)? EQUALS_OPERATOR 
			((('\n' INDENT stmt)+) | (assignStmt '\n'* ('\n' INDENT stmt)*) | (printStmt '\n'* ('\n' INDENT stmt)*)) (RETURN rightHandSideStmt)? '\n'?)
			| (PROC 'forEach' OPEN_PAREN IDENTIFIER COLON PROC OPEN_PAREN IDENTIFIER COLON dataType CLOSE_PAREN CLOSE_PAREN (COLON dataType)? EQUALS_OPERATOR 
			((('\n' INDENT stmt)+) | (assignStmt '\n'* ('\n' INDENT stmt)*) | (printStmt '\n'* ('\n' INDENT stmt)*)) (RETURN rightHandSideStmt) '\n'?)
			| (PROC IDENTIFIER (OPEN_BRACK IDENTIFIER CLOSE_BRACK)? OPEN_PAREN IDENTIFIER COLON VARIABLE IDENTIFIER OPEN_BRACK IDENTIFIER CLOSE_BRACK
			(COMMA IDENTIFIER EQUALS_OPERATOR ( (MINUS_OPERATOR? DIGIT+) | IDENTIFIER | literal))* CLOSE_PAREN (COLON dataType)? EQUALS_OPERATOR 
			((('\n' INDENT stmt)+) | (assignStmt '\n'* ('\n' INDENT stmt)*) | (printStmt '\n'* ('\n' INDENT stmt)*)) (RETURN rightHandSideStmt)? '\n'?);

block: BLOCK IDENTIFIER COLON ('\n' INDENT stmt)+;

typeBlock: TYPE '\n' (INDENT IDENTIFIER EQUALS_OPERATOR 'array' OPEN_BRACK (FORLOOP_RANGE | DIGIT+) COMMA dataType CLOSE_BRACK '\n')+;
methodInvoke: (IDENTIFIER OPEN_PAREN (IDENTIFIER | DIGIT+ | literal | rightHandSideStmt) ((COMMA | ADD_OPERATOR | MINUS_OPERATOR | MOD) (IDENTIFIER| DIGIT+ | literal | rightHandSideStmt))* (COMMA IDENTIFIER EQUALS_OPERATOR 'true')? CLOSE_PAREN)
			| ( OPEN_PAREN (IDENTIFIER | DIGIT+ | literal) ((COMMA | ADD_OPERATOR | MINUS_OPERATOR) (IDENTIFIER| DIGIT+ | literal))* CLOSE_PAREN NEW_IDENTIFIER)
			| (IDENTIFIER IDENTIFIER (OPEN_BRACK IDENTIFIER CLOSE_BRACK (COMMA IDENTIFIER OPEN_BRACK IDENTIFIER CLOSE_BRACK)*)?)
			| (IDENTIFIER OPEN_PAREN NEW_IDENTIFIER? CLOSE_PAREN);
instanceMethodInvoke: (NEW_IDENTIFIER OPEN_PAREN rightHandSideStmt ((COMMA | MOD | ADD_OPERATOR)rightHandSideStmt)* CLOSE_PAREN);
forEachStmt: 'forEach' OPEN_PAREN IDENTIFIER CLOSE_PAREN;

importStmt: (IMPORT IDENTIFIER (COMMA IDENTIFIER)* (FROM IDENTIFIER)?) | FROM IDENTIFIER IMPORT IDENTIFIER (COMMA IDENTIFIER)*;

condition: simpleCondition ((AND | OR | AND_OPERATOR | OR_OPERATOR) simpleCondition)*;
simpleCondition: (rightHandSideStmt (LESS_THAN EQUALS_OPERATOR? | '<=' | '>=' | GREATER_THAN EQUALS_OPERATOR? | EQUALS_EQUALS) rightHandSideStmt) | 'true' | 'false' | IDENTIFIER;
character_literals: CHAR_LIT+;
string_literals: STR_LIT+;
rightHandSideStmt: 'true' | 'false' | STR_LIT | (DIGIT+ | IDENTIFIER | literal) ((ADD_OPERATOR | AND_OPERATOR | MINUS_OPERATOR | MOD) (DIGIT+ | IDENTIFIER | literal))* 
				| IDENTIFIER OPEN_BRACK (IDENTIFIER | (MINUS_OPERATOR? DIGIT+)) ((COMMA | ADD_OPERATOR | MINUS_OPERATOR | MUL_OPERATOR | DIV) ( (MINUS_OPERATOR? literal) | (MINUS_OPERATOR? DIGIT+) | IDENTIFIER))* CLOSE_BRACK | methodInvoke ((ADD_OPERATOR | MINUS_OPERATOR | MUL_OPERATOR) (methodInvoke | DIGIT+ | literal))*| literal | 
				(OPEN_BRACK ((( MINUS_OPERATOR? literal) | DIGIT+) (COMMA (( MINUS_OPERATOR? literal) | DIGIT+))*)* CLOSE_BRACK)
				| (OPEN_PAREN rightHandSideStmt ((MINUS_OPERATOR | ADD_OPERATOR) (literal | IDENTIFIER))* CLOSE_PAREN);
dataType: 'string' | 'int' | 'bool';



caseStmt : simpleCaseStmt simpleOfStmt* simpleElifOfStmt* simpleElseStmt;
simpleOfStmt: INDENT? OF (IDENTIFIER | STR_LIT) (COMMA (IDENTIFIER | STR_LIT))* COLON ( ('\n' INDENT)? (stmt | RETURN rightHandSideStmt) '\n'?)+;
simpleElifOfStmt: ELIF rightHandSideStmt COLON COMMENT? ('\n' INDENT? stmt)+;
simpleCaseStmt: CASE IDENTIFIER COMMENT? '\n'?;
emptyStmt: '\n';

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
NEW_IDENTIFIER: ( IDENTIFIER | '.' | STR_LIT)+;
ARRAY_LEN : (IDENTIFIER | '.' | 'len')+;
FORLOOP_RANGE : (IDENTIFIER | '..' | LESS_THAN | NEW_IDENTIFIER | DIGIT+)+;
