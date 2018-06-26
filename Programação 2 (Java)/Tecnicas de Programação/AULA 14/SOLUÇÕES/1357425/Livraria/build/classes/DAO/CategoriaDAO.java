package DAO;

import java.sql.*;
import java.util.*;

public class CategoriaDAO {
    
    public List<Categoria> listarCategoria(){
        List lista = new ArrayList<Categoria>();
        try{
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM categorias ORDER BY categoria";
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Categoria c = new Categoria();
                c.setId(rs.getString("id"));
                c.setCategoria(rs.getString("categoria"));
                lista.add(c);
            }
        }
        catch (Exception e){
            return null;
        }
        return lista;
    }    
}