import java.util.HashMap;
import java.util.Map;

public class CalculatorVisitorImpl extends  CalculatorBaseVisitor<Double> {

    private Map<String,Double> memory;

    public CalculatorVisitorImpl() {
        this.memory = new HashMap<String, Double>();
    }

    @Override
    public Double visitPrintStatement(CalculatorParser.PrintStatementContext ctx) {
        System.out.printf("\nresults> %S", visit(ctx.expression()));
        return 0D;
    }

    @Override
    public Double visitAssignStatement(CalculatorParser.AssignStatementContext ctx) {
        Double value = visit(ctx.expression());
        memory.put(ctx.VARIABLE().getText(), value);
        return value;
    }


    @Override
    public Double visitMinusExpression(CalculatorParser.MinusExpressionContext ctx) {
        Double value = visit(ctx.expression());
        return ctx.MINUS().getSymbol().getType() == CalculatorLexer.MINUS ? - value : value;
    }

    @Override
    public Double visitParenthesesExpression(CalculatorParser.ParenthesesExpressionContext ctx) {
        return visit(ctx.expression());
    }


    @Override
    public Double visitMultiplyDivideExpression(CalculatorParser.MultiplyDivideExpressionContext ctx) {
        Double left = visit(ctx.expression(0));
        Double right = visit(ctx.expression(1));
        return ctx.operator.getType() == CalculatorLexer.MULTIPLY ? left * right : left / right;
    }

    @Override
    public Double visitAddSubtractExpression(CalculatorParser.AddSubtractExpressionContext ctx) {
        Double left = visit(ctx.expression(0));
        Double right = visit(ctx.expression(1));
        return ctx.operator.getType() == CalculatorLexer.PLUS ? left + right : left - right;
    }

    @Override
    public Double visitVariableExpression(CalculatorParser.VariableExpressionContext ctx) {
        return memory.get(ctx.VARIABLE().getText());
    }

    @Override
    public Double visitNumberExpression(CalculatorParser.NumberExpressionContext ctx) {
        return visit(ctx.number());
    }

    @Override
    public Double visitDoubleNumber(CalculatorParser.DoubleNumberContext ctx) {
        return Double.valueOf(ctx.getText());
    }

    @Override
    public Double visitDoubleDecimalNumber(CalculatorParser.DoubleDecimalNumberContext ctx) {
        return Double.valueOf("0" + ctx.getText());
    }

    @Override
    public Double visitIntegerNumber(CalculatorParser.IntegerNumberContext ctx) {
        return Double.valueOf(ctx.getText());
    }
}
