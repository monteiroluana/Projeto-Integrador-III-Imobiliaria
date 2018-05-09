package br.com.evolution.servlet;

import br.com.evolution.dao.DaoCliente;
import br.com.evolution.model.Cliente;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "cliente", urlPatterns = {"/cliente"})
public class ServletCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("comando").equals("lista")) {
            DaoCliente daoCliente = new DaoCliente();
            List<Cliente> lista = null;
            String valor = request.getParameter("pesquisa");
            
            try {
                lista = daoCliente.procurarCliente(valor);

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("lista", lista);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ListarClientes.jsp");
            dispatcher.forward(request, response);

        } else if (request.getParameter("comando").equals("listaEditar")) {

            RequestDispatcher dispatcher = request.getRequestDispatcher("EditarCliente.jsp");
            dispatcher.forward(request, response);

        } else if (request.getParameter("comando").equals("excluir")) {
            //ATUALIZANDO NO BANCO
            DaoCliente daoCliente = new DaoCliente();

            int idCliente = Integer.parseInt(request.getParameter("idCliente"));

            try {
                daoCliente.excluir(idCliente);

            } catch (SQLException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            }

            RequestDispatcher dispatcher
                    = request.getRequestDispatcher("CadastroResposta.jsp");
            dispatcher.forward(request, response);
        } else if (request.getParameter("comando").equals("buscaCliente")) {
            DaoCliente daoCliente = new DaoCliente();
            String cpf = request.getParameter("cpfCliente");
            Cliente cliente = null;

            try {
                cliente = daoCliente.buscarPorCpf(cpf);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("clienteP", cliente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroImoveis.jsp");
            dispatcher.forward(request, response);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //ifs para definir qual ação o servlet vai tomar
        if (request.getParameter("comando").equals("cadastrar")) {
            //Pegando as informações que estão sendo passadas pelo formulario
            Cliente cliente = new Cliente();

            System.out.println(request.getParameter("data") + request.getParameter("nome"));
            cliente.setCpf(request.getParameter("cpf"));
            cliente.setNome(request.getParameter("nome"));
            cliente.setDataNasc(request.getParameter("data"));
            cliente.setSexo(request.getParameter("sexo"));
            cliente.setTelefone(request.getParameter("telefone"));
            cliente.setCelular(request.getParameter("celular"));
            cliente.setEmail(request.getParameter("email"));
            cliente.setCep(request.getParameter("cep"));
            cliente.setRua(request.getParameter("rua"));
            cliente.setBairro(request.getParameter("bairro"));
            cliente.setCidade(request.getParameter("cidade"));
            cliente.setUf(request.getParameter("uf"));
            cliente.setNum(request.getParameter("num"));
            cliente.setComplemento(request.getParameter("complemento"));

            DaoCliente daoCliente = new DaoCliente();

            try {
                daoCliente.inserir(cliente);
            } catch (SQLException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("clienteCadastrado", cliente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroResposta.jsp");
            dispatcher.forward(request, response);

        } else if (request.getParameter("comando").equals("editar")) {
            //Pegando as informações que estão sendo passadas pelo formulario
            Cliente cliente = new Cliente();

            cliente.setCpf(request.getParameter("cpf"));
            cliente.setNome(request.getParameter("nome"));
            cliente.setDataNasc(request.getParameter("data"));
            cliente.setSexo(request.getParameter("sexo"));
            cliente.setTelefone(request.getParameter("telefone"));
            cliente.setCelular(request.getParameter("celular"));
            cliente.setEmail(request.getParameter("email"));
            cliente.setCep(request.getParameter("cep"));
            cliente.setRua(request.getParameter("rua"));
            cliente.setBairro(request.getParameter("bairro"));
            cliente.setCidade(request.getParameter("cidade"));
            cliente.setUf(request.getParameter("uf"));
            cliente.setNum(request.getParameter("num"));
            cliente.setComplemento(request.getParameter("complemento"));

            DaoCliente daoCliente = new DaoCliente();

            try {
                daoCliente.editar(cliente);
            } catch (SQLException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("clienteCadastrado", cliente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroResposta.jsp");
            dispatcher.forward(request, response);
        }
    }
}
