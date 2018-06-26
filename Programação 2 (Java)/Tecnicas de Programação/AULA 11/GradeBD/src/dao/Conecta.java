package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conecta {

    /**
     * Devolve a conexão com o banco de dados
     *
     * @return
     */
    public static Connection getConexao() {
        Connection con = null;

        try {
            String serverName = "localhost";
            String mydatabase = "alunos";

            String username = "root";
            String password = "";

            String driverName = "com.mysql.jdbc.Driver";
            Class.forName(driverName);

            String url = "jdbc:mysql://" + serverName + "/" + mydatabase;
            con = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            System.out.println("Driver não encontrado " + e.toString());
        } catch (SQLException e) {
            System.out.println("Erro ao conectar o Banco de Dados " + e.toString());
        }

        return con;
    }
}
