
ls = list()

ls.append('AND')
ls.append('INCLUDE')
ls.append('VARIABLE')
ls.append('INTERFACE')
ls.append('ADDR')
ls.append('IS')
ls.append('AS')
ls.append('ISNOT')
ls.append('ASM')
ls.append('ITERATOR')
ls.append('BIND')
ls.append('LET')
ls.append('BLOCK')
ls.append('MACRO')
ls.append('METHOD')
ls.append('BREAK')
ls.append('MIXIN')
ls.append('CASE')
ls.append('MOD')
ls.append('CAST')
ls.append('NIL')
ls.append('CONCEPT')
ls.append('NOT')
ls.append('CONST')
ls.append('NOTIN')
ls.append('CONTINUE')
ls.append('OBJECT')
ls.append('CONVERTER')
ls.append('OF')
ls.append('DEFER')
ls.append('OR')
ls.append('DISCARD')
ls.append('OUT')
ls.append('DISTINCT')
ls.append('PROC')
ls.append('DIV')
ls.append('PTR')
ls.append('DO')
ls.append('RAISE')
ls.append('ELIF')
ls.append('REF')
ls.append('ELSE')
ls.append('RETURN')
ls.append('END')
ls.append('SHL')
ls.append('ENUM')
ls.append('SHR')
ls.append('EXCEPT')
ls.append('STATIC')
ls.append('EXPORT')
ls.append('TEMPLATE')
ls.append('FINALLY')
ls.append('TRY')
ls.append('FOR')
ls.append('TUPLE')
ls.append('FROM')
ls.append('TYPE')
ls.append('FUNC')
ls.append('USING')
ls.append('IF')
ls.append('WHEN')
ls.append('IMPORT')
ls.append('WHILE')
ls.append('IN')
ls.append('XOR')
ls.append('YIELD')
ls.append('MINUS_OPERATOR')
ls.append('IDENTIFIER')
ls.append('DIV_OPERATOR')
ls.append('LETTER')
ls.append('BITWISE_NOT_OPERATOR')
ls.append('DIGIT')
ls.append('AND_OPERATOR')
ls.append('INT8_LIT')
ls.append('OR_OPERATOR')
ls.append('INT16_LIT')
ls.append('LESS_THAN')
ls.append('INT32_LIT')
ls.append('GREATER_THAN')
ls.append('INT64_LIT')
ls.append('AT')
ls.append('UINT_LIT')
ls.append('MODULUS')
ls.append('UINT8_LIT')
ls.append('NOT_OPERATOR')
ls.append('UINT16_LIT')
ls.append('XOR_OPERATOR')
ls.append('UINT32_LIT')
ls.append('DOT')
ls.append('UINT64_LIT')
ls.append('COLON')
ls.append('FLOAT32_LIT')
ls.append('OPEN_PAREN')
ls.append('FLOAT32_SUFFIX')
ls.append('CLOSE_PAREN')
ls.append('FLOAT64_LIT')
ls.append('OPEN_BRACE')
ls.append('FLOAT64_SUFFIX')
ls.append('CLOSE_BRACE')
ls.append('FLOAT_LIT')
ls.append('OPEN_BRACK')
ls.append('EXP')
ls.append('CLOSE_BRACK')
ls.append('INT_LIT')
ls.append('COMMA')
ls.append('HEX_LIT')
ls.append('SEMI_COLON')
ls.append('DEC_LIT')
ls.append('STR_LIT')
ls.append('OCT_LIT')
ls.append('BIN_LIT')
ls.append('HEXDIGIT')
ls.append('CHAR_LIT')
ls.append('OCTDIGIT')
ls.append('TRIPLESTR_LIT')
ls.append('BINDIGIT')
ls.append('TRIPLESTR_ITEM')
ls.append('EQUALS_OPERATOR')
ls.append('RSTR_LIT')
ls.append('ADD_OPERATOR')
ls.append('GENERALIZED_STR_LIT')
ls.append('MUL_OPERATOR')
ls.append('GENERALIZED_TRIPLESTR_LIT')
ls.append('character_literals')
ls.append('string_literals')

for i in ls:
    print("elif token.type == task_2_1Lexer.%s:" % (i))
    print('    return "%s"' % (i))
    # print("%s : '%s';" % (i, i.lower()))
    # print()
