package utils;

public enum Symb {
    /* Palavras-chave */
    CLASS("CLASS"),
    EXTENDS("EXTENDS"),
    PUBLIC("PUBLIC"),
    STATIC("STATIC"),
    VOID("VOID"),
    MAIN("MAIN"),
    RETURN("RETURN"),
    IF("IF"),
    ELSE("ELSE"),
    WHILE("WHILE"),
    THIS("THIS"),
    NEW("NEW"),
    PRIMITIVO("PRIMITIVO TIPO"),
    TRUE("TRUE"),
    FALSE("FALSE"),
    /* Literais */
    INTEGER("INTEGER"),

    /* Identificador */
    ID("ID"),

    /* Operadores */
    ATRIBUICAO("ATRIBUICAO"), // =
    E("E"), // &&
    NAO("NAO"), // !
    MENOR("MENOR"), // <
    ADICAO("ADICAO"), // +
    SUBTRACAO("SUBTRACAO"), // -
    MULTIPLICACAO("MULTIPLICACAO"), // *

    /* Delimitadores e símbolos */
    PONTO_VIRGULA("PONTO_VIRGULA"), // ;
    VIRGULA("VIRGULA"), // ,
    PONTO("PONTO"), // .
    ABRE_PARENTESES("ABRE_PARENTESES"), // (
    FECHA_PARENTESES("FECHA_PARENTESES"), // )
    ABRE_CHAVES("ABRE_CHAVES"), // {
    FECHA_CHAVES("FECHA_CHAVES"), // }
    ABRE_COLCHETES("ABRE_COLCHETES"), // [
    FECHA_COLCHETES("FECHA_COLCHETES"), // ]

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
