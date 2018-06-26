package dao;

import java.sql.*;
import java.util.*;

public class MarcaDAO {
    public List<Marca> listarMarcas() {
        List lista = new ArrayList<Marca>();
	try {
            Connection con = Conecta.getConexao();                   
            String sql = "SELECT * FROM marcas ORDER BY marca";

            PreparedStatement pstmt = con.prepareStatement(sql);              
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Marca m = new Marca();
                m.setId(rs.getInt("id"));
                m.setMarca(rs.getString("marca"));                
                lista.add(m);
            }        
        } catch (Exception e) {
            return null;
        } 
        return lista;    
    }
}
