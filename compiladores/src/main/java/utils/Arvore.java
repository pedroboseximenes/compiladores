package utils;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class Arvore {
    private String nome;
    private List<Arvore> filhos;
    private String valor; // Para folhas como ID ou INTEGER

    public Arvore(String nome) {
        this.nome = nome;
        this.filhos = new ArrayList<>();
    }

    public Arvore(String nome, String valor) {
        this.nome = nome;
        this.valor = valor;
        this.filhos = new ArrayList<>();
    }

    public void addFilho(Arvore filho) {
        if (filho != null) {
            this.filhos.add(filho);
        }
    }

    public void imprimir(PrintWriter pw) {
        pw.println(this.nome + (this.valor != null ? ": " + this.valor : ""));
        
        // Começa a recursão para os filhos
        for (int i = 0; i < filhos.size(); i++) {
            // Verifica se é o último filho da lista para escolher o conector
            boolean isLast = (i == filhos.size() - 1);
            filhos.get(i).imprimirRecursivo("", isLast, pw);
        }
        pw.flush();
    }

    private void imprimirRecursivo(String prefix, boolean isLast, PrintWriter pw) {
        // 1. Define os conectores
        // Se for o último filho, usa "└── ", senão "├── "
        String connector = isLast ? "└── " : "├── ";
        
        // 2. Imprime o nó atual
        pw.print(prefix);
        pw.print(connector);
        pw.println(this.nome + (this.valor != null ? ": " + this.valor : ""));

        // 3. Prepara o prefixo para os filhos DESTE nó
        // Se este nó foi o último (└──), os filhos dele não precisam desenhar a linha vertical (|)
        // Se este nó NÃO foi o último (├──), os filhos precisam continuar desenhando a linha vertical (│)
        String childPrefix = prefix + (isLast ? "    " : "│   ");

        // 4. Chama recursivamente para os filhos
        for (int i = 0; i < filhos.size(); i++) {
            boolean isLastChild = (i == filhos.size() - 1);
            filhos.get(i).imprimirRecursivo(childPrefix, isLastChild, pw);
        }
    }
}