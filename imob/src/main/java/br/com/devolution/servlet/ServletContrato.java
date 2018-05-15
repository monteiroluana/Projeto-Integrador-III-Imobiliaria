/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.devolution.servlet;

import br.com.devolution.dao.DaoCliente;
import br.com.devolution.dao.DaoImovel;
import br.com.devolution.model.Cliente;
import br.com.devolution.model.Imovel;
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
 * @author luana.mpereira5
 */
@WebServlet(name = "contrato", urlPatterns = {"/contrato"})
public class ServletContrato extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DaoImovel daoImovel = new DaoImovel();
        DaoCliente daoCliente = new DaoCliente();
        Cliente cliente = new Cliente();
        Imovel imovel = new Imovel();

        if (request.getParameter("locatario").equals("")) {

            try {
                cliente = daoCliente.buscarPorCpf(request.getParameter("cpf"));
                imovel.setIdImovel(Integer.parseInt(request.getParameter("idImovel")));
                imovel = daoImovel.buscar(imovel);

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletContrato.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletContrato.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("imovel", imovel);
            request.setAttribute("cliente", cliente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("venda.jsp");
            dispatcher.forward(request, response);
        }

    }

}
