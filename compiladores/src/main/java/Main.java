
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;

import com.compiladores.ParserMiniJava;

import java_cup.runtime.Symbol;
import utils.Symb;
import utils.Token;
public class Main {

    private static final int QUANTIDADE_TESTE_MINI_JAVA = 7;
    private static final int QUANTIDADE_TESTE_CALCULADORA = 3;

    public static void main(String[] args) {
        if (args.length < 1) {
            System.err.println("Falta arquivo de entrada.txt");
            System.exit(1);
        }
        Token token;
        Symbol simbolo;
        String nomeArquivo;
        for (int i = 0; i < QUANTIDADE_TESTE_MINI_JAVA; i++) {
            nomeArquivo = "src/main/saida/saidaMiniJava0" + (i + 1) + ".txt";
            try (PrintWriter pw = new PrintWriter(new FileWriter(nomeArquivo))) {
                MiniJava lexer = new MiniJava(new FileReader(args[i]));
                ParserMiniJava t = new ParserMiniJava(lexer);
                pw.printf("%s%n", " Valor");
                pw.printf("%s%n", "-".repeat(60));
                while ((simbolo = lexer.next_token()) != null) {
                    pw.printf("'%s'%n", simbolo.sym);
                    if (simbolo.sym == 0) {
                        break;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        for (int j = 0; j < QUANTIDADE_TESTE_CALCULADORA; j++) {
            nomeArquivo = "src/main/saida/saidaCalculadora0" + (j + 1) + ".txt";
            try (PrintWriter pw = new PrintWriter(new FileWriter(nomeArquivo))) {
                Calculadora lexer = new Calculadora(new FileReader(args[j + QUANTIDADE_TESTE_MINI_JAVA]));
                pw.printf("%-15s %-25s %s%n", "<linha,coluna>", "[Tipo]", " Valor");
                pw.printf("%s%n", "-".repeat(60));
                while ((token = lexer.yylex()) != null) {
                    pw.printf("%-15s %-25s '%s'%n",
                            "<" + token.linha + ", " + token.coluna + ">",
                            "[" + token.tipo.getTokenName() + "]",
                            token.valor);
                    if (token.tipo == Symb.EOF) {
                        break;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
