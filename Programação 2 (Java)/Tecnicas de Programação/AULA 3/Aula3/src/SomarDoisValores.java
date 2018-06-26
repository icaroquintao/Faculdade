
import javax.swing.*;
import java.awt.event.*;
import java.awt.*;

public class SomarDoisValores extends JFrame implements ActionListener {

    JButton btn1 = new JButton("Somar"),
            btn2 = new JButton("Multiplicar"),
            btn3 = new JButton("Dividir");

    JLabel lbl1 = new JLabel("Digite 1o. valor:"),
            lbl2 = new JLabel("Digite 2o. valor:"),
            lbl3 = new JLabel("Resultado da operação:");

    JTextField txt1 = new JTextField(6),
            txt2 = new JTextField(6);

    public SomarDoisValores() {

        getContentPane().setLayout(null); // especificamos a forma de colocação
        // de componentes na janela : layout nulo

        setDefaultCloseOperation(EXIT_ON_CLOSE);

        getContentPane().add(lbl1);
        lbl1.setBounds(40, 50, 94, 14);   //parâmetros: x,y,largura,altura do objeto

        getContentPane().add(txt1);
        txt1.setBounds(150, 50, 62, 19);

        getContentPane().add(lbl2);
        lbl2.setBounds(40, 80, 94, 14);

        getContentPane().add(txt2);
        txt2.setBounds(150, 80, 62, 19);

        getContentPane().add(btn1);
        btn1.setBounds(80, 120, 76, 23);
        getContentPane().add(btn2);
        btn2.setBounds(180, 120, 100, 23);
        getContentPane().add(btn3);
        btn3.setBounds(304, 120, 76, 23);

        getContentPane().add(lbl3);
        lbl3.setBounds(40, 165, 220, 23);

        btn1.addActionListener(this);
        btn2.addActionListener(this);
        btn3.addActionListener(this);
    }

    public void actionPerformed(ActionEvent evento) {
        float a = 0, b = 0, res = 0;
        a = Float.parseFloat(txt1.getText());
        b = Float.parseFloat(txt2.getText());

        if (evento.getSource() == btn1) {
            res = a + b;
        }
        if (evento.getSource() == btn2) {
            res = a * b;
        }
        if (evento.getSource() == btn3) {
            res = a / b;
        }

        lbl3.setText("Resultado da operação:  " + res);
    }

    public static void main(String args[]) {
        SomarDoisValores jan = new SomarDoisValores();
        jan.setSize(500, 265);
        jan.setLocation(200, 200);
        jan.setTitle("Esta janela tem layout nulo e atende eventos de ação");
        jan.setVisible(true);
    }

}
