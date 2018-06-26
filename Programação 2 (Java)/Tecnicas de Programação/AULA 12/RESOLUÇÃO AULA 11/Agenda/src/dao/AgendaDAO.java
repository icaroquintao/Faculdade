package dao;

import java.util.*;
import java.sql.*;

public class AgendaDAO {

    public String gravarContato(Contato c) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();            
            String sql = "INSERT INTO agenda(nome, telefone) VALUES (?,?)";            
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, c.getNome());
            pstmt.setString(2, c.getTelefone());
                    
            int retorno = pstmt.executeUpdate();            
            pstmt.close();
            con.close();
            resp = "OK";
        } catch (Exception e) {
            resp = e.toString();
        }
        return resp;
    }
    
    public String alterarContato(Contato c) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            
            String sql = "UPDATE agenda SET nome=?, telefone=? WHERE id=?";
            
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, c.getNome());
            pstmt.setString(2, c.getTelefone());
            pstmt.setInt(3, c.getId());           
                                
            int retorno = pstmt.executeUpdate();            
            pstmt.close();
            con.close();
            resp = "OK";
        } catch (Exception e) {
            resp = e.toString();
        }
        return resp;
    }

    public Contato getContato(int id) {
        Contato c = new Contato();        
        try {
            Connection con = Conecta.getConexao();            
            String sql = "SELECT * FROM agenda WHERE id = ?";            
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);                    
            ResultSet rs = pstmt.executeQuery();            
            if (rs.next()) {
                c.setNome(rs.getString("nome"));
                c.setTelefone(rs.getString("telefone"));
                c.setId(id);                
            } else {
                c = null;
            }            
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            c = null;
        }        
        return c;
    }
    
   public boolean delContato(int id) {
        try {
            Connection con = Conecta.getConexao();
            
            String sql = "DELETE FROM agenda WHERE id = ?";
            
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
    
    public List<Contato> listarContatos() {
        List lista = new ArrayList<Contato>();
	try {
            Connection con = Conecta.getConexao();                   
            String sql = "SELECT * FROM agenda ORDER BY nome";

            PreparedStatement pstmt = con.prepareStatement(sql);              
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Contato c = new Contato();
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                c.setTelefone(rs.getString("telefone"));                
                lista.add(c);
            }        
        } catch (Exception e) {
            return null;
        } 
        return lista;    
    }
    
    public int getLastCodigo(){
        try {
            Connection con = Conecta.getConexao();            
            String sql = "SHOW TABLE STATUS WHERE NAME = 'agenda'";            
            PreparedStatement pstmt = con.prepareStatement(sql);                                
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            int qtd = rs.getInt("Auto_increment");
            pstmt.close();
            con.close();            
            return qtd;
        } catch (Exception e) {
            return -1;
        }         
    } 
}