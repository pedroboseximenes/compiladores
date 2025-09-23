package utils;

public class Utils {
    public static Token createToken(Symbol type, int line, int column) {
        return new Token(type, line, column);
    }

    public static Token createToken(Symbol type, Object value, int line, int column) {
        return new Token(type, value, line, column);
    }
}
