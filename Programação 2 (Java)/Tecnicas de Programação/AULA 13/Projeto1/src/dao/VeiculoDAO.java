package dao;

import java.sql.*;
import java.util.*;

public class VeiculoDAO {
    
    public String gravarVeiculo(Veiculo v) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();            
            String sql = "INSERT INTO veiculos(referencia, marca, modelo, ano, preco) VALUES (?,?,?,?,?)";            
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1,v.getReferencia());
            pstmt.setInt(2,v.getMarca());
            pstmt.setString(3,v.getModelo());
            pstmt.setInt(4,v.getAno());
            pstmt.setFloat(5,v.getPreco());
                                
            int retorno = pstmt.executeUpdate();            
            pstmt.close();
            con.close();
            resp = "OK";
        } catch (Exception e) {
            resp = e.toString();
        }
        return resp;
    }
    
    public List<Veiculo> listarVeiculos(int marca) {
        List lista = new ArrayList<Veiculo>();
	try {
            Connection con = Conecta.getConexao();                   
            String sql = "SELECT * FROM veiculos WHERE marca = ? ORDER BY referencia";

            PreparedStatement pstmt = con.prepareStatement(sql);              
            pstmt.setInt(1, marca);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Veiculo v = new Veiculo();
                v.setReferencia(rs.getString("referencia"));
                v.setMarca(rs.getInt("marca"));
                v.setModelo(rs.getString("modelo"));                
                v.setAno(rs.getInt("ano"));
                v.setPreco(rs.getFloat("preco"));
                lista.add(v);
            }        
        } catch (Exception e) {
            return null;
        } 
        return lista;    
    }
}
