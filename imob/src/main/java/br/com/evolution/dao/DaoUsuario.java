package br.com.evolution.dao;

import br.com.evolution.conexao.Conexao;
import br.com.evolution.model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoUsuario {

    public List<Usuario> listar() throws ClassNotFoundException, SQLException {

        List<Usuario> lista = new ArrayList<Usuario>();

        try (Connection con = Conexao.obterConexao();
                PreparedStatement stmt = con.prepareStatement("SELECT * FROM imobiliariadb.USUARIO");
                ResultSet resultados = stmt.executeQuery();) {

            while (resultados.next()) {
                Integer id = resultados.getInt("idUsuario");
                String nome = resultados.getString("nome");
//                String email = resultados.getString("email");
                String login = resultados.getString("login");
                String senha = resultados.getString("senha");
                String grupoFilial = resultados.getString("grupoFilial");
                String departamento = resultados.getString("departamento");
                String cargo = resultados.getString("cargo");

                Usuario user = new Usuario();
                user.setIdUsuario(id);
                user.setNome(nome);
//                user.setEmail(email);
                user.setLogin(login);
                user.setSenha(senha);
                user.setGrupoFilial(grupoFilial);
                user.setDepartamento(departamento);
                user.setCargo(cargo);
                lista.add(user);
            }
        }
        return lista;
    }

    public void iserir(Usuario usuario) throws SQLException {

        String sql = "INSERT INTO imobiliariadb.USUARIO (nome,login,senha,grupoFilial,departamento,cargo) "
                + "VALUES (?,?,?,?,?,?)";
        Connection conn = null;
        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getLogin());
            stmt.setString(3, usuario.getSenha());
            stmt.setString(4, usuario.getGrupoFilial());
            stmt.setString(5, usuario.getDepartamento());
            stmt.setString(6, usuario.getCargo());
            stmt.execute();

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }

    }

}
