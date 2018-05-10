package br.com.evolution.dao;

import br.com.evolution.conexao.Conexao;
import br.com.evolution.model.Imovel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DaoImovel {

    public List<Imovel> listar(String serv, String tip, String cid, double vendaInicial, double vendaFinal, 
            double aluguelInicial, double aluguelFinal, String codImov)
            throws ClassNotFoundException, SQLException {

        String sql = "SELECT * FROM imobiliariadbTESTE.IMOVEL WHERE "
                + "((UPPER(servico) LIKE UPPER(?) "
                + "AND UPPER(tipo) LIKE UPPER(?) "
                + "AND UPPER(cidade) LIKE UPPER(?) "
                + "AND (valorVenda) BETWEEN (?) AND (?) "
                + "OR (valorAluguel) BETWEEN (?) AND (?) "
                + "AND UPPER(codImovel) LIKE UPPER(?) "
                + "AND enable=?)";

        List<Imovel> lista = new ArrayList<Imovel>();

        Connection conn = null;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            //MUDAR/ADICIONAR OS CAMPOS
            stmt.setString(1, "%" + serv + "%");
            stmt.setString(2, "%" + tip + "%");
            stmt.setString(3, "%" + cid + "%");
            stmt.setDouble(4, vendaInicial);
            stmt.setDouble(5, vendaFinal);
            stmt.setDouble(6, aluguelInicial);
            stmt.setDouble(7, aluguelFinal);
            stmt.setString(8, "%" + codImov + "%");
            stmt.setBoolean(9, true);

            //Armazenará os resultados do banco de dados
            ResultSet resultados = stmt.executeQuery();

            while (resultados.next()) {
                Integer id = resultados.getInt("idImovel");
                Integer idCliente = resultados.getInt("idCliente");
                String codImovel = resultados.getString("codImovel");
                Date d = new Date(resultados.getTimestamp("dataCad").getTime());
                String dataCad = resultados.getString("dataCad");
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
                String servico = resultados.getString("servico");

                Imovel imov = new Imovel();
                imov.setIdImovel(id);
                imov.setIdCliente(idCliente);
                imov.setCodImovel(codImovel);

                imov.setDataCad(dataCad);
                imov.setCategoria(categoria);
                imov.setTipo(tipo);

                imov.setQuartos(quartos);
                imov.setBanheiros(banheiros);
                imov.setSuites(suites);
                imov.setVagasGaragem(vagasGaragem);

                imov.setAreaUtil(areaUtil);
                imov.setAreaTotal(areaTotal);
                imov.setInformacao(informacao);

                imov.setCep(cep);
                imov.setRua(rua);
                imov.setBairro(bairro);
                imov.setCidade(cidade);
                imov.setUf(uf);
                imov.setNum(num);
                imov.setComplemento(complemento);

                imov.setValorVenda(valorVenda);
                imov.setValorAluguel(valorAluguel);
                imov.setCondominio(condominio);
                imov.setIptu(iptu);

                imov.setSituacao(situacao);
                imov.setServico(servico);

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

        String sql = "INSERT INTO imobiliariadbTESTE.IMOVEL (idCliente,dataCad,categoria,tipo,quartos,banheiros,suites,vagasGaragem,areaUtil,areaTotal,"
                + "informacao,cep,rua,num,complemento,bairro,cidade,uf,valorVenda,valorAluguel,condominio,iptu,situacao,servico,enable) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection conn = null;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            Timestamp tDataCad = new Timestamp(imovel.getDataCad().getTime());
            stmt.setInt(1, imovel.getIdCliente());
            stmt.setTimestamp(2, tDataCad);
            stmt.setString(3, imovel.getCategoria());
            stmt.setString(4, imovel.getTipo());
            stmt.setInt(5, imovel.getQuartos());
            stmt.setInt(6, imovel.getBanheiros());
            stmt.setInt(7, imovel.getSuites());
            stmt.setInt(8, imovel.getVagasGaragem());
            stmt.setDouble(9, imovel.getAreaUtil());
            stmt.setDouble(10, imovel.getAreaTotal());
            stmt.setString(11, imovel.getInformacao());
            stmt.setString(12, imovel.getCep());
            stmt.setString(13, imovel.getRua());
            stmt.setString(14, imovel.getNum());
            stmt.setString(15, imovel.getComplemento());
            stmt.setString(16, imovel.getBairro());
            stmt.setString(17, imovel.getCidade());
            stmt.setString(18, imovel.getUf());
            stmt.setDouble(19, imovel.getValorVenda());
            stmt.setDouble(20, imovel.getValorAluguel());
            stmt.setDouble(21, imovel.getCondominio());
            stmt.setDouble(22, imovel.getIptu());
            stmt.setString(23, imovel.getSituacao());
            stmt.setString(24, imovel.getServico());
            stmt.setBoolean(25, true);
            stmt.execute();

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }

    }

    public void editar(Imovel imovel) throws SQLException {

        String sql = "UPDATE imobiliariadbTESTE.IMOVEL SET "
                + "categoria=?,tipo=?,quartos=?,banheiros=?,suites=?,vagasGaragem=?,areaUtil=?,areaTotal=?,"
                + "informacao=?,cep=?,rua=?,num=?,complemento=?,bairro=?,cidade=?,uf=?,"
                + "valorVenda=?,valorAluguel=?,condominio=?,iptu=?,situacao=?,servico=? "
                + "WHERE idImovel=?";
        Connection conn = null;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, imovel.getCategoria());
            stmt.setString(2, imovel.getTipo());
            stmt.setInt(3, imovel.getQuartos());
            stmt.setInt(4, imovel.getBanheiros());
            stmt.setInt(5, imovel.getSuites());
            stmt.setInt(6, imovel.getVagasGaragem());
            stmt.setDouble(7, imovel.getAreaUtil());
            stmt.setDouble(8, imovel.getAreaTotal());
            stmt.setString(9, imovel.getInformacao());
            stmt.setString(10, imovel.getCep());
            stmt.setString(11, imovel.getRua());
            stmt.setString(12, imovel.getNum());
            stmt.setString(13, imovel.getComplemento());
            stmt.setString(14, imovel.getBairro());
            stmt.setString(15, imovel.getCidade());
            stmt.setString(16, imovel.getUf());
            stmt.setDouble(17, imovel.getValorVenda());
            stmt.setDouble(18, imovel.getValorAluguel());
            stmt.setDouble(19, imovel.getCondominio());
            stmt.setDouble(20, imovel.getIptu());
            stmt.setString(21, imovel.getSituacao());
            stmt.setString(22, imovel.getServico());
            stmt.setInt(23, imovel.getIdImovel());
            stmt.execute();

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }
    }

    public void excluir(int idImovel) throws SQLException {
        //realiza a exclusão lógica
        String sql = "UPDATE imobiliariadbTESTE.IMOVEL SET enable=? WHERE idImovel=?";
        Connection conn = null;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setBoolean(1, false);
            stmt.setInt(2, idImovel);
            stmt.execute();

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }
    }

    public Imovel buscar(Imovel imovel) throws ClassNotFoundException, SQLException {

        String sql = "SELECT * FROM imobiliariadbTESTE.IMOVEL WHERE idImovel=? AND enable=?";

        Imovel imov = null;
        Connection conn;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, imovel.getIdImovel());
            stmt.setBoolean(2, true);
            ResultSet res = stmt.executeQuery();

            if (res.next()) {
                imov = new Imovel();

                imov.setIdImovel(res.getInt("idImovel"));
                imov.setIdCliente(res.getInt("idCliente"));
                imov.setCodImovel(res.getString("codImovel"));
                imov.setDataCad(res.getString("dataCad"));

                imov.setCategoria(res.getString("categoria"));
                imov.setTipo(res.getString("tipo"));
                imov.setQuartos(res.getInt("quartos"));
                imov.setBanheiros(res.getInt("banheiros"));
                imov.setSuites(res.getInt("suites"));
                imov.setVagasGaragem(res.getInt("vagasGaragem"));
                imov.setAreaUtil(res.getDouble("areaUtil"));
                imov.setAreaTotal(res.getDouble("areaTotal"));
                imov.setInformacao(res.getString("informacao"));

                imov.setCep(res.getString("cep"));
                imov.setRua(res.getString("rua"));
                imov.setBairro(res.getString("bairro"));
                imov.setCidade(res.getString("cidade"));
                imov.setUf(res.getString("uf"));
                imov.setNum(res.getString("num"));
                imov.setComplemento(res.getString("complemento"));

                imov.setValorVenda(res.getDouble("valorVenda"));
                imov.setValorAluguel(res.getDouble("valorAluguel"));
                imov.setCondominio(res.getDouble("condominio"));
                imov.setIptu(res.getDouble("iptu"));
                imov.setSituacao(res.getString("situacao"));
                imov.setServico(res.getString("servico"));
            }

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return imov;
    }

}
