package br.senac.tads.pi3b.agenda;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 * @author luana.mpereira5
 */
public class Agenda {

    private Connection obterConexao() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/agendadb", "root", "");
        return conn;
    }

    public void listar() throws ClassNotFoundException, SQLException {
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet resultados = null;

        // 1)Abrindo conexão com o banco de dados
        // 1.1) Declarar o driver jdbc de acordo com o banco de dados usado
//        Class.forName("com.mysql.jdbc.Driver");
        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement("SELECT id,nome,dtnasc FROM agendadb.PESSOA");
                ResultSet resultados = stmt.executeQuery();) {
//            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/agendadb", "root", "");

            // 2) executar as ações do db
//            stmt = conn.prepareStatement("SELECT id,nome,dtnasc FROM agendadb.PESSOA");
//            resultados = stmt.executeQuery();
            while (resultados.next()) {
                long id = resultados.getLong("id");
                String nome = resultados.getString("nome");
                Date dtnasc = resultados.getDate("dtnasc");

                System.out.println(id + ", " + nome + ", " + dtnasc);
            }

//        } finally {
//            // 3) fechar conexão
//            if (resultados != null) {
//                resultados.close();
//            }
//            if (stmt != null) {
//                stmt.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
        }
    }

    public void incluir() throws ClassNotFoundException, SQLException {
        try (Connection conn = obterConexao();
                PreparedStatement stmt = conn.prepareStatement("INSERT INTO agendadb.PESSOA (nome,dtnasc) VALUES (?,?)")) {
            stmt.setString(1, "Matheus");
            GregorianCalendar cal = new GregorianCalendar(2007, 11, 27);
            stmt.setDate(2, new java.sql.Date(cal.getTimeInMillis()));

            int status = stmt.executeUpdate();

            System.out.println("status: " + status);
        }

    }

    public static void main(String[] args) {
        Agenda agenda = new Agenda();
        try {
            agenda.listar();
            agenda.incluir();

        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

}
