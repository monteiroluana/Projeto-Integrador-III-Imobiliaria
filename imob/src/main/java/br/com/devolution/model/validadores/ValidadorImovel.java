/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.devolution.model.validadores;
import br.com.devolution.dao.DaoImovel;
import br.com.devolution.model.Imovel;
import br.com.devolution.exceptions.ImovelException;
import java.sql.SQLException;

/**
 *
 * @author jonas.aribeiro
 * 
 * 
 */

//AINDA EM DESENVOLVIMENTO!!!!
public class ValidadorImovel {
    public static boolean validar(Imovel imovel) throws ImovelException, ClassNotFoundException, SQLException{
        DaoImovel daoImovel = new DaoImovel();
        // dados do cliente
        
        if(imovel == null){
        throw new ImovelException("Imovel não informado.");
        }
        
        if (imovel.getIdCliente() <= -1) {
            throw new ImovelException("Cliente não informado");
        }
        
        
         if (daoImovel.conferirCodImovel(imovel.getCodImovel()) ){
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
          
          if (imovel.getSituacao().equals("Selecione")) {
            throw new ImovelException("Status não informado");
        }                  
        
        return true;
    }
    
    public static boolean validarEdicao(Imovel imovel) throws ImovelException, ClassNotFoundException, SQLException{
        DaoImovel daoImovel = new DaoImovel();
        // dados do cliente
        
        if(imovel == null){
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
          
          if (imovel.getSituacao().equals("Selecione")) {
            throw new ImovelException("Status não informado");
        }                  
        
        return true;
    }
    
    
}
