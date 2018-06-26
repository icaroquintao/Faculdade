
import java.awt.event.*;
import javax.swing.*;

class RadioButtons extends JFrame implements ActionListener {

    private JRadioButton birdButton, catButton, dogButton,
            rabbitButton, pigButton;
    

    private ImageIcon fig = new ImageIcon(
            getClass().getResource("imagens/loro.jpg"));   

    private JLabel figura = new JLabel(fig);

    public RadioButtons() {

        setDefaultCloseOperation(EXIT_ON_CLOSE);

        //Criamos os botões.
        birdButton = new JRadioButton("Loro");
        birdButton.setMnemonic(KeyEvent.VK_L);//tecla de atalho Alt+Letra
        birdButton.setActionCommand("loro");
        birdButton.setSelected(true);

        catButton = new JRadioButton("Gato");
        catButton.setMnemonic(KeyEvent.VK_G);
        catButton.setActionCommand("gato");

        dogButton = new JRadioButton("Cachorro");
        dogButton.setMnemonic(KeyEvent.VK_C);
        dogButton.setActionCommand("cachorro");

        rabbitButton = new JRadioButton("Coelho");
        rabbitButton.setMnemonic(KeyEvent.VK_H);
        rabbitButton.setActionCommand("coelho");

        pigButton = new JRadioButton("Porco");
        pigButton.setMnemonic(KeyEvent.VK_P);
        pigButton.setActionCommand("porco");
        
        //Temos que especificar o grupo lógico de botões:
        ButtonGroup group = new ButtonGroup();
        group.add(birdButton);
        group.add(catButton);
        group.add(dogButton);
        group.add(rabbitButton);
        group.add(pigButton);

        //Vamos criar o visual: 
        JPanel p = new JPanel();
        p.setLayout(null);
        p.add(birdButton);
        birdButton.setBounds(5, 5, 85, 15);
        p.add(catButton);
        catButton.setBounds(5, 20, 85, 15);
        p.add(dogButton);
        dogButton.setBounds(5, 35, 85, 15);
        p.add(rabbitButton);
        rabbitButton.setBounds(5, 50, 85, 15);
        p.add(pigButton);
        pigButton.setBounds(5, 65, 85, 15);
        getContentPane().setLayout(null);
        getContentPane().add(p);
        p.setBounds(20, 50, 110, 80);
        getContentPane().add(figura);
        figura.setBounds(140, 50, 125, 125);

        //Registramos a atenção a eventos de ação:
        birdButton.addActionListener(this);
        catButton.addActionListener(this);
        dogButton.addActionListener(this);
        rabbitButton.addActionListener(this);
        pigButton.addActionListener(this);
    }   //fim do método construtor

    @Override
    public void actionPerformed(ActionEvent e) {
        figura.setIcon(new ImageIcon(getClass().getResource("imagens/" + e.getActionCommand() + ".jpg")));
       //Aqui podemos identificar o objeto que provocou o evento utilizando
        //o valor em e.getSource() que retornará birdButton, catButton etc.
        if (e.getSource() == catButton) {
            JOptionPane.showMessageDialog(null, "Você selecionou o gato...");
        }
    }

    
     public static void main(String args[]) {
        RadioButtons jan = new RadioButtons();
        jan.setSize(390, 300);
        jan.setLocation(200, 200);
        jan.setTitle("Exemplo com objetos da classe JRadioButton");
        jan.setVisible(true);
    }
} // fim da classe RadioButtons


