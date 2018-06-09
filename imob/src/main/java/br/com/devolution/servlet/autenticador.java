/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.devolution.servlet;

import br.com.devolution.dao.DaoUsuario;
import br.com.devolution.model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "autenticador", urlPatterns = {"/autenticador"})
public class autenticador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessao = request.getSession(false);
        if(sessao!=null){
            sessao.invalidate();
            response.sendRedirect("index.jsp");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String login = request.getParameter("usr");
            String senha = request.getParameter("pass");            
            
            Usuario usu = new Usuario();
            usu.setLogin(login);
            usu.setSenha(senha);
            
            DaoUsuario usuDAO = new DaoUsuario();
            Usuario usuAutenticado = null;
        try {
            usuAutenticado = usuDAO.autenticar(usu);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(autenticador.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(autenticador.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            if(usuAutenticado != null){
                HttpSession sessao = request.getSession();
                sessao.setAttribute("usuAutenticado", usuAutenticado);
                sessao.setMaxInactiveInterval(3000);// 3 minutos de sessão
                request.getRequestDispatcher("inicial.jsp").forward(request, response);
            }else{
                response.sendRedirect("erroLogin.jsp");
            }
        //processRequest(request, response);
    }

    
}
