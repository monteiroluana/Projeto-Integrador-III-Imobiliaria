package br.com.devolution.servlet;

import br.com.devolution.dao.DaoCliente;
import br.com.devolution.dao.DaoContrato;
import br.com.devolution.dao.DaoImovel;
import br.com.devolution.model.Cliente;
import br.com.devolution.model.Contrato;
import br.com.devolution.model.Imovel;
import br.com.devolution.model.Usuario;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "contrato", urlPatterns = {"/contrato"})
public class ServletContrato extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DaoContrato daoContrato = new DaoContrato();

        if (request.getParameter("comando").equals("lista")) {

            DateFormat formatador;
            formatador = new SimpleDateFormat("dd/MM/yyyy");
            Date dtInicio = null, dtFim = null;

            try {
                //Convertendo as datas passadas por parâmetro em tipo 'Date'
                dtInicio = formatador.parse(request.getParameter("dtInicio"));
                dtFim = formatador.parse(request.getParameter("dtFim"));

            } catch (ParseException ex) {
                Logger.getLogger(ServletContrato.class.getName()).log(Level.SEVERE, null, ex);
            }

            List<Contrato> lista = null;

            try {
                //Listar contratos num intervalo de datas
                lista = daoContrato.listar(dtInicio, dtFim);

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletContrato.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletContrato.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("lista", lista);
            RequestDispatcher dispatcher = request.getRequestDispatcher("relatorios.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DaoImovel daoImovel = new DaoImovel();
        DaoCliente daoCliente = new DaoCliente();
        Cliente cliente = new Cliente();
        Imovel imovel = new Imovel();
        String pag = null;
        HttpSession session = request.getSession();
        Usuario usuSession = (Usuario) session.getAttribute("usuAutenticado");
        String nome = usuSession.getNome();
        usuSession.getIdUsuario();

        //Se o locatário estiver vázio, será feita a busca do cliente pelo cpf que que está sendo passado por parâmetro 
        if (request.getParameter("locatario").equals("")) {

            int codGerado = -1;

            try {
                //Buscando cliente por cpf
                cliente = daoCliente.buscarPorCpf(request.getParameter("cpf"));
                imovel.setIdImovel(Integer.parseInt(request.getParameter("idImovel")));
                imovel = daoImovel.buscar(imovel);

                codGerado = DaoContrato.gerarCod();

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletContrato.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletContrato.class.getName()).log(Level.SEVERE, null, ex);
            }
            //Retornando codigo gerado para o contrato, Imovel e o cliente(Locatário)
            request.setAttribute("codContrato", codGerado);
            request.setAttribute("imovel", imovel);
            request.setAttribute("cliente", cliente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("venda.jsp");
            dispatcher.forward(request, response);
        }

        //Se locatário e idImovel não estiver vazio, será cadastrado o contrato
        if (!request.getParameter("locatario").equals("") && !request.getParameter("idImovel").equals("")) {
            Contrato contrato = new Contrato();
            DaoContrato daoContrato = new DaoContrato();

            //Pegando as informações do formulário para cadastrar o contrato
            contrato.setIdImovel(Integer.parseInt(request.getParameter("idImovel")));
            contrato.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
            contrato.setCodContrato(Integer.parseInt(request.getParameter("codContrato")));
            contrato.setDataContrato(request.getParameter("datetimepicker"));
            contrato.setDataInicial(request.getParameter("datetimepicker_de"));
            contrato.setDataFinal(request.getParameter("datetimepicker_ate"));

            try {
                //Enviando um objeto contrato para o banco de dados
                daoContrato.inserir(contrato);
            } catch (SQLException ex) {
                Logger.getLogger(ServletContrato.class.getName()).log(Level.SEVERE, null, ex);
            }
            String msg = "<script>alert('Contrato cadastrado com sucesso');</script>";

            //Retornando uma mensangem de sucesso ou erro e redirecionando para tela ListarImoveis
            request.setAttribute("msg", msg);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ListarImoveis.jsp");
            dispatcher.forward(request, response);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("ListarImoveis.jsp");
        dispatcher.forward(request, response);
    }

}
