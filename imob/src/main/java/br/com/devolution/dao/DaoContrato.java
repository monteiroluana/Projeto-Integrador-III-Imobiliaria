package br.com.devolution.dao;

import br.com.devolution.conexao.Conexao;
import br.com.devolution.model.Contrato;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class DaoContrato {

    public List<Contrato> listar() throws ClassNotFoundException, SQLException {

        String sql = "SELECT i.servico, i.tipo, l.nome AS locatario, c.*FROM Contrato c "
                + "INNER JOIN imovel i ON c.idImovel = i.idImovel "
                + "INNER JOIN cliente l ON c.idCliente = l.idCliente "
                + "WHERE c.enable = ? ";

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
                int codContrato = Integer.parseInt(resultados.getString("codContrato"));
                Integer idImovel = resultados.getInt("idImovel");
                Integer idCliente = resultados.getInt("idCliente");
                Date dataContrato = resultados.getDate("dataContrato");
                String dataInicial = resultados.getString("dataInicial");
                String dataFinal = resultados.getString("dataFinal");
                String tipoImovel = resultados.getString("tipo");
                String tipoContrato = resultados.getString("servico");
                String locatario = resultados.getString("locatario");

                Contrato contrato = new Contrato();
                contrato.setIdContrato(idContrato);
                contrato.setCodContrato(codContrato);
                contrato.setIdImovel(idImovel);
                contrato.setIdCliente(idCliente);
                SimpleDateFormat formatar = new SimpleDateFormat("dd/MM/yyyy");
                contrato.setDataContrato(formatar.format(dataContrato));
                contrato.setDataInicial(dataInicial);
                contrato.setDataFinal(dataFinal);
                contrato.setLocatario(locatario);
                contrato.setTipoImovel(tipoImovel);
                contrato.setTipoContrato(tipoContrato);
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

            stmt.setInt(1, contrato.getCodContrato());
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

    public static int gerarCod() throws SQLException {

        Random rnd = new Random();

        int codGerado = rnd.nextInt(10000);

        String sql = "SELECT * FROM imobiliariadb.CONTRATO WHERE codContrato=? AND enable=?";
        Connection conn = null;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, codGerado);
            stmt.setBoolean(2, true);

            stmt.execute();

            ResultSet res = stmt.executeQuery();

            if (res.next()) {

                codGerado = rnd.nextInt(10000);

                return codGerado;
            }

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }

        return codGerado;

    }
}
