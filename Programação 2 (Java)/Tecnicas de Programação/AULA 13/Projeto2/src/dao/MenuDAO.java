package dao;

import java.sql.*;
import java.util.*;

public class MenuDAO {
    public String gravarMenu(Menu m) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();            
            String sql = "INSERT INTO menu(codigo, tipo, nome, preco) VALUES (?,?,?,?)";            
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,m.getCodigo());
            pstmt.setString(2,m.getTipo());
            pstmt.setString(3,m.getNome());
            pstmt.setFloat(4,m.getPreco());
                                
            int retorno = pstmt.executeUpdate();            
            pstmt.close();
            con.close();
            resp = "OK";
        } catch (Exception e) {
            resp = e.toString();
        }
        return resp;
    }
    
    
    public List<Menu> listarMenus(String tipo) {
        List lista = new ArrayList<Menu>();
	try {
            Connection con = Conecta.getConexao();                   
            String sql = "SELECT * FROM menu WHERE tipo = ? ORDER BY nome";

            PreparedStatement pstmt = con.prepareStatement(sql);              
            pstmt.setString(1, tipo);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Menu m = new Menu();
                m.setCodigo(rs.getInt("codigo"));
                m.setTipo(rs.getString("tipo"));
                m.setNome(rs.getString("nome"));                
                m.setPreco(rs.getFloat("preco"));
                lista.add(m);
            }        
        } catch (Exception e) {
            return null;
        } 
        return lista;    
    }
}
