
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;


public class EventoFoco extends JFrame implements FocusListener{
    JLabel L1,L2;
    JButton B1,B2,B3;
    
    public EventoFoco(){
        setLayout(null);
        setSize(330,150);
        setTitle("Eventos em foco");
        setVisible(true);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        
        B1=new JButton("Botão 1");
        B1.setBounds(10,10,100,30);
        B1.addFocusListener(this);
        
        B2=new JButton("Botão 2");
        B2.setBounds(110,10,100,30);
        B2.addFocusListener(this);
        
        B3=new JButton("Botão 3");
        B3.setBounds(210,10,100,30);
        B3.addFocusListener(this);
        
        L1 = new JLabel();
        L1.setBounds(10,50,280,20);
        L2 = new JLabel();
        L2.setBounds(10,70,280,20);
        
        getContentPane().add(B1);
        getContentPane().add(B2);
        getContentPane().add(B3);
        getContentPane().add(L2);
        getContentPane().add(L1);
    }
    
    @Override
    public void focusGained(FocusEvent e) {
        if (e.getSource()==B1) L1.setText("B1 recebeu o foco");
        if (e.getSource()==B2) L1.setText("B2 recebeu o foco");
        if (e.getSource()==B3) L1.setText("B3 recebeu o foco");
    }

    @Override
    public void focusLost(FocusEvent e) {
        if (e.getSource()==B1) L2.setText("B1 perdeu o foco");
        if (e.getSource()==B2) L2.setText("B2 perdeu o foco");
        if (e.getSource()==B3) L2.setText("B3 perdeu o foco");
    }
    
    public static void main(String args[]) {
        EventoFoco exemplo = new EventoFoco();
    }
}
