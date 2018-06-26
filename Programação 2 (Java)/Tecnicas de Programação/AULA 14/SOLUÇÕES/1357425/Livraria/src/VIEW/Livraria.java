/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VIEW;

import DAO.Categoria;
import DAO.CategoriaDAO;
import DAO.Livro;
import DAO.LivroDAO;
import java.util.List;


import javax.swing.DefaultListModel;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Sandro
 */
public class Livraria extends javax.swing.JFrame {

    /**
     * Creates new form Livraria
     */
    public Livraria() {        
        initComponents();
        carregarCategoria();        
        jTextField1.setText(new LivroDAO().getLastCodigo()+"");
       
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane2 = new javax.swing.JScrollPane();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jTextField2 = new javax.swing.JTextField();
        jTextField3 = new javax.swing.JTextField();
        jTextField4 = new javax.swing.JTextField();
        jComboBox1 = new javax.swing.JComboBox();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(null);

        jPanel1.setLayout(null);

        jLabel1.setText("Codigo do Livro:");
        jPanel1.add(jLabel1);
        jLabel1.setBounds(30, 20, 90, 14);

        jLabel2.setText("Titulo:");
        jPanel1.add(jLabel2);
        jLabel2.setBounds(30, 60, 80, 14);

        jLabel3.setText("Autor:");
        jPanel1.add(jLabel3);
        jLabel3.setBounds(30, 100, 80, 14);

        jLabel4.setText("Categoria:");
        jPanel1.add(jLabel4);
        jLabel4.setBounds(30, 140, 80, 14);

        jLabel5.setText("Valor:");
        jPanel1.add(jLabel5);
        jLabel5.setBounds(30, 170, 80, 30);

        jTextField1.setBackground(javax.swing.UIManager.getDefaults().getColor("Button.light"));
        jTextField1.setEnabled(false);
        jPanel1.add(jTextField1);
        jTextField1.setBounds(130, 10, 150, 30);
        jTextField1.getAccessibleContext().setAccessibleParent(this);

        jPanel1.add(jTextField2);
        jTextField2.setBounds(130, 50, 150, 30);

        jTextField3.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTextField3MouseClicked(evt);
            }
        });
        jTextField3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField3ActionPerformed(evt);
            }
        });
        jPanel1.add(jTextField3);
        jTextField3.setBounds(130, 90, 150, 30);

        jTextField4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField4ActionPerformed(evt);
            }
        });
        jPanel1.add(jTextField4);
        jTextField4.setBounds(130, 170, 150, 30);

        jComboBox1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jComboBox1MouseClicked(evt);
            }
        });
        jComboBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox1ActionPerformed(evt);
            }
        });
        jPanel1.add(jComboBox1);
        jComboBox1.setBounds(130, 130, 150, 30);

        jButton1.setText("Incluir");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton1);
        jButton1.setBounds(350, 30, 90, 23);

        jButton2.setText("Excluir");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton2);
        jButton2.setBounds(350, 80, 90, 23);

        jButton3.setText("Consultar");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton3);
        jButton3.setBounds(350, 130, 90, 23);

        getContentPane().add(jPanel1);
        jPanel1.setBounds(10, 0, 480, 210);

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Cod. Livro", "Titulo", "Autor", "Categoria", "Valor"
            }
        ));
        jScrollPane1.setViewportView(jTable1);

        getContentPane().add(jScrollPane1);
        jScrollPane1.setBounds(20, 230, 480, 160);

        setBounds(0, 0, 534, 451);
    }// </editor-fold>//GEN-END:initComponents

    private void jComboBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox1ActionPerformed
       
    }//GEN-LAST:event_jComboBox1ActionPerformed

    private void jComboBox1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jComboBox1MouseClicked
       
    }//GEN-LAST:event_jComboBox1MouseClicked

    private void jTextField3MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTextField3MouseClicked
        // TODO add your handling code here
             
    }//GEN-LAST:event_jTextField3MouseClicked

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:
        float valor = Float.parseFloat(jTextField4.getText());
        DefaultTableModel modelo = (DefaultTableModel) jTable1.getModel();
        List<Livro> lista = new LivroDAO().listarLivrosporValor(valor);        
        modelo.setNumRows(0);
        for (int i=0; i<lista.size(); i++){
        modelo.addRow(new String[]{ lista.get(i).getCodlivro()+"",
                                    lista.get(i).getTitulo(),
                                    lista.get(i).getAutor(),
                                    lista.get(i).getCategoria()+"",
                                    lista.get(i).getValor()+""});
    }
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        Livro l = montaLivro();
        String resp = new LivroDAO().gravarLivro(l);
        
        if(resp.equals("OK")){
            JOptionPane.showMessageDialog(null, "Livro Gravado Com Sucesso.");
            carregarLivros();
        }
        else{
        JOptionPane.showMessageDialog(null, resp);
    }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jTextField4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField4ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField4ActionPerformed

    private void jTextField3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField3ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField3ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        if (jTable1.getSelectedRow() <0){
            JOptionPane.showMessageDialog(null, "Selecione um registro.");
        }
        else{
            if (new LivroDAO().delContato(Integer.parseInt(
                                                        jTable1.getModel().getValueAt(
                                                            jTable1.getSelectedRow(), 0).toString()))){            
                JOptionPane.showMessageDialog(null, "Registro excluído.");
                carregarLivros();
            }
            else{
                JOptionPane.showMessageDialog(null, "Registro não encontrado.");
            }
        } 
    }//GEN-LAST:event_jButton2ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Livraria.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Livraria.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Livraria.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Livraria.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                new Livraria().setVisible(true);
            }
        });
    }
    
   
    public void carregarCategoria(){
        DefaultListModel listat = new DefaultListModel();
        List<Categoria> lista = new CategoriaDAO().listarCategoria();
        idTipo = new String[lista.size()];
        for(int i=0; i<lista.size(); i++){
            jComboBox1.addItem(lista.get(i).getCategoria());
            listat.addElement(lista.get(i).getCategoria());
            idTipo[i] = lista.get(i).getId();
        }
    }
    
    public void carregarLivros(){
       DefaultTableModel modelo = (DefaultTableModel) jTable1.getModel();
       List<Livro> lista = new LivroDAO().listarLivro();       
       modelo.setNumRows(0);
       for (int i=0; i<lista.size(); i++){
        modelo.addRow(new String[]{ lista.get(i).getCodlivro()+"",
                                    lista.get(i).getTitulo(),
                                    lista.get(i).getAutor(),
                                    lista.get(i).getCategoria()+"",
                                    lista.get(i).getValor()+""});
       }
    }
         
    public Livro montaLivro(){
        Livro l = new Livro();
        l.setCodlivro(Integer.parseInt(jTextField1.getText()));
        l.setTitulo(jTextField2.getText());
        l.setAutor(jTextField3.getText());
        l.setCategoria(idTipo[jComboBox1.getSelectedIndex()]);
        l.setValor(Float.parseFloat(jTextField4.getText()));
        return l;
    }
        
    
    
    String idTipo[];
    int valorLivros[];
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JComboBox jComboBox1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField jTextField2;
    private javax.swing.JTextField jTextField3;
    private javax.swing.JTextField jTextField4;
    // End of variables declaration//GEN-END:variables
}
