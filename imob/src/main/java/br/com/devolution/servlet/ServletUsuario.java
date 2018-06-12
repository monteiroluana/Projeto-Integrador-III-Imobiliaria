package br.com.devolution.servlet;

import br.com.devolution.dao.DaoUsuario;
import br.com.devolution.exceptions.UsuarioException;
import br.com.devolution.model.Usuario;
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
import br.com.devolution.model.validadores.ValidadorUsuario;

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
            
        } else if (request.getParameter("comando").equals("excluir")) {
            //ATUALIZANDO NO BANCO
            DaoUsuario daoUsuario = new DaoUsuario();
            String msg = null;
            
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            
            try {
                if (daoUsuario.excluir(idUsuario)) {
                    msg = "<script>alert('Usuario excluido com sucesso');</script>";
                } else {
                    msg = "<script>alert('Erro ao excluir usuário');</script>";
                }
                
            } catch (SQLException ex) {
                Logger.getLogger(ServletUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            request.setAttribute("msg", msg);
            RequestDispatcher dispatcher = request.getRequestDispatcher("inicial.jsp");
            dispatcher.forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String msg = null;
        Usuario usuario = new Usuario();
        DaoUsuario daoUsuario = new DaoUsuario();

        //ifs para definir qual ação o servlet vai tomar
        if (request.getParameter("comando").equals("cadastrar")) {

            //pegando as informações do formulário 
            usuario.setNome(request.getParameter("nome"));
            usuario.setLogin(request.getParameter("login"));
            usuario.setSenha(request.getParameter("senha"));
            usuario.setEmail(request.getParameter("email"));
            usuario.setGrupoFilial(request.getParameter("grupoFilial"));
            usuario.setDepartamento(request.getParameter("departamento"));
            usuario.setCargo(request.getParameter("cargo"));
            
            

            // INSERINDO NO BANCO
            try {
                if (ValidadorUsuario.validar(usuario)) {
                    daoUsuario.inserir(usuario);
                    msg = "<script>alert('Usuário inserido com sucesso');</script>";
                } else {
                    msg = "<script>alert('Erro ao inserir usuário');</script>";
                }
            } catch (SQLException ex) {
                Logger.getLogger(ServletUsuario.class.getName()).log(Level.SEVERE, null, ex);
            } catch (UsuarioException ex) {
                Logger.getLogger(ServletUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            request.setAttribute("msg", msg);
            request.setAttribute("usuarioCadastrado", usuario);
            RequestDispatcher dispatcher = request.getRequestDispatcher("inicial.jsp");
            dispatcher.forward(request, response);
            
        } else if (request.getParameter("comando").equals("listaEditar")) {
            
            usuario.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
            
            try {
                usuario = daoUsuario.buscar(usuario);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletUsuario.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            request.setAttribute("usuario", usuario);
            RequestDispatcher dispatcher = request.getRequestDispatcher("EditarUsuario.jsp");
            dispatcher.forward(request, response);
            
        } else if (request.getParameter("comando").equals("editar")) {

            //pegando as informações do formulário 
            usuario.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
            usuario.setNome(request.getParameter("nome"));
            usuario.setLogin(request.getParameter("login"));
            usuario.setEmail(request.getParameter("email"));
            usuario.setGrupoFilial(request.getParameter("grupoFilial"));
            usuario.setDepartamento(request.getParameter("departamento"));
            usuario.setCargo(request.getParameter("cargo"));

            //ATUALIZANDO NO BANCO
            try {
                if (daoUsuario.editar(usuario)) {
                    msg = "<script>alert('Usuário alterado com sucesso');</script>";
                } else {
                    msg = "<script>alert('Erro ao alterar usuário');</script>";
                }
            } catch (SQLException ex) {
                Logger.getLogger(ServletUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("msg", msg);
            RequestDispatcher dispatcher = request.getRequestDispatcher("inicial.jsp");
            dispatcher.forward(request, response);
            
        }
    }
}
