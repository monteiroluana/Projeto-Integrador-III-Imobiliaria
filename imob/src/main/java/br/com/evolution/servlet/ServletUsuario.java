package br.com.evolution.servlet;

import br.com.evolution.dao.DaoUsuario;
import br.com.evolution.model.Usuario;
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

@WebServlet(name = "usuario", urlPatterns = {"/usuario"})
public class ServletUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("comando").equals("lista")) {
            DaoUsuario daoUsuario = new DaoUsuario();
            List<Usuario> lista = null;
            
            String depart = request.getParameter("departamento");
            String filial = request.getParameter("grupoFilial");
            String nome = request.getParameter("nome");

            try {
                lista = daoUsuario.listar(depart, filial, nome);

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletUsuario.class.getName()).log(Level.SEVERE, null, ex);

            } catch (SQLException ex) {
                Logger.getLogger(ServletUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("lista", lista);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ListarUsuarios.jsp");
            dispatcher.forward(request, response);

        } else if (request.getParameter("comando").equals("listaEditar")) {

            RequestDispatcher dispatcher = request.getRequestDispatcher("EditarUsuario.jsp");
            dispatcher.forward(request, response);

        } else if (request.getParameter("comando").equals("excluir")) {
            //ATUALIZANDO NO BANCO
            DaoUsuario daoUsuario = new DaoUsuario();

            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

            try {
                daoUsuario.excluir(idUsuario);

            } catch (SQLException ex) {
                Logger.getLogger(ServletUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }

            RequestDispatcher dispatcher
                    = request.getRequestDispatcher("CadastroResposta.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //ifs para definir qual ação o servlet vai tomar
        if (request.getParameter("comando").equals("cadastrar")) {
            Usuario usuario = new Usuario();

            //pegando as informações do formulário 
            usuario.setNome(request.getParameter("nome"));
            usuario.setLogin(request.getParameter("login"));
            usuario.setSenha(request.getParameter("senha"));
            usuario.setEmail(request.getParameter("email"));
            usuario.setGrupoFilial(request.getParameter("grupoFilial"));
            usuario.setDepartamento(request.getParameter("departamento"));
            usuario.setCargo(request.getParameter("cargo"));

            // INSERINDO NO BANCO
            DaoUsuario daoUsuario = new DaoUsuario();
            try {
                daoUsuario.inserir(usuario);
            } catch (SQLException ex) {
                Logger.getLogger(ServletUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }

            String msg = "deu certo";

            request.setAttribute("msg", msg);
            request.setAttribute("usuarioCadastrado", usuario);

            RequestDispatcher dispatcher
                    = request.getRequestDispatcher("CadastroUsuario.jsp");
            dispatcher.forward(request, response);

        } else if (request.getParameter("comando").equals("editar")) {
            Usuario usuario = new Usuario();

            //pegando as informações do formulário 
            usuario.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
            usuario.setNome(request.getParameter("nome"));
            usuario.setLogin(request.getParameter("login"));
            usuario.setSenha(request.getParameter("senha"));
            usuario.setEmail(request.getParameter("email"));
            usuario.setGrupoFilial(request.getParameter("grupoFilial"));
            usuario.setDepartamento(request.getParameter("departamento"));
            usuario.setCargo(request.getParameter("cargo"));

            //ATUALIZANDO NO BANCO
            DaoUsuario daoUsuario = new DaoUsuario();

            try {
                daoUsuario.editar(usuario);
            } catch (SQLException ex) {
                Logger.getLogger(ServletUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }

            RequestDispatcher dispatcher
                    = request.getRequestDispatcher("EditarConfirm.jsp");
            dispatcher.forward(request, response);

        }
    }
}
