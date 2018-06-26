
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class EventoAcao extends JFrame implements ActionListener {

    JLabel L1;
    JButton B1, B2;
    int i1 = 0, i2 = 0;

    public EventoAcao() {
        setTitle("Eventos de Ação");
        setSize(250, 200);
        setVisible(true);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        
        B1 = new JButton("Gravar");
        B1.setBounds(10, 10, 100, 30);
        B1.addActionListener(this);
        B2 = new JButton("Sair");
        B2.setBounds(120, 10, 100, 30);
        B2.addActionListener(this);
        L1 = new JLabel("Pressione os botões");
        L1.setBounds(5, 50, 220, 20);

        this.add(B1);
        this.add(B2);
        this.add(L1);
    }

    public void actionPerformed(ActionEvent evt) {
        if (evt.getSource() == B1) {
            i1++;
            L1.setText("Gravar pressionado " + i1 + " vez(es)");
        } else if (evt.getSource() == B2) {
            i2++;
            L1.setText("Sair pressionado " + i2 + " vez(es)");
        }
    }

    public static void main(String args[]) {
        EventoAcao exemplo = new EventoAcao();
    }

}
