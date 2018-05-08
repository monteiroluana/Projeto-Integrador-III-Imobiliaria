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

        String sql = "INSERT INTO imobiliariadbTESTE.IMOVEL (dataCad,categoria,tipo,quartos,banheiros,suites,vagasGaragem,areaUtil,areaTotal,"
                + "informacao,cep,rua,num,complemento,bairro,cidade,uf,valorVenda,valorAluguel,condominio,iptu,situacao,enable) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection conn = null;
        
        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            Timestamp tDataCad = new Timestamp(imovel.getDataCad().getTime());
            stmt.setTimestamp(1, tDataCad);
            
            stmt.setString(2, imovel.getCategoria());
            stmt.setString(3, imovel.getTipo());
            stmt.setInt(4, imovel.getQuartos());
            stmt.setInt(5, imovel.getBanheiros());
            stmt.setInt(6, imovel.getSuites());
            stmt.setInt(7, imovel.getVagasGaragem());
            stmt.setDouble(8, imovel.getAreaUtil());
            stmt.setDouble(9, imovel.getAreaTotal());
            stmt.setString(10, imovel.getInformacao());
            stmt.setString(11, imovel.getCep());
            stmt.setString(12, imovel.getRua());
            stmt.setString(13, imovel.getNum());
            stmt.setString(14, imovel.getComplemento());
            stmt.setString(15, imovel.getBairro());
            stmt.setString(16, imovel.getCidade());
            stmt.setString(17, imovel.getUf());
            stmt.setDouble(18, imovel.getValorVenda());
            stmt.setDouble(19, imovel.getValorAluguel());
            stmt.setDouble(20, imovel.getCondominio());
            stmt.setDouble(21, imovel.getIptu());
            stmt.setString(22, imovel.getSituacao());            
            stmt.setBoolean(23, true);
            stmt.execute();
            
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }

    }

    public void editar(Imovel imovel) throws SQLException {

        String sql = "UPDATE imobiliariadbTESTE.IMOVEL SET "
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
