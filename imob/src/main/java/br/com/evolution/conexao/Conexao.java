package br.com.evolution.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author 
 */
public class Conexao {

    static public Connection obterConexao() throws ClassNotFoundException, SQLException {

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/imobiliariadb", "root", "rodrigoo");
        return con;
    }
}
//  
