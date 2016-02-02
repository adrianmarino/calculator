import 'CalculatorBaseVisitor'
import 'CalculatorLexer'

class CalculatorVisitorImpl < CalculatorBaseVisitor

  attr_reader :results

  def initialize
    @memory = {}
    @results = []
  end

  private

  def visitPrintStatement(context)
    value = visit(context.expression)
    results << value
  end

  def visitAssignStatement(context)
    value = visit(context.expression)
    @memory.merge!(context.IDENTIFIER.getText => value)
    value
  end

  def visitMinusExpression(context)
    value = visit(context.expression)
    context.MINUS.getSymbol.getType == CalculatorLexer::MINUS ? - value : value
  end

  def visitParenthesesExpression(context)
    visit(context.expression)
  end

  def visitMultiplyDivideExpression(context)
    left  = visit(context.expression(0))
    right = visit(context.expression(1))
    context.operator.getType == CalculatorLexer::MULTIPLY ? left * right : left / right
  end

  def visitAddSubtractExpression(context)
    left  = visit(context.expression(0))
    right = visit(context.expression(1))
    context.operator.getType == CalculatorLexer::PLUS ? left + right : left - right
  end

  def visitIdentifierExpression(context)
    @memory[context.IDENTIFIER.getText]
  end

  def visitNumberExpression(context)
    context.NUMBER.getText.to_f
  end
end
