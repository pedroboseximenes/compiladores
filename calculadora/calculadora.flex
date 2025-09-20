%%
%standalone

Digito        = [0-9]
Numero        = {Digito}+(\.{Digito}+)?
Operadores    = (\+|\-|\*|\/|\/\/|\*\*)
AbreParenteses = \(
FechaParenteses = \)
NovaExpressao = \n

%xstates OPERACAO, QNUMERO , QFINAL

%%
<YYINITIAL> {
    {Numero} {
        System.out.println("Numero: " + yytext());
        yybegin(OPERACAO);
    }
    {Operadores} {
        throw new RuntimeException("Caractere inválido: " + yytext());
    }
}

<OPERACAO> {
    {Operadores} {
        System.out.println("Operador: " + yytext());
        yybegin(QNUMERO);
    }
    {Numero} {
        throw new RuntimeException("[OPERACAO] Caractere inválido: " + yytext());
    }
}

<QNUMERO> {
    {Numero} {
        System.out.println("Numero: " + yytext());
        yybegin(QFINAL);
    }
    {Operadores} {
        throw new RuntimeException("[QNUMERO] Caractere inválido: " + yytext());
    }
    <<EOF>> {
        throw new RuntimeException("[EOF] Expressão inválida.");
    }
}

<QFINAL> {
    {Operadores} {
        System.out.println("Numero: " + yytext());
        yybegin(QNUMERO);
    }
    {Numero} {
        throw new RuntimeException("[QFINAL] Caractere inválido: " + yytext());
    }
    {NovaExpressao} {
        yybegin(YYINITIAL);
    }
}

