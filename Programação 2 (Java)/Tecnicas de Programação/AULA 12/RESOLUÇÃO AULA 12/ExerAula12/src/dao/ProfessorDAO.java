package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProfessorDAO {
    
    public Professor getProf(int numProf) {
        Professor p = new Professor();        
        try {
            Connection con = Conecta.getConexao();            
            String sql = "SELECT * FROM professores WHERE NúmProf = ?";            
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, numProf);                    
            ResultSet rs = pstmt.executeQuery();            
            if (rs.next()) {
                p.setNumProf(rs.getInt("NúmProf"));
                p.setNomeProf(rs.getString("NomeProf"));
                p.setSalarioProf(rs.getFloat("SalárioProf"));                
                p.setSexoProf(rs.getString("SexoProf").charAt(0));
                p.setNumDepto(rs.getInt("NúmDepto"));
                p.setCategoria(rs.getString("Categoria").charAt(0));
            } else {
                p = null;
            }            
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            p = null;
        }        
        return p;
    }
    
    
    public List<Professor> listarProfs(int numdepto) {
        List lista = new ArrayList<Depto>();
	try {
            Connection con = Conecta.getConexao();                   
            String sql = "SELECT * FROM professores WHERE NúmDepto = ? ORDER BY NomeProf";

            PreparedStatement pstmt = con.prepareStatement(sql);              
            pstmt.setInt(1, numdepto);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Professor p = new Professor();
                p.setNumProf(rs.getInt("NúmProf"));
                p.setNomeProf(rs.getString("NomeProf"));
                p.setSalarioProf(rs.getFloat("SalárioProf"));                
                p.setSexoProf(rs.getString("SexoProf").charAt(0));
                p.setNumDepto(rs.getInt("NúmDepto"));
                p.setCategoria(rs.getString("Categoria").charAt(0));
                lista.add(p);
            }        
        } catch (Exception e) {
            return null;
        } 
        return lista;    
    }
}
