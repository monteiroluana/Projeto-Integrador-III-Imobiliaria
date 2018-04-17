/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.evolution.servlet;

import br.com.evolution.dao.DaoUsuario;
import br.com.evolution.model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luana
 */
@WebServlet(name = "inserirUsuario", urlPatterns = {"/inserirUsuario"})
public class inserirUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario usuario = new Usuario();
        //peguei as informações do formulário 
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
            Logger.getLogger(inserirUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("usuarioCadastrado", usuario);

        RequestDispatcher dispatcher
                = request.getRequestDispatcher("WEB-INF/listarUsuarios.jsp");
        dispatcher.forward(request, response);
    }

}
