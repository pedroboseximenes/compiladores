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
        for (int i = 0; i < filhos.size(); i++) {
            boolean isLast = (i == filhos.size() - 1);
            filhos.get(i).imprimirRecursivo("", isLast, pw);
        }
        pw.flush();
    }

    private void imprimirRecursivo(String prefix, boolean isLast, PrintWriter pw) {
        String connector = isLast ? "└── " : "├── ";
        pw.print(prefix);
        pw.print(connector);
        pw.println(this.nome + (this.valor != null ? ": " + this.valor : ""));


        String childPrefix = prefix + (isLast ? "    " : "│   ");
        for (int i = 0; i < filhos.size(); i++) {
            boolean isLastChild = (i == filhos.size() - 1);
            filhos.get(i).imprimirRecursivo(childPrefix, isLastChild, pw);
        }
    }
}