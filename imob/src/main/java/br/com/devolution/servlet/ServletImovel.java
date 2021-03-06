package br.com.devolution.servlet;

import br.com.devolution.dao.DaoCliente;
import br.com.devolution.dao.DaoImovel;
import br.com.devolution.exceptions.ImovelException;
import br.com.devolution.model.Cliente;
import br.com.devolution.model.Imovel;
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
import br.com.devolution.model.validadores.ValidadorImovel;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpSession;

@WebServlet(name = "imovel", urlPatterns = {"/imovel"})
public class ServletImovel extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DaoImovel daoImovel = new DaoImovel();

        //puxar dados do usuario logado
        HttpSession sessao = request.getSession();
        Usuario usuarioLogado = new Usuario();
        usuarioLogado = (Usuario) sessao.getAttribute("usuAutenticado");

        ValidadorImovel validaImovelUf = new ValidadorImovel();

        if (request.getParameter("comando").equals("lista")) {

            List<Imovel> lista = null;

            String codImov = request.getParameter("codImovel");
            String tip = request.getParameter("tipo");
            String serv = request.getParameter("servico");

            //verifica a filial do usuario e expande o filtro para o Estado em que pertence
            String ufUsuario = null;
            try {
                ufUsuario = validaImovelUf.convertUf(usuarioLogado);
            } catch (ImovelException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                lista = daoImovel.listar(codImov, tip, serv, ufUsuario);
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
            int idImovel = Integer.parseInt(request.getParameter("idImovel"));

            try {
                daoImovel.excluir(idImovel);

            } catch (SQLException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("inicial.jsp");
            dispatcher.forward(request, response);

        } else if (request.getParameter("comando").equals("buscarImovel")) {
            Imovel imovel = new Imovel();
            imovel.setIdImovel(Integer.parseInt(request.getParameter("idImovel")));
            try {
                imovel = daoImovel.buscar(imovel);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("imovel", imovel);
            RequestDispatcher dispatcher = request.getRequestDispatcher("venda.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //puxar dados do usuario logado
        HttpSession sessao = request.getSession();
        Usuario usuarioLogado = new Usuario();
        usuarioLogado = (Usuario) sessao.getAttribute("usuAutenticado");

        ValidadorImovel validaImovelUf = new ValidadorImovel();

        Imovel imovel = new Imovel();
        
        //Enviar os dados para serem cadastros no db pela classe 'daoImovel.insert'
        if (request.getParameter("comando").equals("cadastrar")) {
            //Pegando as informações que estão sendo passadas pelo formulario

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
            imovel.setServico(request.getParameter("servico"));
            imovel.setCodImovel(request.getParameter("codImovel"));

            DaoImovel daoImovel = new DaoImovel();

            try {
                ValidadorImovel.validar(imovel);
                validaImovelUf.convertUf(usuarioLogado);
                daoImovel.inserir(imovel);
            } catch (SQLException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ImovelException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("imovelCadastrado", imovel);
            RequestDispatcher dispatcher = request.getRequestDispatcher("inicial.jsp");
            dispatcher.forward(request, response);

            //Pegando o imovel selecionado e passando os dados do imovel para tela de Editar
        } else if (request.getParameter("comando").equals("listaEditar")) {

            Cliente cliente = new Cliente();

            imovel.setIdImovel(Integer.parseInt(request.getParameter("idImovel")));

            DaoImovel daoImovel = new DaoImovel();
            DaoCliente daoCliente = new DaoCliente();
            String data = null;
            try {
                imovel = daoImovel.buscar(imovel);
                cliente.setIdCliente(imovel.getIdCliente());
                cliente = daoCliente.buscar(cliente);

                //formatando a data numa String temporariamente para mandar a data já formatada para a tela! ou não kkkk
                SimpleDateFormat formatar = new SimpleDateFormat("dd/MM/yyyy");
                data = (formatar.format(imovel.getDataCad()));

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ParseException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("dataCad", data);
            request.setAttribute("imovel", imovel);
            request.setAttribute("cliente", cliente);
            RequestDispatcher dispatcher = request.getRequestDispatcher("EditarImovel.jsp");
            dispatcher.forward(request, response);

            //Enviando os dados do imovel para serem atualizados no db
        } else if (request.getParameter("comando").equals("editar")) {
            //Pegando as informações que estão sendo passadas pelo formulario

            imovel.setIdImovel(Integer.parseInt(request.getParameter("idImovel")));
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
            imovel.setServico(request.getParameter("servico"));
            imovel.setCodImovel(request.getParameter("codImovel"));

            DaoImovel daoImovel = new DaoImovel();

            try {
                ValidadorImovel.validarEdicao(imovel);
                validaImovelUf.convertUf(usuarioLogado);
                daoImovel.editar(imovel);

            } catch (SQLException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ImovelException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletImovel.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("imovelCadastrado", imovel);
            RequestDispatcher dispatcher = request.getRequestDispatcher("inicial.jsp");
            dispatcher.forward(request, response);

        }

    }
}
