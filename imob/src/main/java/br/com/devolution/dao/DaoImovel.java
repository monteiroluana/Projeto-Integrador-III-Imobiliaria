package br.com.devolution.dao;

import br.com.devolution.conexao.Conexao;
import br.com.devolution.model.Imovel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class DaoImovel {

    public List<Imovel> listar(String codImov, String tip, String situ, String serv)
            throws ClassNotFoundException, SQLException {

//        String sql = "SELECT * FROM imobiliariadb.IMOVEL WHERE "
//                + "((UPPER(codImovel) LIKE UPPER(?) "
//                + "OR UPPER(tipo) LIKE UPPER(?) "
//                + "OR UPPER(situacao) LIKE UPPER(?) "
//                + "OR UPPER(servico) LIKE UPPER(?)) "
//                + "AND enable=?);";

        String sql = "SELECT * FROM imobiliariadb.IMOVEL WHERE enable=?";

        List<Imovel> lista = new ArrayList<Imovel>();

        Connection conn = null;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

//            //MUDAR/ADICIONAR OS CAMPOS
//            stmt.setString(1, "%" + codImov + "%");
//            stmt.setString(2, "%" + tip + "%");
//            stmt.setString(3, "%" + situ + "%");
//            stmt.setString(4, "%" + serv + "%");
//            stmt.setBoolean(5, true);
            stmt.setBoolean(1, true);

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

        String sql = "INSERT INTO imobiliariadb.IMOVEL (idCliente,dataCad,categoria,tipo,quartos,banheiros,suites,vagasGaragem,areaUtil,areaTotal,"
                + "informacao,cep,rua,num,complemento,bairro,cidade,uf,valorVenda,valorAluguel,condominio,iptu,situacao,servico,codImovel,enable) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            stmt.setString(25, imovel.getCodImovel());
            stmt.setBoolean(26, true);
            stmt.execute();

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }

    }

    public void editar(Imovel imovel) throws SQLException {

        String sql = "UPDATE imobiliariadb.IMOVEL SET "
                + "categoria=?,tipo=?,quartos=?,banheiros=?,suites=?,vagasGaragem=?,areaUtil=?,areaTotal=?,"
                + "informacao=?,cep=?,rua=?,num=?,complemento=?,bairro=?,cidade=?,uf=?,"
                + "valorVenda=?,valorAluguel=?,condominio=?,iptu=?,situacao=?,servico=?,codImovel=? "
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
            stmt.setString(23, imovel.getCodImovel());
            stmt.setInt(24, imovel.getIdImovel());
            stmt.execute();

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }
    }

    public void excluir(int idImovel) throws SQLException {
        //realiza a exclusão lógica
        String sql = "UPDATE imobiliariadb.IMOVEL SET enable=? WHERE idImovel=?";
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

    public boolean conferirCodImovel(String codImovel) throws ClassNotFoundException, SQLException {

        String sql = "SELECT * FROM imovel WHERE (codImovel=? and enable=?)";

        //Conexão para abertura e fechamento
        Connection connection = null;

        PreparedStatement preparedStatement = null;

        //Armazenará os resultados do banco de dados
        ResultSet result = null;
        try {
            //Abre uma conexão com o banco de dados
            connection = Conexao.obterConexao();
            //Cria um statement para execução de instruções SQL
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, codImovel);
            preparedStatement.setBoolean(2, true);

            //Executa a consulta SQL no banco de dados
            result = preparedStatement.executeQuery();

            //se eentrar no if, significa que já tem Imovel com o codigo passado
            if (result.next()) {

                return true;
            }
        } finally {
            //Se o result ainda estiver aberto, realiza seu fechamento
            if (result != null && !result.isClosed()) {
                result.close();
            }
            //Se o statement ainda estiver aberto, realiza seu fechamento
            if (preparedStatement != null && !preparedStatement.isClosed()) {
                preparedStatement.close();
            }
            //Se a conexão ainda estiver aberta, realiza seu fechamento
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
        //Se o return anterior não foi executado
        return false;

    }

    public Imovel buscar(Imovel imovel) throws ClassNotFoundException, SQLException {

        String sql = "SELECT * FROM imobiliariadb.IMOVEL WHERE idImovel=? AND enable=?";

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
                imov.setCodImovel(res.getString("codImovel"));
            }

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return imov;
    }

    public static int gerarCod() throws SQLException {

        Random rnd = new Random();

        int codGerado = rnd.nextInt(10000);

        String sql = "SELECT * FROM imobiliariadb.IMOVEL WHERE codImovel=? AND enable=?";
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
