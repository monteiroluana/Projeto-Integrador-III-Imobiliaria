package br.com.evolution.servlet;

import br.com.evolution.dao.DaoCliente;
import br.com.evolution.dao.DaoImovel;
import br.com.evolution.model.Cliente;
import br.com.evolution.model.Imovel;
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

@WebServlet(name = "imovel", urlPatterns = {"/imovel"})
public class ServletImovel extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("comando").equals("lista")) {
            DaoImovel daoImovel = new DaoImovel();
            List<Imovel> lista = null;

            String codImov = request.getParameter("codImovel");
            String tip = request.getParameter("tipo");
            String situ = request.getParameter("situacao");
            double vInicial = 0;
            double vFinal = 300000;
            double aInicial = 0;
            double aFinal = 300000;
            //double vInicial = Double.parseDouble(request.getParameter("min"));
            //double vFinal = Double.parseDouble(request.getParameter("min"));
            //double aInicial = Double.parseDouble(request.getParameter("max"));
            //double aFinal = Double.parseDouble(request.getParameter("max"));
            String serv = request.getParameter("servico");
            String est = request.getParameter("uf");

            System.out.println("MIN: " + request.getParameter("min"));
            System.out.println("MAX: " + request.getParameter("max"));
            System.out.println("codImov: " + codImov
                    + "\ntip: " + tip
                    + "\nvInicial: " + vInicial
                    + "\nvFinal: " + vFinal
                    + "\naInicial: " + aInicial
                    + "\naFinal: " + aFinal
                    + "\nserv: " + serv
                    + "\nest: " + est);

            try {
                lista = daoImovel.listar(codImov, tip, situ, vInicial, vFinal, aInicial, aFinal, serv, est);

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("lista", lista);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ListarImoveis.jsp");
            dispatcher.forward(request, response);

        } else if (request.getParameter("comando").equals("excluir")) {
            //ATUALIZANDO NO BANCO
            DaoImovel daoImovel = new DaoImovel();

            int idImovel = Integer.parseInt(request.getParameter("idImovel"));

            try {
                daoImovel.excluir(idImovel);

            } catch (SQLException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            }

            RequestDispatcher dispatcher
                    = request.getRequestDispatcher("CadastroResposta.jsp");
            dispatcher.forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("comando").equals("cadastrar")) {
            //Pegando as informações que estão sendo passadas pelo formulario
            Imovel imovel = new Imovel();

            imovel.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
            imovel.setDataCad(request.getParameter("dataCad"));
            imovel.setCategoria(request.getParameter("categoria"));
            imovel.setTipo(request.getParameter("tipo"));
            imovel.setQuartos(Integer.parseInt(request.getParameter("quartos")));
            imovel.setBanheiros(Integer.parseInt(request.getParameter("banheiros")));
            imovel.setSuites(Integer.parseInt(request.getParameter("suites")));
            imovel.setVagasGaragem(Integer.parseInt(request.getParameter("vagasGaragem")));
            imovel.setAreaUtil(Double.parseDouble(request.getParameter("areaUtil")));
            imovel.setAreaTotal(Double.parseDouble(request.getParameter("areaTotal")));
            imovel.setInformacao(request.getParameter("informacao"));
            imovel.setCep(request.getParameter("cep"));
            imovel.setRua(request.getParameter("rua"));
            imovel.setBairro(request.getParameter("bairro"));
            imovel.setCidade(request.getParameter("cidade"));
            imovel.setUf(request.getParameter("uf"));
            imovel.setNum(request.getParameter("num"));
            imovel.setComplemento(request.getParameter("complemento"));
            imovel.setValorVenda(Double.parseDouble(request.getParameter("valorVenda")));
            imovel.setValorAluguel(Double.parseDouble(request.getParameter("valorAluguel")));
            imovel.setIptu(Double.parseDouble(request.getParameter("iptu")));
            imovel.setCondominio(Double.parseDouble(request.getParameter("condominio")));
            imovel.setSituacao(request.getParameter("situacao"));
            imovel.setServico(request.getParameter("servico"));
            imovel.setCodImovel("000111222");

            DaoImovel daoImovel = new DaoImovel();

            try {
                daoImovel.inserir(imovel);
            } catch (SQLException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("imovelCadastrado", imovel);
            RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroResposta.jsp");
            dispatcher.forward(request, response);

        } else if (request.getParameter("comando").equals("listaEditar")) {

            Imovel imovel = new Imovel();

            imovel.setIdImovel(Integer.parseInt(request.getParameter("idImovel")));

            DaoImovel daoImovel = new DaoImovel();

            try {
                imovel = daoImovel.buscar(imovel);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("imovel", imovel);
            RequestDispatcher dispatcher = request.getRequestDispatcher("EditarImovel.jsp");
            dispatcher.forward(request, response);

        } else if (request.getParameter("comando").equals("editar")) {
            //Pegando as informações que estão sendo passadas pelo formulario
            Imovel imovel = new Imovel();

            imovel.setDataCad(request.getParameter("dataCad"));
            imovel.setCategoria(request.getParameter("categoria"));
            imovel.setTipo(request.getParameter("tipo"));
            imovel.setQuartos(Integer.parseInt(request.getParameter("quartos")));
            imovel.setBanheiros(Integer.parseInt(request.getParameter("banheiros")));
            imovel.setSuites(Integer.parseInt(request.getParameter("suites")));
            imovel.setVagasGaragem(Integer.parseInt(request.getParameter("vagasGaragem")));
            imovel.setAreaUtil(Double.parseDouble(request.getParameter("areaUtil")));
            imovel.setAreaTotal(Double.parseDouble(request.getParameter("areaTotal")));
            imovel.setInformacao(request.getParameter("informacao"));
            imovel.setCep(request.getParameter("cep"));
            imovel.setRua(request.getParameter("rua"));
            imovel.setBairro(request.getParameter("bairro"));
            imovel.setCidade(request.getParameter("cidade"));
            imovel.setUf(request.getParameter("uf"));
            imovel.setNum(request.getParameter("num"));
            imovel.setComplemento(request.getParameter("complemento"));
            imovel.setValorVenda(Double.parseDouble(request.getParameter("valorVenda")));
            imovel.setValorAluguel(Double.parseDouble(request.getParameter("valorAluguel")));
            imovel.setIptu(Double.parseDouble(request.getParameter("iptu")));
            imovel.setCondominio(Double.parseDouble(request.getParameter("condominio")));
            imovel.setSituacao(request.getParameter("situacao"));
            imovel.setServico(request.getParameter("servico"));
            imovel.setCodImovel(request.getParameter("codImovel"));

            DaoImovel daoImovel = new DaoImovel();

            try {
                daoImovel.editar(imovel);
            } catch (SQLException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("imovelCadastrado", imovel);
            RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroResposta.jsp");
            dispatcher.forward(request, response);

        }

    }
}
