
import javax.swing.*;
import java.awt.*;

public class Janela2 extends JFrame {

    private JTextArea texto = new JTextArea("Texto Qualquer");

    public Janela2() {
        setTitle("Minha segunda janela");
        setSize(200, 200);
        setVisible(true);
        texto.setForeground(Color.red);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.add(texto);        
    }

    public static void main(String args[]) {
        new Janela2();
    }
}
