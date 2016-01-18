import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import static java.lang.System.*;

public class Calculator {

    public static void main(String[] args) throws IOException {
      InputStream is = in;
      if(args.length > 0) is = new FileInputStream(args[0]);

      CalculatorLexer lexer = new CalculatorLexer(new ANTLRInputStream(is));
      CalculatorParser parser = new CalculatorParser(new CommonTokenStream(lexer));

      new CalculatorVisitorImpl().visit(parser.calculator());
    }
}
