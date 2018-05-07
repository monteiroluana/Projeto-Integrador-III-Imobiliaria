/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.evolution.dao;

import br.com.evolution.conexao.Conexao;
import br.com.evolution.model.Imovel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jhonan
 */
public class DaoImovel {
    
    public List<Imovel> listar() throws ClassNotFoundException, SQLException {

        String sql = "SELECT * FROM imobiliariadbTESTE.USUARIO WHERE enable=?";

        List<Imovel> lista = new ArrayList<Imovel>();

        Connection conn = null;

        try {
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

                Imovel imov = new Imovel();
//                imov.setIdImovel(id);
//                imov.setNome(nome);
//                imov.setEmail(email);
//                imov.setLogin(login);
//                imov.setSenha(senha);
//                imov.setGrupoFilial(grupoFilial);
//                imov.setDepartamento(departamento);
//                imov.setCargo(cargo);
//                lista.add(imov);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            conn.close();
        }

        return lista;
    }
    
    public void inserir(Imovel imovel) throws SQLException {

        String sql = "INSERT INTO imobiliariadbTESTE.Imovel (nome,login,senha,email,grupoFilial,departamento,cargo,enable) "
                + "VALUES (?,?,?,?,?,?,?,?)";
        Connection conn = null;
        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

//            stmt.setString(1, imovel.getNome());
//            stmt.setString(2, imovel.getLogin());
//            stmt.setString(3, imovel.getSenha());
//            stmt.setString(4, imovel.getEmail());
//            stmt.setString(5, imovel.getGrupoFilial());
//            stmt.setString(6, imovel.getDepartamento());
//            stmt.setString(7, imovel.getCargo());
//            stmt.setBoolean(8, true);
//            stmt.execute();

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }

    }

    public void editar(Imovel imovel) throws SQLException {

        String sql = "UPDATE imobiliariadbTESTE.USUARIO SET "
                + "nome=?,login=?,senha=?,email=?,grupoFilial=?,departamento=?,cargo=? WHERE idUsuario=?";
        Connection conn = null;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

//            stmt.setString(1, imovel.getNome());
//            stmt.setString(2, imovel.getLogin());
//            stmt.setString(3, imovel.getSenha());
//            stmt.setString(4, imovel.getEmail());
//            stmt.setString(5, imovel.getGrupoFilial());
//            stmt.setString(6, imovel.getDepartamento());
//            stmt.setString(7, imovel.getCargo());
//            stmt.setInt(8, imovel.getIdUsuario());
//            stmt.execute();

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }
    }
    
}
