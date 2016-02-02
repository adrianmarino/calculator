import 'org.antlr.v4.runtime.ANTLRInputStream'
import 'org.antlr.v4.runtime.CommonTokenStream'
import 'java.io.FileInputStream'
import 'CalculatorLexer'
import 'CalculatorParser'
require 'calculator_visitor_impl'

module Calculator
  extend self

  def eval(input_path)
    input_stream  = FileInputStream.new(input_path);
    input         = ANTLRInputStream.new(input_stream)
    lexer         = CalculatorLexer.new(input)
    token_stream  = CommonTokenStream.new(lexer)
    parser        = CalculatorParser.new(token_stream)
    visitor       = CalculatorVisitorImpl.new
    visitor.visit(parser.calculator)
    visitor.results
  end
end
