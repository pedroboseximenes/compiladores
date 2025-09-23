import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import utils.Symbol;
import utils.Token;

public class Main {
    
    public static void main(String[] args) {
        if (args.length < 1) {
            System.err.println("Falta arquivo de entrada.txt");
            System.exit(1);
        }

        try {
            for(int i = 0; i < 1; i++){
                String nomeArquivo = "src/main/saida/saidaMiniJava0" + (i+1) +".txt";
                FileWriter escritor = new FileWriter(nomeArquivo);

                MiniJava lexer = new MiniJava(new FileReader(args[i]));
                Token token;
                while ((token = lexer.yylex()) != null) {
                    escritor.write("Linha, Coluna <"+token.linha + ", "+ token.coluna  + "> "+token.tipo.getTokenName() +"\n");
                    //System.out.println(token.tipo.getTokenName());
                    if (token.tipo == Symbol.EOF)
                        break;
                }
                escritor.close();
                }
        } catch (IOException e) {
            e.printStackTrace();
        }
        /* TODO: CALCULADORA
        try {
               for(int j = 0; j < 1; j++){
                 String nomeArquivo = "src/main/saida/saidaMiniJava0" + (j+1) +".txt";
                FileWriter escritor = new FileWriter(nomeArquivo);

                Calculadora lexer = new Calculadora(new FileReader(args[j]));
                Token token;
                while ((token = lexer.yylex()) != null) {
                    escritor.write(token.tipo.getTokenName() +"\n");
                    System.out.println(token.tipo.getTokenName());
                    if (token.tipo == Symbol.EOF)
                        break;
                }
                escritor.close();
            }
             
        } catch (Exception e) {
            e.printStackTrace();
        }
        */
    }
}