package dao;
import java.sql.*;
import java.util.ArrayList;
import util.Util;

public class PacienteDAO {
    
    public String gravarPaciente(Paciente p) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();            
            String sql = "INSERT INTO pacientes(paciente, nascimento, sexo) VALUES (?,?,?) ";            
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, p.getPaciente());
            pstmt.setString(2, util.Util.formataDataInvertida(p.getNascimento()));
            pstmt.setString(3, p.getSexo());                                
            int retorno = pstmt.executeUpdate();            
            pstmt.close();
            con.close();
            resp = "OK";
        } catch (Exception e) {
            resp = e.toString();
        }
        return resp;
    }
    
    
    public boolean delPaciente(int cod) {
        try {
            Connection con = Conecta.getConexao();            
            String sql = "DELETE FROM pacientes WHERE codigo = ?";            
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, cod);                    
            int retorno = pstmt.executeUpdate();            
            pstmt.close();
            con.close();            
            return true;
        } catch (Exception e) {
            return false;
        }  
    }
    
    public int getLastCodigo(){
        try {
            Connection con = Conecta.getConexao();            
            String sql = "SHOW TABLE STATUS WHERE NAME = 'pacientes'";            
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
    
    public ArrayList<Paciente> listaPacientes() {
        ArrayList<Paciente> lista = new ArrayList<Paciente>();
        try {
            Connection con = Conecta.getConexao();            
            String sql = "SELECT * FROM pacientes ORDER BY paciente";
            PreparedStatement pstmt = con.prepareStatement(sql);            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Paciente p = new Paciente();
                p.setCodigo(rs.getInt("codigo"));
                p.setPaciente(rs.getString("paciente"));
                p.setNascimento(Util.formataData(rs.getString("nascimento")));
                p.setSexo(rs.getString("sexo"));                
                lista.add(p);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("ERRO: " + e.toString());
        }
        return lista;
    }
}
