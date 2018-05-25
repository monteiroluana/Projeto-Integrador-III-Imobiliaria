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
        
        if (imovel.getIdCliente() <= -1) {
            throw new ImovelException("Cliente não informado");
        }
        
        
         if (daoImovel.conferirCodImovel(imovel.getCodImovel()) ){
            throw new ImovelException("Código do Imovel já cadastrado no sistema");
        }
         
         if (imovel.getDataCad() == null) {
            throw new ImovelException("É necessário informar a data de cadastro");
        }
         
         
        
        return true;
    }
    
}
