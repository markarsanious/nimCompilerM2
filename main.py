import argparse
from antlr4 import *
from nimLexer import nimLexer
from nimListener import nimListener
from nimParser import nimParser
from antlr4.tree.Trees import Trees


def get_token_type(token):
    if token.type == nimLexer.AND:
        return "AND"
    elif token.type == nimLexer.INCLUDE:
        return "INCLUDE"
    elif token.type == nimLexer.VARIABLE:
        return "VARIABLE"
    elif token.type == nimLexer.INTERFACE:
        return "INTERFACE"
    elif token.type == nimLexer.ADDR:
        return "ADDR"
    elif token.type == nimLexer.IS:
        return "IS"
    elif token.type == nimLexer.AS:
        return "AS"
    elif token.type == nimLexer.ISNOT:
        return "ISNOT"
    elif token.type == nimLexer.ASM:
        return "ASM"
    elif token.type == nimLexer.ITERATOR:
        return "ITERATOR"
    elif token.type == nimLexer.BIND:
        return "BIND"
    elif token.type == nimLexer.LET:
        return "LET"
    elif token.type == nimLexer.BLOCK:
        return "BLOCK"
    elif token.type == nimLexer.MACRO:
        return "MACRO"
    elif token.type == nimLexer.METHOD:
        return "METHOD"
    elif token.type == nimLexer.BREAK:
        return "BREAK"
    elif token.type == nimLexer.MIXIN:
        return "MIXIN"
    elif token.type == nimLexer.CASE:
        return "CASE"
    elif token.type == nimLexer.MOD:
        return "MOD"
    elif token.type == nimLexer.CAST:
        return "CAST"
    elif token.type == nimLexer.NIL:
        return "NIL"
    elif token.type == nimLexer.CONCEPT:
        return "CONCEPT"
    elif token.type == nimLexer.NOT:
        return "NOT"
    elif token.type == nimLexer.CONST:
        return "CONST"
    elif token.type == nimLexer.NOTIN:
        return "NOTIN"
    elif token.type == nimLexer.CONTINUE:
        return "CONTINUE"
    elif token.type == nimLexer.OBJECT:
        return "OBJECT"
    elif token.type == nimLexer.CONVERTER:
        return "CONVERTER"
    elif token.type == nimLexer.OF:
        return "OF"
    elif token.type == nimLexer.DEFER:
        return "DEFER"
    elif token.type == nimLexer.OR:
        return "OR"
    elif token.type == nimLexer.DISCARD:
        return "DISCARD"
    elif token.type == nimLexer.OUT:
        return "OUT"
    elif token.type == nimLexer.DISTINCT:
        return "DISTINCT"
    elif token.type == nimLexer.PROC:
        return "PROC"
    elif token.type == nimLexer.DIV:
        return "DIV"
    elif token.type == nimLexer.PTR:
        return "PTR"
    elif token.type == nimLexer.DO:
        return "DO"
    elif token.type == nimLexer.RAISE:
        return "RAISE"
    elif token.type == nimLexer.ELIF:
        return "ELIF"
    elif token.type == nimLexer.REF:
        return "REF"
    elif token.type == nimLexer.ELSE:
        return "ELSE"
    elif token.type == nimLexer.RETURN:
        return "RETURN"
    elif token.type == nimLexer.END:
        return "END"
    elif token.type == nimLexer.SHL:
        return "SHL"
    elif token.type == nimLexer.ENUM:
        return "ENUM"
    elif token.type == nimLexer.SHR:
        return "SHR"
    elif token.type == nimLexer.EXCEPT:
        return "EXCEPT"
    elif token.type == nimLexer.STATIC:
        return "STATIC"
    elif token.type == nimLexer.EXPORT:
        return "EXPORT"
    elif token.type == nimLexer.TEMPLATE:
        return "TEMPLATE"
    elif token.type == nimLexer.FINALLY:
        return "FINALLY"
    elif token.type == nimLexer.TRY:
        return "TRY"
    elif token.type == nimLexer.FOR:
        return "FOR"
    elif token.type == nimLexer.TUPLE:
        return "TUPLE"
    elif token.type == nimLexer.FROM:
        return "FROM"
    elif token.type == nimLexer.TYPE:
        return "TYPE"
    elif token.type == nimLexer.FUNC:
        return "FUNC"
    elif token.type == nimLexer.USING:
        return "USING"
    elif token.type == nimLexer.IF:
        return "IF"
    elif token.type == nimLexer.WHEN:
        return "WHEN"
    elif token.type == nimLexer.IMPORT:
        return "IMPORT"
    elif token.type == nimLexer.WHILE:
        return "WHILE"
    elif token.type == nimLexer.IN:
        return "IN"
    elif token.type == nimLexer.XOR:
        return "XOR"
    elif token.type == nimLexer.YIELD:
        return "YIELD"
    elif token.type == nimLexer.MINUS_OPERATOR:
        return "MINUS_OPERATOR"
    elif token.type == nimLexer.IDENTIFIER:
        return "IDENTIFIER"
    elif token.type == nimLexer.DIV_OPERATOR:
        return "DIV_OPERATOR"
    elif token.type == nimLexer.LETTER:
        return "LETTER"
    elif token.type == nimLexer.BITWISE_NOT_OPERATOR:
        return "BITWISE_NOT_OPERATOR"
    elif token.type == nimLexer.DIGIT:
        return "DIGIT"
    elif token.type == nimLexer.AND_OPERATOR:
        return "AND_OPERATOR"
    elif token.type == nimLexer.INT8_LIT:
        return "INT8_LIT"
    elif token.type == nimLexer.OR_OPERATOR:
        return "OR_OPERATOR"
    elif token.type == nimLexer.INT16_LIT:
        return "INT16_LIT"
    elif token.type == nimLexer.LESS_THAN:
        return "LESS_THAN"
    elif token.type == nimLexer.INT32_LIT:
        return "INT32_LIT"
    elif token.type == nimLexer.GREATER_THAN:
        return "GREATER_THAN"
    elif token.type == nimLexer.INT64_LIT:
        return "INT64_LIT"
    elif token.type == nimLexer.AT:
        return "AT"
    elif token.type == nimLexer.UINT_LIT:
        return "UINT_LIT"
    elif token.type == nimLexer.MODULUS:
        return "MODULUS"
    elif token.type == nimLexer.UINT8_LIT:
        return "UINT8_LIT"
    elif token.type == nimLexer.NOT_OPERATOR:
        return "NOT_OPERATOR"
    elif token.type == nimLexer.UINT16_LIT:
        return "UINT16_LIT"
    elif token.type == nimLexer.XOR_OPERATOR:
        return "XOR_OPERATOR"
    elif token.type == nimLexer.UINT32_LIT:
        return "UINT32_LIT"
    elif token.type == nimLexer.DOT:
        return "DOT"
    elif token.type == nimLexer.UINT64_LIT:
        return "UINT64_LIT"
    elif token.type == nimLexer.COLON:
        return "COLON"
    elif token.type == nimLexer.FLOAT32_LIT:
        return "FLOAT32_LIT"
    elif token.type == nimLexer.OPEN_PAREN:
        return "OPEN_PAREN"
    elif token.type == nimLexer.FLOAT32_SUFFIX:
        return "FLOAT32_SUFFIX"
    elif token.type == nimLexer.CLOSE_PAREN:
        return "CLOSE_PAREN"
    elif token.type == nimLexer.FLOAT64_LIT:
        return "FLOAT64_LIT"
    elif token.type == nimLexer.OPEN_BRACE:
        return "OPEN_BRACE"
    elif token.type == nimLexer.FLOAT64_SUFFIX:
        return "FLOAT64_SUFFIX"
    elif token.type == nimLexer.CLOSE_BRACE:
        return "CLOSE_BRACE"
    elif token.type == nimLexer.FLOAT_LIT:
        return "FLOAT_LIT"
    elif token.type == nimLexer.OPEN_BRACK:
        return "OPEN_BRACK"
    elif token.type == nimLexer.EXP:
        return "EXP"
    elif token.type == nimLexer.CLOSE_BRACK:
        return "CLOSE_BRACK"
    elif token.type == nimLexer.INT_LIT:
        return "INT_LIT"
    elif token.type == nimLexer.COMMA:
        return "COMMA"
    elif token.type == nimLexer.HEX_LIT:
        return "HEX_LIT"
    elif token.type == nimLexer.SEMI_COLON:
        return "SEMI_COLON"
    elif token.type == nimLexer.DEC_LIT:
        return "DEC_LIT"
    elif token.type == nimLexer.STR_LIT:
        return "STR_LIT"
    elif token.type == nimLexer.OCT_LIT:
        return "OCT_LIT"
    elif token.type == nimLexer.BIN_LIT:
        return "BIN_LIT"
    elif token.type == nimLexer.HEXDIGIT:
        return "HEXDIGIT"
    elif token.type == nimLexer.CHAR_LIT:
        return "CHAR_LIT"
    elif token.type == nimLexer.OCTDIGIT:
        return "OCTDIGIT"
    elif token.type == nimLexer.TRIPLESTR_LIT:
        return "TRIPLESTR_LIT"
    elif token.type == nimLexer.BINDIGIT:
        return "BINDIGIT"
    # elif token.type == nimLexer.TRIPLESTR_ITEM:
    #     return "TRIPLESTR_ITEM"
    elif token.type == nimLexer.EQUALS_OPERATOR:
        return "EQUALS_OPERATOR"
    elif token.type == nimLexer.RSTR_LIT:
        return "RSTR_LIT"
    elif token.type == nimLexer.ADD_OPERATOR:
        return "ADD_OPERATOR"
    elif token.type == nimLexer.GENERALIZED_STR_LIT:
        return "GENERALIZED_STR_LIT"
    elif token.type == nimLexer.MUL_OPERATOR:
        return "MUL_OPERATOR"
    elif token.type == nimLexer.GENERALIZED_TRIPLESTR_LIT:
        return "GENERALIZED_TRIPLESTR_LIT"
    elif token.type == nimLexer.INDENT:
        return "INDENT"
    elif token.type == nimLexer.LET:
        return "LET"
    # elif token.type == nimLexer.character_literals:
    #     return "character_literals"
    # elif token.type == nimLexer.string_literals:
    #     return "string_literals"
    elif token.type == nimLexer.AT:
        return "AT"
    else:
        return None


def main():

    with open(args.file, "r") as file:
        lines = file.read()
    input_stream = InputStream(lines)
    lexer = nimLexer(input_stream)
    token_stream = CommonTokenStream(lexer)
    parser = nimParser(token_stream)

 #   tree = parser.start()
 #   print(Trees.toStringTree(tree,None, parser))

    token = lexer.nextToken()
    res = ""
    while not token.type == Token.EOF:
        got_token = get_token_type(token)
        if got_token is not None:
            res = res + get_token_type(token) + ' ' + token.text + '\n'

        token = lexer.nextToken()

    output_file = open('nim_result.txt', 'w+')
    output_file.write(res)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        add_help=True, description='Sample Commandline')

    parser.add_argument('--file', action="store",
                        help="path of file to take as input", nargs="?", metavar="file")

    args = parser.parse_args()

    # print(args.file)

    main()
