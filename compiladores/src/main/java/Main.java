
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;

import utils.Symbol;
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
        String nomeArquivo;
        for (int i = 0; i < QUANTIDADE_TESTE_MINI_JAVA; i++) {
            nomeArquivo = "src/main/saida/saidaMiniJava0" + (i + 1) + ".txt";
            try (PrintWriter pw = new PrintWriter(new FileWriter(nomeArquivo))) {
                MiniJava lexer = new MiniJava(new FileReader(args[i]));
                pw.printf("%-15s %-25s %s%n", "<linha,coluna>", "[Tipo]", " Valor");
                pw.printf("%s%n", "-".repeat(60));
                while ((token = lexer.yylex()) != null) {
                    pw.printf("%-15s %-25s '%s'%n",
                            "<" + token.linha + ", " + token.coluna + ">",
                            "[" + token.tipo.getTokenName() + "]",
                            token.valor);
                    if (token.tipo == Symbol.EOF) {
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
                    if (token.tipo == Symbol.EOF) {
                        break;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
