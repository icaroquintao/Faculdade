package dao;

import bean.Aluno;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class AlunoDAO {

    public String gravarAluno(Aluno aluno) {

        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO dados(rgm, nome, nota1, nota2) ";
            sql += "VALUES ('" + aluno.getRGM() + "', '" + aluno.getNome() + "',";
            sql += aluno.getNota1() + ", " + aluno.getNota2() + ")";

            stmt.executeUpdate(sql);
            
            stmt.close();
            con.close();

            resp = "OK";
        } catch (Exception e) {
            resp = e.toString();
        }

        return resp;
    }

    /**
     * Pesquisa um aluno pelo RGM
     *
     * @param rgm RGM a ser pesquisado
     * @return
     */
    public Aluno getAluno(String rgm) {

        Aluno aluno = new Aluno();
        
        try {
            Connection con = Conecta.getConexao();
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM dados WHERE rgm='" + rgm + "'";
            ResultSet rs = stmt.executeQuery(sql);
            
            if (rs.next()) {
                aluno.setNome(rs.getString("nome"));
                aluno.setRGM(rs.getString("rgm"));
                aluno.setNota1(rs.getFloat("nota1"));
                aluno.setNota2(rs.getFloat("nota2"));
            } else {
                aluno = null;
            }
            
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            aluno = null;
        }
        
        return aluno;
    }
}
