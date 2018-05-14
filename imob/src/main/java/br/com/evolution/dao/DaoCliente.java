package br.com.evolution.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.com.evolution.conexao.Conexao;
import br.com.evolution.model.Cliente;

public class DaoCliente {

    // TALVEZ APAGAAAARRRR, PQ TEM O BUSCAR POR CF LÁ NO FINAL ---- não entendi o motivo--> Rod
    
    public List<Cliente> listar() throws ClassNotFoundException, SQLException {

        String sql = "SELECT * FROM imobiliariadbTESTE.CLIENTE WHERE enable=?";

        List<Cliente> lista = new ArrayList<Cliente>();

        Connection conn = null;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setBoolean(1, true);
            //Armazenará os resultados do banco de dados
            ResultSet resultados = stmt.executeQuery();

            while (resultados.next()) {
                Integer id = resultados.getInt("idCliente");
                String cpf = resultados.getString("cpf");
                String nome = resultados.getString("nome");

                Date d = new Date(resultados.getTimestamp("dataNasc").getTime());
                String dataNasc = resultados.getString("dataNasc");
                String sexo = resultados.getString("sexo");
                String telefone = resultados.getString("telefone");
                String celular = resultados.getString("celular");
                String email = resultados.getString("email");
                String cep = resultados.getString("cep");
                String rua = resultados.getString("rua");
                String bairro = resultados.getString("bairro");
                String cidade = resultados.getString("cidade");
                String uf = resultados.getString("uf");
                String num = resultados.getString("num");
                String complemento = resultados.getString("complemento");

                Cliente cli = new Cliente();
                cli.setIdCliente(id);
                cli.setCpf(cpf);
                cli.setNome(nome);
                cli.setDataNasc(dataNasc);
                cli.setSexo(sexo);
                cli.setTelefone(telefone);
                cli.setCelular(celular);
                cli.setEmail(email);
                cli.setCep(cep);
                cli.setRua(rua);
                cli.setBairro(bairro);
                cli.setCidade(cidade);
                cli.setUf(uf);
                cli.setNum(num);
                cli.setComplemento(complemento);
                lista.add(cli);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            conn.close();
        }

        return lista;
    }

    public void inserir(Cliente cliente) throws SQLException, ClassNotFoundException {

        String sql = "INSERT INTO imobiliariadbTESTE.CLIENTE(cpf,nome,dataNasc,sexo,telefone,celular,email,cep,rua,bairro,cidade,uf,num,complemento,enable)"
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection conn = null;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, cliente.getCpf());
            stmt.setString(2, cliente.getNome());

            Timestamp tDataNasc = new Timestamp(cliente.getDataNasc().getTime());
            stmt.setTimestamp(3, tDataNasc);

            stmt.setString(4, cliente.getSexo());
            stmt.setString(5, cliente.getTelefone());
            stmt.setString(6, cliente.getCelular());
            stmt.setString(7, cliente.getEmail());
            stmt.setString(8, cliente.getCep());
            stmt.setString(9, cliente.getRua());
            stmt.setString(10, cliente.getBairro());
            stmt.setString(11, cliente.getCidade());
            stmt.setString(12, cliente.getUf());
            stmt.setString(13, cliente.getNum());
            stmt.setString(14, cliente.getComplemento());
            stmt.setBoolean(15, true);

