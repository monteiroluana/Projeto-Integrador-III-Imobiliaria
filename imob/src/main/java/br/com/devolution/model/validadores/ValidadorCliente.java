/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.devolution.model.validadores;

import br.com.devolution.dao.DaoCliente;
import br.com.devolution.exceptions.ClienteException;
import br.com.devolution.model.Cliente;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author jonas.aribeiro
 * // 
 */

//VERIFICAR OS DADOS A SER VALIDADOS DE 'CLIENTE'
public class ValidadorCliente {

    public static boolean validar(Cliente cliente) throws ClienteException, Exception {
        
        if (cliente == null) {
            throw new ClienteException("Não foi informado um cliente");
        }
        if (cliente.getNome() == null || "".equals(cliente.getNome())) {
            throw new ClienteException("É necessário informar o nome do cliente");
        }
         if (cliente.getEmail() == null || "".equals(cliente.getEmail())) {
            throw new ClienteException("Campo email vazio");
        } else if (cliente.getEmail() != null && cliente.getEmail().length() > 0) {
            String expression = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{2,4}$";
            Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
            Matcher matcher = pattern.matcher(cliente.getEmail());
            if (!matcher.matches()) {
                throw new ClienteException("Email inválido");
            }
        }
         
         DaoCliente daoCliente = new DaoCliente();
         if (daoCliente.obterCpf(cliente.getCpf()) ){
            throw new ClienteException("CPF já cadastrado no sistema");
        }
         
         if (cliente.getDataNasc() == null) {
            throw new ClienteException("É necessário informar a data de nascimento");
        }
         
        if (cliente.getTelefone() == null || "".equals(cliente.getTelefone())) {
            throw new ClienteException("É necessário informar o Telefone");
        }                
        
        return true;
    }
    
    public static boolean validarEdicao(Cliente cliente) throws ClienteException, Exception {
        
        if (cliente == null) {
            throw new ClienteException("Não foi informado um cliente");
        }
        if (cliente.getNome() == null || "".equals(cliente.getNome())) {
            throw new ClienteException("É necessário informar o nome do cliente");
        }
         if (cliente.getEmail() == null || "".equals(cliente.getEmail())) {
            throw new ClienteException("Campo email vazio");
        } else if (cliente.getEmail() != null && cliente.getEmail().length() > 0) {
            String expression = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{2,4}$";
            Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
            Matcher matcher = pattern.matcher(cliente.getEmail());
            if (!matcher.matches()) {
                throw new ClienteException("Email inválido");
            }
        }
         
//         DaoCliente daoCliente = new DaoCliente();
//         if (daoCliente.obterCpf(cliente.getCpf()) ){
//            throw new ClienteException("CPF já cadastrado no sistema");
//        }
         
         if (cliente.getDataNasc() == null) {
            throw new ClienteException("É necessário informar a data de nascimento");
        }
         
        if (cliente.getTelefone() == null || "".equals(cliente.getTelefone())) {
            throw new ClienteException("É necessário informar o Telefone");
        }                
        
        return true;
    }
    

}
