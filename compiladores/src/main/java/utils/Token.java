package utils;

public class Token {
    public final Symbol tipo;
    public final Object valor;
    public final int linha;
    public final int coluna;

    public Token(Symbol tipo, Object valor, int linha, int coluna) {
        this.tipo = tipo;
        this.valor = valor;
        this.linha = linha;
        this.coluna = coluna;
    }

    public Token(Symbol tipo, int linha, int coluna) {
        this(tipo, null, linha, coluna);
    }
}
