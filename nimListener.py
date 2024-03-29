# Generated from nim.g4 by ANTLR 4.5.3
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .nimParser import nimParser
else:
    from nimParser import nimParser

# This class defines a complete listener for a parse tree produced by nimParser.
class nimListener(ParseTreeListener):

    # Enter a parse tree produced by nimParser#start.
    def enterStart(self, ctx:nimParser.StartContext):
        pass

    # Exit a parse tree produced by nimParser#start.
    def exitStart(self, ctx:nimParser.StartContext):
        pass


    # Enter a parse tree produced by nimParser#stmt.
    def enterStmt(self, ctx:nimParser.StmtContext):
        pass

    # Exit a parse tree produced by nimParser#stmt.
    def exitStmt(self, ctx:nimParser.StmtContext):
        pass


    # Enter a parse tree produced by nimParser#varDec.
    def enterVarDec(self, ctx:nimParser.VarDecContext):
        pass

    # Exit a parse tree produced by nimParser#varDec.
    def exitVarDec(self, ctx:nimParser.VarDecContext):
        pass


    # Enter a parse tree produced by nimParser#constDec.
    def enterConstDec(self, ctx:nimParser.ConstDecContext):
        pass

    # Exit a parse tree produced by nimParser#constDec.
    def exitConstDec(self, ctx:nimParser.ConstDecContext):
        pass


    # Enter a parse tree produced by nimParser#letDec.
    def enterLetDec(self, ctx:nimParser.LetDecContext):
        pass

    # Exit a parse tree produced by nimParser#letDec.
    def exitLetDec(self, ctx:nimParser.LetDecContext):
        pass


    # Enter a parse tree produced by nimParser#assignStmt.
    def enterAssignStmt(self, ctx:nimParser.AssignStmtContext):
        pass

    # Exit a parse tree produced by nimParser#assignStmt.
    def exitAssignStmt(self, ctx:nimParser.AssignStmtContext):
        pass


    # Enter a parse tree produced by nimParser#printStmt.
    def enterPrintStmt(self, ctx:nimParser.PrintStmtContext):
        pass

    # Exit a parse tree produced by nimParser#printStmt.
    def exitPrintStmt(self, ctx:nimParser.PrintStmtContext):
        pass


    # Enter a parse tree produced by nimParser#assertStmt.
    def enterAssertStmt(self, ctx:nimParser.AssertStmtContext):
        pass

    # Exit a parse tree produced by nimParser#assertStmt.
    def exitAssertStmt(self, ctx:nimParser.AssertStmtContext):
        pass


    # Enter a parse tree produced by nimParser#complexIfStmt.
    def enterComplexIfStmt(self, ctx:nimParser.ComplexIfStmtContext):
        pass

    # Exit a parse tree produced by nimParser#complexIfStmt.
    def exitComplexIfStmt(self, ctx:nimParser.ComplexIfStmtContext):
        pass


    # Enter a parse tree produced by nimParser#varComplexIfStmt.
    def enterVarComplexIfStmt(self, ctx:nimParser.VarComplexIfStmtContext):
        pass

    # Exit a parse tree produced by nimParser#varComplexIfStmt.
    def exitVarComplexIfStmt(self, ctx:nimParser.VarComplexIfStmtContext):
        pass


    # Enter a parse tree produced by nimParser#simpleIfStmt.
    def enterSimpleIfStmt(self, ctx:nimParser.SimpleIfStmtContext):
        pass

    # Exit a parse tree produced by nimParser#simpleIfStmt.
    def exitSimpleIfStmt(self, ctx:nimParser.SimpleIfStmtContext):
        pass


    # Enter a parse tree produced by nimParser#simpleElifStmt.
    def enterSimpleElifStmt(self, ctx:nimParser.SimpleElifStmtContext):
        pass

    # Exit a parse tree produced by nimParser#simpleElifStmt.
    def exitSimpleElifStmt(self, ctx:nimParser.SimpleElifStmtContext):
        pass


    # Enter a parse tree produced by nimParser#varSimpleIfStmt.
    def enterVarSimpleIfStmt(self, ctx:nimParser.VarSimpleIfStmtContext):
        pass

    # Exit a parse tree produced by nimParser#varSimpleIfStmt.
    def exitVarSimpleIfStmt(self, ctx:nimParser.VarSimpleIfStmtContext):
        pass


    # Enter a parse tree produced by nimParser#varSimpleElifStmt.
    def enterVarSimpleElifStmt(self, ctx:nimParser.VarSimpleElifStmtContext):
        pass

    # Exit a parse tree produced by nimParser#varSimpleElifStmt.
    def exitVarSimpleElifStmt(self, ctx:nimParser.VarSimpleElifStmtContext):
        pass


    # Enter a parse tree produced by nimParser#varSimpleElseStmt.
    def enterVarSimpleElseStmt(self, ctx:nimParser.VarSimpleElseStmtContext):
        pass

    # Exit a parse tree produced by nimParser#varSimpleElseStmt.
    def exitVarSimpleElseStmt(self, ctx:nimParser.VarSimpleElseStmtContext):
        pass


    # Enter a parse tree produced by nimParser#simpleElseStmt.
    def enterSimpleElseStmt(self, ctx:nimParser.SimpleElseStmtContext):
        pass

    # Exit a parse tree produced by nimParser#simpleElseStmt.
    def exitSimpleElseStmt(self, ctx:nimParser.SimpleElseStmtContext):
        pass


    # Enter a parse tree produced by nimParser#forLoop.
    def enterForLoop(self, ctx:nimParser.ForLoopContext):
        pass

    # Exit a parse tree produced by nimParser#forLoop.
    def exitForLoop(self, ctx:nimParser.ForLoopContext):
        pass


    # Enter a parse tree produced by nimParser#whileLoop.
    def enterWhileLoop(self, ctx:nimParser.WhileLoopContext):
        pass

    # Exit a parse tree produced by nimParser#whileLoop.
    def exitWhileLoop(self, ctx:nimParser.WhileLoopContext):
        pass


    # Enter a parse tree produced by nimParser#whenStmt.
    def enterWhenStmt(self, ctx:nimParser.WhenStmtContext):
        pass

    # Exit a parse tree produced by nimParser#whenStmt.
    def exitWhenStmt(self, ctx:nimParser.WhenStmtContext):
        pass


    # Enter a parse tree produced by nimParser#simpleWhenStmt.
    def enterSimpleWhenStmt(self, ctx:nimParser.SimpleWhenStmtContext):
        pass

    # Exit a parse tree produced by nimParser#simpleWhenStmt.
    def exitSimpleWhenStmt(self, ctx:nimParser.SimpleWhenStmtContext):
        pass


    # Enter a parse tree produced by nimParser#procBlock.
    def enterProcBlock(self, ctx:nimParser.ProcBlockContext):
        pass

    # Exit a parse tree produced by nimParser#procBlock.
    def exitProcBlock(self, ctx:nimParser.ProcBlockContext):
        pass


    # Enter a parse tree produced by nimParser#macroBlock.
    def enterMacroBlock(self, ctx:nimParser.MacroBlockContext):
        pass

    # Exit a parse tree produced by nimParser#macroBlock.
    def exitMacroBlock(self, ctx:nimParser.MacroBlockContext):
        pass


    # Enter a parse tree produced by nimParser#templateStmt.
    def enterTemplateStmt(self, ctx:nimParser.TemplateStmtContext):
        pass

    # Exit a parse tree produced by nimParser#templateStmt.
    def exitTemplateStmt(self, ctx:nimParser.TemplateStmtContext):
        pass


    # Enter a parse tree produced by nimParser#block.
    def enterBlock(self, ctx:nimParser.BlockContext):
        pass

    # Exit a parse tree produced by nimParser#block.
    def exitBlock(self, ctx:nimParser.BlockContext):
        pass


    # Enter a parse tree produced by nimParser#typeBlock.
    def enterTypeBlock(self, ctx:nimParser.TypeBlockContext):
        pass

    # Exit a parse tree produced by nimParser#typeBlock.
    def exitTypeBlock(self, ctx:nimParser.TypeBlockContext):
        pass


    # Enter a parse tree produced by nimParser#methodInvoke.
    def enterMethodInvoke(self, ctx:nimParser.MethodInvokeContext):
        pass

    # Exit a parse tree produced by nimParser#methodInvoke.
    def exitMethodInvoke(self, ctx:nimParser.MethodInvokeContext):
        pass


    # Enter a parse tree produced by nimParser#instanceMethodInvoke.
    def enterInstanceMethodInvoke(self, ctx:nimParser.InstanceMethodInvokeContext):
        pass

    # Exit a parse tree produced by nimParser#instanceMethodInvoke.
    def exitInstanceMethodInvoke(self, ctx:nimParser.InstanceMethodInvokeContext):
        pass


    # Enter a parse tree produced by nimParser#forEachStmt.
    def enterForEachStmt(self, ctx:nimParser.ForEachStmtContext):
        pass

    # Exit a parse tree produced by nimParser#forEachStmt.
    def exitForEachStmt(self, ctx:nimParser.ForEachStmtContext):
        pass


    # Enter a parse tree produced by nimParser#nestedMethodInvoke.
    def enterNestedMethodInvoke(self, ctx:nimParser.NestedMethodInvokeContext):
        pass

    # Exit a parse tree produced by nimParser#nestedMethodInvoke.
    def exitNestedMethodInvoke(self, ctx:nimParser.NestedMethodInvokeContext):
        pass


    # Enter a parse tree produced by nimParser#importStmt.
    def enterImportStmt(self, ctx:nimParser.ImportStmtContext):
        pass

    # Exit a parse tree produced by nimParser#importStmt.
    def exitImportStmt(self, ctx:nimParser.ImportStmtContext):
        pass


    # Enter a parse tree produced by nimParser#condition.
    def enterCondition(self, ctx:nimParser.ConditionContext):
        pass

    # Exit a parse tree produced by nimParser#condition.
    def exitCondition(self, ctx:nimParser.ConditionContext):
        pass


    # Enter a parse tree produced by nimParser#simpleCondition.
    def enterSimpleCondition(self, ctx:nimParser.SimpleConditionContext):
        pass

    # Exit a parse tree produced by nimParser#simpleCondition.
    def exitSimpleCondition(self, ctx:nimParser.SimpleConditionContext):
        pass


    # Enter a parse tree produced by nimParser#character_literals.
    def enterCharacter_literals(self, ctx:nimParser.Character_literalsContext):
        pass

    # Exit a parse tree produced by nimParser#character_literals.
    def exitCharacter_literals(self, ctx:nimParser.Character_literalsContext):
        pass


    # Enter a parse tree produced by nimParser#string_literals.
    def enterString_literals(self, ctx:nimParser.String_literalsContext):
        pass

    # Exit a parse tree produced by nimParser#string_literals.
    def exitString_literals(self, ctx:nimParser.String_literalsContext):
        pass


    # Enter a parse tree produced by nimParser#rightHandSideStmt.
    def enterRightHandSideStmt(self, ctx:nimParser.RightHandSideStmtContext):
        pass

    # Exit a parse tree produced by nimParser#rightHandSideStmt.
    def exitRightHandSideStmt(self, ctx:nimParser.RightHandSideStmtContext):
        pass


    # Enter a parse tree produced by nimParser#complexRightHandSide.
    def enterComplexRightHandSide(self, ctx:nimParser.ComplexRightHandSideContext):
        pass

    # Exit a parse tree produced by nimParser#complexRightHandSide.
    def exitComplexRightHandSide(self, ctx:nimParser.ComplexRightHandSideContext):
        pass


    # Enter a parse tree produced by nimParser#dataType.
    def enterDataType(self, ctx:nimParser.DataTypeContext):
        pass

    # Exit a parse tree produced by nimParser#dataType.
    def exitDataType(self, ctx:nimParser.DataTypeContext):
        pass


    # Enter a parse tree produced by nimParser#caseStmt.
    def enterCaseStmt(self, ctx:nimParser.CaseStmtContext):
        pass

    # Exit a parse tree produced by nimParser#caseStmt.
    def exitCaseStmt(self, ctx:nimParser.CaseStmtContext):
        pass


    # Enter a parse tree produced by nimParser#simpleOfStmt.
    def enterSimpleOfStmt(self, ctx:nimParser.SimpleOfStmtContext):
        pass

    # Exit a parse tree produced by nimParser#simpleOfStmt.
    def exitSimpleOfStmt(self, ctx:nimParser.SimpleOfStmtContext):
        pass


    # Enter a parse tree produced by nimParser#simpleElifOfStmt.
    def enterSimpleElifOfStmt(self, ctx:nimParser.SimpleElifOfStmtContext):
        pass

    # Exit a parse tree produced by nimParser#simpleElifOfStmt.
    def exitSimpleElifOfStmt(self, ctx:nimParser.SimpleElifOfStmtContext):
        pass


    # Enter a parse tree produced by nimParser#simpleCaseStmt.
    def enterSimpleCaseStmt(self, ctx:nimParser.SimpleCaseStmtContext):
        pass

    # Exit a parse tree produced by nimParser#simpleCaseStmt.
    def exitSimpleCaseStmt(self, ctx:nimParser.SimpleCaseStmtContext):
        pass


    # Enter a parse tree produced by nimParser#emptyStmt.
    def enterEmptyStmt(self, ctx:nimParser.EmptyStmtContext):
        pass

    # Exit a parse tree produced by nimParser#emptyStmt.
    def exitEmptyStmt(self, ctx:nimParser.EmptyStmtContext):
        pass


    # Enter a parse tree produced by nimParser#commentStmt.
    def enterCommentStmt(self, ctx:nimParser.CommentStmtContext):
        pass

    # Exit a parse tree produced by nimParser#commentStmt.
    def exitCommentStmt(self, ctx:nimParser.CommentStmtContext):
        pass


    # Enter a parse tree produced by nimParser#operator.
    def enterOperator(self, ctx:nimParser.OperatorContext):
        pass

    # Exit a parse tree produced by nimParser#operator.
    def exitOperator(self, ctx:nimParser.OperatorContext):
        pass


    # Enter a parse tree produced by nimParser#literal.
    def enterLiteral(self, ctx:nimParser.LiteralContext):
        pass

    # Exit a parse tree produced by nimParser#literal.
    def exitLiteral(self, ctx:nimParser.LiteralContext):
        pass


