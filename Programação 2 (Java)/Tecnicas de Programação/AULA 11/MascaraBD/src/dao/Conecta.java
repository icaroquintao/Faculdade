package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conecta {
    public static Connection getConexao() {
        try {
            //Configura servidor de Banco de Dados e nome do Banco
            String serverName = "localhost";
            String mydatabase = "clinica";
            //Login e senha do banco
            String username = "root";
            String password = "";
            // Carregando o JDBC Driver
            String driverName = "com.mysql.jdbc.Driver";
            Class.forName(driverName);
            // Criando a conexão com o Banco de Dados
            String url = "jdbc:mysql://" + serverName + "/" + mydatabase; // a JDBC url
            Connection con = DriverManager.getConnection(url, username, password);
            return con;
        } catch (ClassNotFoundException e) {
            System.out.println("Driver não encontrado: " + e.toString());
        } catch (SQLException e) {
            System.out.println("Erro ao conectar o banco: " + e.toString());
        }
        return null;
    }
}
