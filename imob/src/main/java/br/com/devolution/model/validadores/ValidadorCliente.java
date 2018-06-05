/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.devolution.model.validadores;

import br.com.devolution.dao.DaoCliente;
import br.com.devolution.exceptions.ClienteException;
import br.com.devolution.model.Cliente;
import br.com.devolution.model.Usuario;
import java.util.InputMismatchException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author jonas.aribeiro //
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
        if (daoCliente.obterCpf(cliente.getCpf())) {
            throw new ClienteException("CPF já cadastrado no sistema");
        }

        if (cliente.getDataNasc() == null) {
            throw new ClienteException("É necessário informar a data de nascimento");
        }

        if (cliente.getTelefone() == null || "".equals(cliente.getTelefone())) {
            throw new ClienteException("É necessário informar o Telefone");
        }

        if (cliente.getCpf() != null) {
            if (!validarCPF(cliente)) {
                throw new ClienteException("É necessário informar o Telefone");
            }

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

    public static boolean validarCPF(Cliente cliente) throws ClienteException, Exception {

        if (cliente.getCpf().equals("00000000000") || cliente.getCpf().equals("11111111111")
                || cliente.getCpf().equals("22222222222") || cliente.getCpf().equals("33333333333")
                || cliente.getCpf().equals("44444444444") || cliente.getCpf().equals("55555555555")
                || cliente.getCpf().equals("66666666666") || cliente.getCpf().equals("77777777777")
                || cliente.getCpf().equals("88888888888") || cliente.getCpf().equals("99999999999")
                || (cliente.getCpf().length() != 11)) {
            return (false);
        }

        char dig10, dig11;
        int sm, i, r, num, peso;

// "try" - protege o codigo para eventuais erros de conversao de tipo (int)
        try {
// Calculo do 1o. Digito Verificador
            sm = 0;
            peso = 10;
            for (i = 0; i < 9; i++) {
// converte o i-esimo caractere do cliente.getCpf() em um numero:
// por exemplo, transforma o caractere '0' no inteiro 0         
// (48 eh a posicao de '0' na tabela ASCII)         
                num = (int) (cliente.getCpf().charAt(i) - 48);
                sm = sm + (num * peso);
                peso = peso - 1;
            }

            r = 11 - (sm % 11);
            if ((r == 10) || (r == 11)) {
                dig10 = '0';
            } else {
                dig10 = (char) (r + 48); // converte no respectivo caractere numerico
            }
// Calculo do 2o. Digito Verificador
            sm = 0;
            peso = 11;
            for (i = 0; i < 10; i++) {
                num = (int) (cliente.getCpf().charAt(i) - 48);
                sm = sm + (num * peso);
                peso = peso - 1;
            }

            r = 11 - (sm % 11);
            if ((r == 10) || (r == 11)) {
                dig11 = '0';
            } else {
                dig11 = (char) (r + 48);
            }

// Verifica se os digitos calculados conferem com os digitos informados.
            if ((dig10 == cliente.getCpf().charAt(9)) && (dig11 == cliente.getCpf().charAt(10))) {
                return true;
            } else {
                return (false);
            }
        } catch (InputMismatchException erro) {
            return (false);
        }
    }

}
