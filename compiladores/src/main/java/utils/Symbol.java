package utils;

public enum Symbol {
    /* Palavras-chave */
    PACKAGE("PACKAGE"),
    IMPORT("IMPORT"),
    CLASS("CLASS"),
    EXTENDS("EXTENDS"),
    PUBLIC("PUBLIC"),
    STATIC("STATIC"),
    NATIVE("NATIVE"),
    VOID("VOID"),
    MAIN("MAIN"),
    RETURN("RETURN"),
    IF("IF"),
    ELSE("ELSE"),
    WHILE("WHILE"),
    DO("DO"),
    FOR("FOR"),
    BREAK("BREAK"),
    CONTINUE("CONTINUE"),
    THIS("THIS"),
    SUPER("SUPER"),
    NEW("NEW"),
    INT("INT"),
    BOOLEAN("BOOLEAN"),
    NULL("NULL"),
    TRUE("TRUE"),
    FALSE("FALSE"),

    /* Literais */
    INTEGER("INTEGER"),
    CHAR("CHAR"),
    STRING("STRING"),

    /* Identificador */
    ID("ID"),

    /* Operadores */
    ATRIBUICAO("ATRIBUICAO"), // =
    E("E"), // &&
    OU("OU"), // ||
    NAO("NAO"), // !
    MENOR("MENOR"), // <
    MENOR_OU_IGUAL("MENOR_OU_IGUAL"), // <=
    MAIOR("MAIOR"), // >
    MAIOR_OU_IGUAL("MAIOR_OU_IGUAL"), // >=
    IGUAL("IGUAL"), // ==
    DIFERENTE("DIFERENTE"), // !=
    ADICAO("ADICAO"), // +
    SUBTRACAO("SUBTRACAO"), // -
    MULTIPLICACAO("MULTIPLICACAO"), // *
    DIVISAO("DIVISAO"), // /
    INTERROGACAO("INTERROGACAO"), // ?
    DOIS_PONTOS("DOIS_PONTOS"), // :

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

    Symbol(String tokenName) {
        this.tokenName = tokenName;
    }

    public String getTokenName() {
        return tokenName;
    }
}
