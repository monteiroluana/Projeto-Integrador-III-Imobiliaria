package br.com.devolution.servlet;

import br.com.devolution.dao.DaoCliente;
import br.com.devolution.dao.DaoImovel;

import br.com.devolution.model.validadores.ValidadorCliente;

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
import br.com.devolution.model.Cliente;
import br.com.devolution.model.Usuario;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpSession;

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

        } else if (request.getParameter("comando").equals("buscaCliente")) {
            DaoCliente daoCliente = new DaoCliente();
            String cpf = request.getParameter("cpfCliente");
            Cliente cliente = null;

            int codGerado = -1;

            try {
                cliente = daoCliente.buscarPorCpf(cpf);
                codGerado = DaoImovel.gerarCod();

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("codGerado", codGerado);
            request.setAttribute("clienteP", cliente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroImovel.jsp");
            dispatcher.forward(request, response);

        } else if (request.getParameter("comando").equals("buscaLocatario")) {
            DaoCliente daoCliente = new DaoCliente();
            String cpf = request.getParameter("cpfLocatario");
            Cliente cliente = null;

            try {
                cliente = daoCliente.buscarPorCpf(cpf);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("clienteP", cliente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("venda.jsp");
            dispatcher.forward(request, response);

        } else if (request.getParameter("comando").equals("excluir")) {
            //ATUALIZANDO NO BANCO
            DaoCliente daoCliente = new DaoCliente();

            int idCliente = Integer.parseInt(request.getParameter("idCliente"));

            String msg = null;
            try {
                if (daoCliente.excluir(idCliente)) {
                    msg = "<script>alert('Cliente excluido com sucesso');</script>";
                } else {
                    msg = "<script>alert('Erro ao Excluir o cliente');</script>";
                }

            } catch (SQLException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("msg", msg);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ListarClientes.jsp");
            dispatcher.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        String msg = null;
        //ifs para definir qual ação o servlet vai tomar
        if (request.getParameter("comando").equals("cadastrar")) {
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
                //se o cliente for válido, vai para o dao
                if (ValidadorCliente.validar(cliente)) {
                    daoCliente.inserir(cliente);

                    msg = "<script>alert('Cliente inserido com sucesso');</script>";
                } else {
                    msg = "<script>alert('Erro ao inserir um novo Cliente');</script>";
                }
            } catch (SQLException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("msg", msg);
            request.setAttribute("clienteCadastrado", cliente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ListarClientes.jsp");
            dispatcher.forward(request, response);

        } else if (request.getParameter("comando").equals("editar")) {
            //Pegando as informações que estão sendo passadas pelo formulario
            Cliente cliente = new Cliente();
            cliente.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
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
                if (ValidadorCliente.validarEdicao(cliente)) {
                    daoCliente.editar(cliente);
                    msg = "<script>alert('Cliente alterado com sucesso');</script>";
                } else {
                    msg = "<script>alert('Erro ao alterar o cliente');</script>";
                }
            } catch (SQLException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("msg", msg);
            request.setAttribute("clienteCadastrado", cliente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ListarClientes.jsp");
            dispatcher.forward(request, response);
        } else if (request.getParameter("comando").equals("listaEditar")) {

            Cliente cliente = new Cliente();

            cliente.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));

            DaoCliente daoCliente = new DaoCliente();
            String dataNasc = null;

            try {
                cliente = daoCliente.buscar(cliente);

                //formatando a data numa String temporariamente para mandar a data já formatada para a tela! ou não kkkk
                SimpleDateFormat formatar = new SimpleDateFormat("dd/MM/yyyy");
                dataNasc = (formatar.format(cliente.getDataNasc()));

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ParseException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("dataNasc", dataNasc);
            request.setAttribute("cliente", cliente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("EditarCliente.jsp");
            dispatcher.forward(request, response);

        }
    }
}
