/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.evolution.servlet;

import br.com.evolution.dao.DaoImovel;
import br.com.evolution.model.Imovel;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author Jhonan
 */
@WebServlet(name = "imovel", urlPatterns = {"/imovel"})
public class ServletImovel extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("comando").equals("lista")) {
            DaoImovel daoImovel = new DaoImovel();
            List<Imovel> lista = null;

            try {
                lista = daoImovel.listar();

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletCliente.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("lista", lista);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ListarCliente.jsp");
            dispatcher.forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("comando").equals("cadastrar")) {
            //Pegando as informações que estão sendo passadas pelo formulario
            Imovel imovel = new Imovel();

            imovel.setDataCad(request.getParameter("data"));            
            imovel.setServico(request.getParameter("servico"));
            imovel.setCategoria(request.getParameter("categoria"));
            imovel.setTipo(request.getParameter("tipo_imovel"));
            imovel.setQuartos(Integer.parseInt(request.getParameter("telefone")));
            imovel.setBanheiros(Integer.parseInt(request.getParameter("Banheiros")));
            imovel.setSuites(Integer.parseInt(request.getParameter("Suite")));
            imovel.setVagasGaragem(Integer.parseInt(request.getParameter("Vagas")));
            imovel.setAreaUtil(Double.parseDouble(request.getParameter("Area_util")));
            imovel.setAreaTotal(Double.parseDouble(request.getParameter("Area_total")));
            imovel.setInformacao(request.getParameter("info"));
            imovel.setCep(request.getParameter("CEP"));
            imovel.setRua(request.getParameter("Rua"));
            imovel.setBairro(request.getParameter("Bairro"));
            imovel.setCidade(request.getParameter("Cidade"));
            imovel.setUf(request.getParameter("UF"));
            imovel.setNum(request.getParameter("Numero"));
            imovel.setComplemento(request.getParameter("Complemento"));
            imovel.setValor(Double.parseDouble(request.getParameter("Valor")));
            imovel.setIptu(Double.parseDouble(request.getParameter("IPTU")));
            imovel.setCondominio(Double.parseDouble(request.getParameter("Condominio")));
            imovel.setStatus(request.getParameter("Status"));
        }

    }
}