            stmt.execute();

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }

    }

    public void editar(Cliente cliente) throws SQLException {

        String sql = "UPDATE imobiliariadbTESTE.CLIENTE SET "
                + "cpf=?,nome=?,dataNasc=?,sexo=?,telefone=?,celular=?,email=?,"
                + "cep=?,rua=?,bairro=?,cidade=?,uf=?,num=?,complemento=? WHERE idCliente=?";
        Connection conn = null;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, cliente.getCpf());
            stmt.setString(2, cliente.getNome());

            Timestamp tDataNasc = new Timestamp(cliente.getDataNasc().getTime());
            stmt.setTimestamp(3, tDataNasc);

            stmt.setString(4, cliente.getSexo());
            stmt.setString(5, cliente.getTelefone());
            stmt.setString(6, cliente.getCelular());
            stmt.setString(7, cliente.getEmail());
            stmt.setString(8, cliente.getCep());
            stmt.setString(9, cliente.getRua());
            stmt.setString(10, cliente.getBairro());
            stmt.setString(11, cliente.getCidade());
            stmt.setString(12, cliente.getUf());
            stmt.setString(13, cliente.getNum());
            stmt.setString(14, cliente.getComplemento());
            stmt.setInt(15, cliente.getIdCliente());

            stmt.execute();

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }
    }

    public void excluir(int idCliente) throws SQLException {
        //realiza a exclusão lógica
        String sql = "UPDATE imobiliariadbTESTE.CLIENTE SET enable=? WHERE idCliente=?";
        Connection conn = null;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setBoolean(1, false);
            stmt.setInt(2, idCliente);
            stmt.execute();

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());

        } finally {
            conn.close();
        }
    }

    public Cliente buscar(Cliente cliente) throws ClassNotFoundException, SQLException {

        String sql = "SELECT * FROM imobiliariadbTESTE.CLIENTE WHERE idCliente=? AND enable=?";

        Cliente cli = null;
        Connection conn;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, cliente.getIdCliente());
            stmt.setBoolean(2, true);
            ResultSet res = stmt.executeQuery();

            if (res.next()) {
                cli = new Cliente();

                cli.setIdCliente(res.getInt("idCliente"));
                cli.setCpf(res.getString("cpf"));
                cli.setNome(res.getString("nome"));
                cli.setDataNasc(res.getString("dataNasc"));                
                System.out.println(cli.getDataNasc());
                cli.setSexo(res.getString("sexo"));
                cli.setTelefone(res.getString("telefone"));
                cli.setCelular(res.getString("celular"));
                cli.setEmail(res.getString("email"));
                cli.setCep(res.getString("cep"));
                cli.setRua(res.getString("rua"));
                cli.setBairro(res.getString("bairro"));
                cli.setCidade(res.getString("cidade"));
                cli.setUf(res.getString("uf"));
                cli.setNum(res.getString("num"));
                cli.setComplemento(res.getString("complemento"));
            }

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return cli;
    }

    public Cliente buscarPorCpf(String cpf) throws ClassNotFoundException, SQLException {

        String sql = "SELECT * FROM imobiliariadbTESTE.CLIENTE WHERE cpf=? AND enable=?";

        Cliente cli = null;
        Connection conn;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, cpf);
            stmt.setBoolean(2, true);
            ResultSet res = stmt.executeQuery();

            if (res.next()) {
                cli = new Cliente();

                cli.setIdCliente(res.getInt("idCliente"));
                cli.setCpf(res.getString("cpf"));
                cli.setNome(res.getString("nome"));
                cli.setDataNasc(res.getString("dataNasc"));
                cli.setSexo(res.getString("sexo"));
                cli.setTelefone(res.getString("telefone"));
                cli.setCelular(res.getString("celular"));
                cli.setEmail(res.getString("email"));

                cli.setCep(res.getString("cep"));
                cli.setRua(res.getString("rua"));
                cli.setBairro(res.getString("bairro"));
                cli.setCidade(res.getString("cidade"));
                cli.setUf(res.getString("uf"));
                cli.setNum(res.getString("num"));
                cli.setComplemento(res.getString("complemento"));
            }

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return cli;
    }

    public List<Cliente> procurarCliente(String valor) throws ClassNotFoundException, SQLException {

        String sql = "SELECT * FROM imobiliariadbTESTE.CLIENTE WHERE ((UPPER(nome) LIKE UPPER(?) OR UPPER(cpf) LIKE UPPER(?)) AND enable=?)";

        List<Cliente> lista = new ArrayList<Cliente>();

        Connection conn = null;

        try {
            conn = Conexao.obterConexao();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + valor + "%");
            stmt.setString(2, "%" + valor + "%");
            stmt.setBoolean(3, true);
            //Armazenará os resultados do banco de dados
            ResultSet resultados = stmt.executeQuery();

            while (resultados.next()) {
                Integer id = resultados.getInt("idCliente");
                String cpf = resultados.getString("cpf");
                String nome = resultados.getString("nome");

                Date d = new Date(resultados.getTimestamp("dataNasc").getTime());
                String dataNasc = resultados.getString("dataNasc");
                String sexo = resultados.getString("sexo");
                String telefone = resultados.getString("telefone");
                String celular = resultados.getString("celular");
                String email = resultados.getString("email");
                String cep = resultados.getString("cep");
                String rua = resultados.getString("rua");
                String bairro = resultados.getString("bairro");
                String cidade = resultados.getString("cidade");
                String uf = resultados.getString("uf");
                String num = resultados.getString("num");
                String complemento = resultados.getString("complemento");

                Cliente cli = new Cliente();
                cli.setIdCliente(id);
                cli.setCpf(cpf);
                cli.setNome(nome);
                cli.setDataNasc(dataNasc);
                cli.setSexo(sexo);
                cli.setTelefone(telefone);
                cli.setCelular(celular);
                cli.setEmail(email);
                cli.setCep(cep);
                cli.setRua(rua);
                cli.setBairro(bairro);
                cli.setCidade(cidade);
                cli.setUf(uf);
                cli.setNum(num);
                cli.setComplemento(complemento);
                lista.add(cli);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());
        } finally {
            conn.close();
        }

        return lista;
    }

}
