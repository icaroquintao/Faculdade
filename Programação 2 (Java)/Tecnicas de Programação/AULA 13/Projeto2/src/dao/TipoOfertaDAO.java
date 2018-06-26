package dao;

import java.sql.*;
import java.util.*;

public class TipoOfertaDAO {
    
    public List<TipoOferta> listarTipos() {
        List lista = new ArrayList<TipoOferta>();
	try {
            Connection con = Conecta.getConexao();                   
            String sql = "SELECT * FROM tiposofertas ORDER BY descricao";

            PreparedStatement pstmt = con.prepareStatement(sql);              
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                TipoOferta t = new TipoOferta();
                t.setTipo(rs.getString("tipo"));
                t.setDescricao(rs.getString("descricao"));                
                lista.add(t);
            }        
        } catch (Exception e) {
            return null;
        } 
        return lista;    
    }
}
