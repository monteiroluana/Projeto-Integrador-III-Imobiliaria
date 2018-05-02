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

    public List<Cliente> listar() throws ClassNotFoundException, SQLException {

        List<Cliente> lista = new ArrayList<Cliente>();

        try (Connection con = Conexao.obterConexao();
                PreparedStatement stmt = con.prepareStatement("SELECT * FROM imobiliariadbTESTE.CLIENTE");
                ResultSet resultados = stmt.executeQuery();) {

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
  
}
