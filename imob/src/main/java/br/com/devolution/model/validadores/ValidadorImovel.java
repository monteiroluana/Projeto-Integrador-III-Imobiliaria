package br.com.devolution.model.validadores;

import br.com.devolution.dao.DaoImovel;
import br.com.devolution.model.Imovel;
import br.com.devolution.exceptions.ImovelException;
import br.com.devolution.model.Usuario;
import java.sql.SQLException;

//AINDA EM DESENVOLVIMENTO!!!!
public class ValidadorImovel {

    public static boolean validar(Imovel imovel) throws ImovelException, ClassNotFoundException, SQLException {
        DaoImovel daoImovel = new DaoImovel();

        if (imovel == null) {
            throw new ImovelException("Imovel não informado.");
        }

        if (imovel.getIdCliente() <= -1) {
            throw new ImovelException("Cliente não informado");
        }

        if (daoImovel.conferirCodImovel(imovel.getCodImovel())) {
            throw new ImovelException("Código do Imovel já cadastrado no sistema");
        }

        if (imovel.getDataCad() == null) {
            throw new ImovelException("É necessário informar a data de cadastro");
        }

        if (imovel.getAreaUtil() > imovel.getAreaTotal()) {
            throw new ImovelException("Area útil maior do que área total!");
        }

        if (imovel.getServico().equals("Selecione")) {
            throw new ImovelException("Serviço não informado");
        }

        if (imovel.getCategoria().equals("Selecione")) {
            throw new ImovelException("Categoria não informado");
        }

        if (imovel.getTipo().equals("Selecione")) {
            throw new ImovelException("Tipo do imóvel não informado");
        }

        return true;
    }

    public static boolean validarEdicao(Imovel imovel) throws ImovelException, ClassNotFoundException, SQLException {
        DaoImovel daoImovel = new DaoImovel();
        // dados do cliente

        if (imovel == null) {
            throw new ImovelException("Imovel não informado.");
        }

        if (imovel.getIdCliente() <= -1) {
            throw new ImovelException("Cliente não informado");
        }

//         if (daoImovel.conferirCodImovel(imovel.getCodImovel()) ){
//            throw new ImovelException("Código do Imovel já cadastrado no sistema");
//        }
        if (imovel.getDataCad() == null) {
            throw new ImovelException("É necessário informar a data de cadastro");
        }

        if (imovel.getAreaUtil() > imovel.getAreaTotal()) {
            throw new ImovelException("Area útil maior do que área total!");
        }

        if (imovel.getServico().equals("Selecione")) {
            throw new ImovelException("Serviço não informado");
        }

        if (imovel.getCategoria().equals("Selecione")) {
            throw new ImovelException("Categoria não informado");
        }

        if (imovel.getTipo().equals("Selecione")) {
            throw new ImovelException("Tipo do imóvel não informado");
        }

        return true;
    }

    public String convertUf(Usuario usuarioLogado) throws ImovelException {

        if (usuarioLogado.getGrupoFilial().equals("Recife")) {
            return "PE";

        } else if (usuarioLogado.getGrupoFilial().equals("Sao Paulo")) {
            return "SP";

        } else if (usuarioLogado.getGrupoFilial().equals("Porto Alegre")) {
            return "RS";

        } else {
            throw new ImovelException("Imóvel não esta no mesmo estado da filial");

        }
    }

}
