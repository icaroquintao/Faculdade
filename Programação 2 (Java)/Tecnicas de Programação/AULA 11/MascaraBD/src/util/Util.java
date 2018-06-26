
package util;

public class Util {

    public static String formataData(String data) {
        if (data != null && data.length() >= 10) {
            String ano = data.substring(0, 4);
            String mes = data.substring(5, 7);
            String dia = data.substring(8, 10);

            return dia + "/" + mes + "/" + ano;
        } else {
            return "";
        }
    }

    public static String formataDataInvertida(String data) {
        //Se veio nula, não tratar
        if (data == null) {
            return null;
        }
        if (data.length() >= 10) {
            String dia = data.substring(0, 2);
            String mes = data.substring(3, 5);
            String ano = data.substring(6, 10);

            return ano + "-" + mes + "-" + dia;
        } else {
            return "";
        }
    }
}
