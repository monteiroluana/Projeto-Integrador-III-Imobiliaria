package br.com.devolution.dao;

import br.com.devolution.conexao.Conexao;
import br.com.devolution.model.Contrato;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class DaoContrato {

    public List<Contrato> listar() throws ClassNotFoundException, SQLException {

        String sql = "SELECT * FROM imobiliariadb.CONTRATO WHERE enable=?";

        List<Contrato> lista = new ArrayList<Contrato>();

        Connection conn = null;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setBoolean(1, true);
            //Armazenará os resultados do banco de dados
            ResultSet resultados = stmt.executeQuery();

            while (resultados.next()) {

                Integer idContrato = resultados.getInt("IdContrato");
                String codContrato = resultados.getString("codContrato");
                Integer idImovel = resultados.getInt("idImovel");
                Integer idCliente = resultados.getInt("idCliente");
                String dataContrato = resultados.getString("dataContrato");
                String dataInicial = resultados.getString("dataInicial");
                String dataFinal = resultados.getString("dataFinal");

                Contrato contrato = new Contrato();
                contrato.setIdContrato(idContrato);
                contrato.setCodContrato(codContrato);
                contrato.setIdImovel(idImovel);
                contrato.setIdCliente(idCliente);
                contrato.setDataContrato(dataContrato);
                contrato.setDataInicial(dataInicial);
                contrato.setDataFinal(dataFinal);
                lista.add(contrato);

            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.getMessage());
            System.err.println(ex.getMessage());
        } finally {
            conn.close();
        }

        return lista;
    }

    public void inserir(Contrato contrato) throws SQLException {

        String sql = "INSERT INTO imobiliariadb.CONTRATO (codContrato,idImovel,idCliente,dataContrato,dataInicial,dataFinal,enable) "
                + "VALUES (?,?,?,?,?,?,?)";
        Connection conn = null;
        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, contrato.getCodContrato());
            stmt.setInt(2, contrato.getIdImovel());
            stmt.setInt(3, contrato.getIdCliente());

            Timestamp tDataContrato = new Timestamp(contrato.getDataContrato().getTime());
            Timestamp tDataInicial = new Timestamp(contrato.getDataInicial().getTime());
            Timestamp tDataFinal = new Timestamp(contrato.getDataFinal().getTime());
            stmt.setTimestamp(4, tDataContrato);
            stmt.setTimestamp(5, tDataInicial);
            stmt.setTimestamp(6, tDataFinal);

            stmt.setBoolean(7, true);
            stmt.execute();

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }
    }
}
