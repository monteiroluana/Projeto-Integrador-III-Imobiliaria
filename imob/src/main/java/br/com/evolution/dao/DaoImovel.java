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
import java.util.Date;
import java.util.List;

/**
 *
 * @author Jhonan
 */
public class DaoImovel {
    
    public List<Imovel> listar() throws ClassNotFoundException, SQLException {

        String sql = "SELECT * FROM imobiliariadbTESTE.IMOVEL WHERE enable=?";

        List<Imovel> lista = new ArrayList<Imovel>();

        Connection conn = null;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setBoolean(1, true);
            //Armazenará os resultados do banco de dados
            ResultSet resultados = stmt.executeQuery();

            while (resultados.next()) {
                Integer id = resultados.getInt("idImovel");
                Integer idCliente = resultados.getInt("idCliente");
                String codImovel = resultados.getString("codImovel");
                Date d = new Date(resultados.getTimestamp("dataCad").getTime());
                String categoria = resultados.getString("categoria");
                String tipo = resultados.getString("tipo");
                
                Integer quartos = resultados.getInt("quartos");
                Integer banheiros = resultados.getInt("banheiros");
                Integer suites = resultados.getInt("suites");
                Integer vagasGaragem = resultados.getInt("vagasGaragem");
                
                Double areaUtil = resultados.getDouble("areaUtil");
                Double areaTotal = resultados.getDouble("areaTotal");
                String informacao = resultados.getString("informacao");
                
                String cep = resultados.getString("cep");
                String rua = resultados.getString("rua");
                String bairro = resultados.getString("bairro");
                String cidade = resultados.getString("cidade");
                String uf = resultados.getString("uf");
                String num = resultados.getString("num");
                String complemento = resultados.getString("complemento");
                
                Double valorVenda = resultados.getDouble("valorVenda");
                Double valorAluguel = resultados.getDouble("valorAluguel");
                Double condominio = resultados.getDouble("condominio");
                Double iptu = resultados.getDouble("iptu");
                
                String situacao = resultados.getString("situacao");

                Imovel imov = new Imovel();
                imov.setIdImovel(id);
                imov.setIdCliente(idCliente);
                imov.setCodImovel(codImovel);
               //imov.setDataCad(dataCad);

                lista.add(imov);
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
