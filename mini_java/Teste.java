import java.io.FileReader;
import java.io.IOException;

public class Teste {
    public static void main(String[] args) {
        if (args.length < 1) {
            System.err.println("Uso: java TestLexer <arquivo>");
            System.exit(1);
        }

        try {
            Yylex lexer = new Yylex(new FileReader(args[0]));
            Token token;
            while ((token = lexer.yylex()) != null) {
                System.out.println(token.tipo.getTokenName());
                if (token.tipo == Symbol.EOF)
                    break;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
