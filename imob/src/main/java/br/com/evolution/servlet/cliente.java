package br.com.evolution.servlet;

import br.com.evolution.dao.DaoCliente;
import br.com.evolution.model.Cliente;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
public class cliente extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DaoCliente daoCliente = new DaoCliente();
        List<Cliente> lista = null;
        
        try {
            lista = daoCliente.listar();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("lista", lista);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ListarCliente.jsp");
        dispatcher.forward(request, response);
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Pegando as informações que estão sendo passadas pelo formulario
        Cliente cliente = new Cliente();
        cliente.setCpf(request.getParameter("cpf"));
        cliente.setNome(request.getParameter("nome"));
        cliente.setDataNasc(request.getParameter("dataNasc"));
        cliente.setSexo(request.getParameter("sexo"));
        cliente.setTelefone(request.getParameter("telefone"));
        cliente.setCelular(request.getParameter("celular"));
        cliente.setEmail(request.getParameter("email"));
        cliente.setCep(request.getParameter("cep"));
        cliente.setEndereco(request.getParameter("endereco"));
        cliente.setBairro(request.getParameter("bairro"));
        cliente.setCidade(request.getParameter("cidade"));
        cliente.setUf(request.getParameter("uf"));
        cliente.setNum(request.getParameter("num"));
        cliente.setComplemento(request.getParameter("complemento"));

        //Inserindo no banco
        DaoCliente daoCliente = new DaoCliente();
        try {
            daoCliente.iserir(cliente);
        } catch (SQLException ex) {
            Logger.getLogger(cliente.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(cliente.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        request.setAttribute("usuarioCadastrado", cliente);
        RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroResposta.jsp");
        dispatcher.forward(request, response);
    }
    
}
