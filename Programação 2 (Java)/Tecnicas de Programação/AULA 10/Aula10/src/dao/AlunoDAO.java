package dao;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class AlunoDAO {


    public String gravarAluno(Aluno aluno) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            
            String sql = "INSERT INTO alunos(rgm, nome, curso, email) VALUES (?,?,?,?) ";
            
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, aluno.getRGM());
            pstmt.setString(2, aluno.getNome());
            pstmt.setString(3, aluno.getCurso());
            pstmt.setString(4, aluno.getEmail());           
                    
            int retorno = pstmt.executeUpdate();
            
            pstmt.close();
            con.close();

            resp = "OK";
        } catch (Exception e) {
            resp = e.toString();
        }
        return resp;
    }
    
    /**
     * Altera um aluno no banco de dados
     *
     * @param aluno
     * @return OK para sucesso ou mensagem de erro
     */
    public String alterarAluno(Aluno aluno) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            
            String sql = "UPDATE alunos SET nome=?, curso=?, email=? WHERE rgm=?";
            
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, aluno.getNome());
            pstmt.setString(2, aluno.getCurso());
            pstmt.setString(3, aluno.getEmail());           
            pstmt.setString(4, aluno.getRGM());
                    
            int retorno = pstmt.executeUpdate();
            
            pstmt.close();
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
            
            String sql = "SELECT * FROM alunos WHERE rgm = ?";
            
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, rgm);
                    
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                aluno.setRGM(rs.getString("rgm"));
                aluno.setNome(rs.getString("nome"));
                aluno.setCurso(rs.getString("curso"));
                aluno.setEmail(rs.getString("email"));
            } else {
                aluno = null;
            }
            
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            aluno = null;
        }        
        return aluno;
    }
    
    /**
     * Apaga um aluno pelo RGM
     *
     * @param rgm RGM a ser excluido
     * @return
     */
    public boolean delAluno(String rgm) {
        try {
            Connection con = Conecta.getConexao();
            
            String sql = "DELETE FROM alunos WHERE rgm = ?";
            
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, rgm);
                    
            int retorno = pstmt.executeUpdate();
            
            pstmt.close();
            con.close();
            
            return true;
        } catch (Exception e) {
            return false;
        }  
    }
    
    //seleciona todos os aluno e monta uma lista
    public List<Aluno> listarAlunos() {
        List lista = new ArrayList<Aluno>();
	try {
             Connection con = Conecta.getConexao();        
           
            String sql = "SELECT * FROM alunos ORDER BY nome";

            PreparedStatement pstmt = con.prepareStatement(sql);  
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Aluno aluno = new Aluno();
                aluno.setRGM(rs.getString("rgm"));
                aluno.setNome(rs.getString("nome"));
                aluno.setCurso(rs.getString("curso"));
                aluno.setEmail(rs.getString("email"));
                lista.add(aluno);
            }
        
        } catch (Exception e) {
            return null;
        } 
        return lista;    
    }
}
