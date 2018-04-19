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
public class usuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        DaoUsuario daoUsuario = new DaoUsuario();
        List<Usuario> lista = null;

        try {
            lista = daoUsuario.listar();
            request.setAttribute("lista", lista);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("ListarUsuarios.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
