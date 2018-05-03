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
        
        String sql = "SELECT * FROM imobiliariadbTESTE.USUARIO WHERE enable=?";
        
        List<Usuario> lista = new ArrayList<Usuario>();
        
        Connection conn = null;
        
        //Armazenará os resultados do banco de dados
        //ResultSet resultados = null;        

        try 
            //(Connection con = Conexao.obterConexao();
            //   PreparedStatement stmt = con.prepareStatement("SELECT * FROM imobiliariadbTESTE.USUARIO");
            //    ResultSet resultados = stmt.executeQuery();) 
        {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setBoolean(1, true);
            //Armazenará os resultados do banco de dados
            ResultSet resultados = stmt.executeQuery();          

            while (resultados.next()) {
                Integer id = resultados.getInt("idUsuario");
                String nome = resultados.getString("nome");
                String email = resultados.getString("email");
                String login = resultados.getString("login");
                String senha = resultados.getString("senha");
                String grupoFilial = resultados.getString("grupoFilial");
                String departamento = resultados.getString("departamento");
                String cargo = resultados.getString("cargo");

                Usuario user = new Usuario();
                user.setIdUsuario(id);
                user.setNome(nome);
                user.setEmail(email);
                user.setLogin(login);
                user.setSenha(senha);
                user.setGrupoFilial(grupoFilial);
                user.setDepartamento(departamento);
                user.setCargo(cargo);
                lista.add(user);
            }
        }catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }
        return lista;
    }

    public void inserir(Usuario usuario) throws SQLException {

        String sql = "INSERT INTO imobiliariadbTESTE.USUARIO (nome,login,senha,email,grupoFilial,departamento,cargo,enable) "
                + "VALUES (?,?,?,?,?,?,?,?)";
        Connection conn = null;
        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getLogin());
            stmt.setString(3, usuario.getSenha());
            stmt.setString(4, usuario.getEmail());
            stmt.setString(5, usuario.getGrupoFilial());
            stmt.setString(6, usuario.getDepartamento());
            stmt.setString(7, usuario.getCargo());
            stmt.setBoolean(8, true);
            stmt.execute();

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }

    }

    public void atualizar(Usuario usuario) throws SQLException {

        String sql = "UPDATE imobiliariadbTESTE.USUARIO SET "
                + "nome=?,login=?,senha=?,email=?,grupoFilial=?,departamento=?,cargo=? WHERE idUsuario=? ";
        Connection conn = null;
        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getLogin());
            stmt.setString(3, usuario.getSenha());
            stmt.setString(4, usuario.getEmail());
            stmt.setString(5, usuario.getGrupoFilial());
            stmt.setString(6, usuario.getDepartamento());
            stmt.setString(7, usuario.getCargo());
            stmt.setInt(8, usuario.getIdUsuario());
            stmt.execute();

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }
    }

    public void excluir(int idUsuario) throws SQLException {
        //realiza a exclusão lógica
        String sql = "UPDATE imobiliariadbTESTE.USUARIO SET enable=? WHERE idUsuario=?";
        Connection conn = null;
        
        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setBoolean(1, false);
            stmt.setInt(2, idUsuario);
            stmt.execute();

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }
    }

    public Usuario buscar(Usuario usuario) throws ClassNotFoundException, SQLException {

        String sql = "SELECT * FROM imobiliariadbTESTE.USUARIO WHERE idUsuario=? AND enable=?";

        Usuario user=null;
        Connection conn;
        
        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, usuario.getIdUsuario());
            stmt.setBoolean(2, true);
            ResultSet res = stmt.executeQuery();

            if (res.next()) {
                user = new Usuario();

                user.setIdUsuario(res.getInt("idUsuario"));
                user.setNome(res.getString("nome"));
                user.setEmail(res.getString("email"));
                user.setLogin(res.getString("login"));
                user.setSenha(res.getString("senha"));
                user.setGrupoFilial(res.getString("grupoFilial"));
                user.setDepartamento(res.getString("departamento"));
                user.setCargo(res.getString("cargo"));
            }

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        }
        return user;
    }

}
