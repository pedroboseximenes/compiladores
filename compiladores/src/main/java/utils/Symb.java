package utils;

public enum Symb {

    ABRE_PARENTESES("ABRE_PARENTESES"), // (
    FECHA_PARENTESES("FECHA_PARENTESES"), // )

    /* Calculadora */
    NUMERO("NUMERO"),
    OPERACAO("OPERACAO"),
    /* Fim de arquivo */
    EOF("EOF"),
    /* Erro ao encontrar token */
    ERRO("ERRO");

    private final String tokenName;

    Symb(String tokenName) {
        this.tokenName = tokenName;
    }

    public String getTokenName() {
        return tokenName;
    }
}
