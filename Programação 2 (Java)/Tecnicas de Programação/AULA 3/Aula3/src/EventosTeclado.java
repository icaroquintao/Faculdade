
import java.awt.Color;
import java.awt.Cursor;
import java.awt.event.*;
import javax.swing.*;

public class EventosTeclado extends JFrame implements KeyListener {

    JTextArea textArea;
    
    public EventosTeclado() {
        setTitle("Eventos do Teclado");
        setSize(350, 250);
        setVisible(true);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        
        textArea = new JTextArea(100, 150);
        textArea.setEnabled(false);
        textArea.setDisabledTextColor(Color.red);
        getContentPane().add(textArea);
        
        addKeyListener(this);        
    }
    
    @Override
    public void keyPressed(KeyEvent e) {
        String tecla = e.getKeyText(e.getKeyCode());
        int code = e.getKeyCode();
        textArea.setText("Tecla: " + tecla + " - Código Unicode: " + code);
    }
    
    @Override
    public void keyTyped(KeyEvent e) {              
    }
    
    @Override
    public void keyReleased(KeyEvent e) {        
    }
    
    public static void main(String args[]) {
        EventosTeclado exemplo = new EventosTeclado();
    }
}
