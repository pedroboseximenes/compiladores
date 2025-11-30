package utils;

public class Token {
    public final Symb tipo;
    public final Object valor;
    public final int linha;
    public final int coluna;

    public Token(Symb tipo, Object valor, int linha, int coluna) {
        this.tipo = tipo;
        this.valor = valor;
        this.linha = linha;
        this.coluna = coluna;
    }

    public Token(Symb tipo, int linha, int coluna) {
        this(tipo, null, linha, coluna);
    }
}
