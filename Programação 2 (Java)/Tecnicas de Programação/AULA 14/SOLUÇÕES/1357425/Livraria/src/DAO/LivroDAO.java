/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sandro
 */
public class LivroDAO {
    public String gravarLivro(Livro l){
        String resp = "";
        try{
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO livros(codlivro, titulo, autor, categoria, valor) VALUES(?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,l.getCodlivro());
            pstmt.setString(2,l.getTitulo());
            pstmt.setString(3,l.getAutor());
            pstmt.setString(4,l.getCategoria());
            pstmt.setFloat(5,l.getValor());
            
            int retorno = pstmt.executeUpdate();
            pstmt.close();
            con.close();
            resp = "OK";
        }
        catch(Exception e){
            resp = e.toString();
        }
        return resp;
    }
    
    public List<Livro> listarLivrosporValor(float  valor){
      List lista = new ArrayList<Livro>();
      try{
          Connection con = Conecta.getConexao();
          
          String sql = "SELECT * from livros where valor <= ? ORDER BY codlivro";          
          PreparedStatement pstmt = con.prepareStatement(sql);
          pstmt.setFloat(1, valor);
          ResultSet rs = pstmt.executeQuery();           
          while (rs.next()){
              Livro l = new Livro();
              l.setCodlivro(rs.getInt("codlivro"));
              l.setTitulo(rs.getString("titulo"));
              l.setAutor(rs.getString("autor"));
              l.setCategoria(rs.getString("categoria"));
              l.setValor(rs.getFloat("valor"));
              lista.add(l);
          }          
      }
      catch (Exception e){
          return null;
      }
      return lista;
    }
    
    

    public List<Livro> listarLivro() {
         List lista = new ArrayList<Livro>();
              try{
          Connection con = Conecta.getConexao();
          String sql = "SELECT * from livros ORDER BY codlivro";
          PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Livro l = new Livro();
                l.setCodlivro(rs.getInt("codlivro"));
                l.setTitulo(rs.getString("Titulo"));
                l.setAutor(rs.getString("autor"));
                l.setCategoria(rs.getString("categoria"));
                l.setValor(rs.getFloat("valor"));
                lista.add(l);
        }
      }
      catch (Exception e){
          return null;
      }
      return lista;
    }
    
    public int getLastCodigo(){
        try{
            Connection con = Conecta.getConexao();            
            String sql = "SHOW TABLE STATUS WHERE NAME = 'livros'";            
            PreparedStatement pstmt = con.prepareStatement(sql);                                
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            int qtd = rs.getInt("Auto_increment");
            pstmt.close();
            con.close();            
            return qtd;            
        }
        catch (Exception e){
            
        }
        return -1;
    }
    public boolean delContato(int id) {
        try {
            Connection con = Conecta.getConexao();
            
            String sql = "DELETE FROM livros WHERE codlivro = ?";
            
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
                    
            int retorno = pstmt.executeUpdate();            
            pstmt.close();
            con.close();            
            return true;
        } catch (Exception e) {
            return false;
        }  
    }
    
}
