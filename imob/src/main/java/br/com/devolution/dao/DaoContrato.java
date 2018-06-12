package br.com.devolution.dao;

import br.com.devolution.conexao.Conexao;
import br.com.devolution.model.Contrato;
import br.com.devolution.model.Usuario;
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

    public List<Contrato> listar(Date Inicio, Date Fim, String cdContrato, String servico, String filial) throws ClassNotFoundException, SQLException {

        String sql = "SELECT i.servico, i.tipo, l.nome AS locatario, c.*FROM Contrato c "
                + "INNER JOIN imovel i ON c.idImovel = i.idImovel "
                + "INNER JOIN cliente l ON c.idCliente = l.idCliente "
                + "INNER JOIN usuario u ON c.idUsuario = u.idUsuario "
                + "WHERE (c.dataContrato BETWEEN ? AND ?) OR u.grupoFilial LIKE ? AND c.codContrato LIKE ? OR i.servico LIKE ?";

        List<Contrato> lista = new ArrayList<Contrato>();

        //Verificando se o objeto do tipo data não está vazio
        //Convertendo a data para ser usada na instrução sql
        Timestamp dtInicio = null;
        Timestamp dtFim = null;
        if (Inicio != null && Fim != null) {
            dtInicio = new Timestamp(Inicio.getTime());
            dtFim = new Timestamp(Fim.getTime());
        }
        Connection conn = null;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setTimestamp(1, dtInicio);
            stmt.setTimestamp(2, dtFim);
            stmt.setString(3, "%" + filial + "%");
            stmt.setString(4, "%" + cdContrato + "%");
            stmt.setString(5, "%" + servico + "%");
            //Armazenará os resultados do banco de dados
            ResultSet resultados = stmt.executeQuery();

            while (resultados.next()) {

                Integer idContrato = resultados.getInt("IdContrato");
                int codContrato = Integer.parseInt(resultados.getString("codContrato"));
                Integer idImovel = resultados.getInt("idImovel");
                Integer idCliente = resultados.getInt("idCliente");
                Date dataContrato = resultados.getDate("dataContrato");
                Date dataInicial = resultados.getDate("dataInicial");
                Date dataFinal = resultados.getDate("dataFinal");
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
                contrato.setDataInicial(formatar.format(dataInicial));
                contrato.setDataFinal(formatar.format(dataFinal));
                contrato.setLocatario(locatario);
                contrato.setTipoImovel(tipoImovel);
                contrato.setTipoContrato(tipoContrato);
                lista.add(contrato);
                System.out.println(contrato.getDataContrato());
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.getMessage());
            System.err.println(ex.getMessage());
        } finally {
            conn.close();
        }

        return lista;
    }

    public void inserir(Contrato contrato, Usuario usuarioLogado) throws SQLException {

        String sql = "INSERT INTO imobiliariadb.CONTRATO (codContrato,idImovel,idCliente, idUsuario, dataContrato,dataInicial,dataFinal) "
                + "VALUES (?,?,?,?,?,?,?)";
        Connection conn = null;
        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, contrato.getCodContrato());
            stmt.setInt(2, contrato.getIdImovel());
            stmt.setInt(3, contrato.getIdCliente());
            stmt.setInt(4, contrato.getIdUsuario());

            Timestamp tDataContrato = new Timestamp(contrato.getDataContrato().getTime());
            Timestamp tDataInicial = new Timestamp(contrato.getDataInicial().getTime());
            Timestamp tDataFinal = new Timestamp(contrato.getDataFinal().getTime());
            stmt.setTimestamp(5, tDataContrato);
            stmt.setTimestamp(6, tDataInicial);
            stmt.setTimestamp(7, tDataFinal);            
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
