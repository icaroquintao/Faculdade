/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.util.*;
import java.sql.*;

public class DeptoDAO {
    
    
     public List<Depto> listarDeptos() {
        List lista = new ArrayList<Depto>();
	try {
            Connection con = Conecta.getConexao();                   
            String sql = "SELECT * FROM departamentos ORDER BY NomeDepto";

            PreparedStatement pstmt = con.prepareStatement(sql);              
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Depto d = new Depto();
                d.setNumDepto(rs.getInt("NúmDepto"));
                d.setNomeDepto(rs.getString("NomeDepto"));
                d.setNomeCentro(rs.getString("NomeCentro"));                
                lista.add(d);
            }        
        } catch (Exception e) {
            return null;
        } 
        return lista;    
    }
}
