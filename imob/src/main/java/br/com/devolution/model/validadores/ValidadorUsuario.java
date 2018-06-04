/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.devolution.model.validadores;

import br.com.devolution.exceptions.UsuarioException;
import br.com.devolution.model.Usuario;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author jonas.aribeiro
 */
public class ValidadorUsuario {

    public static boolean validar(Usuario usuario) throws UsuarioException {
        if (usuario == null) {
            throw new UsuarioException("Não foi informado um usuario");
        }
        if (usuario.getNome() == null || "".equals(usuario.getNome())) {
            throw new UsuarioException("É necessário informar o nome do usuario");
        }
         if (usuario.getEmail() == null || "".equals(usuario.getEmail())) {
            throw new UsuarioException("Campo email vazio");
        } else if (usuario.getEmail() != null && usuario.getEmail().length() > 0) {
            String expression = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{2,4}$";
            Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
            Matcher matcher = pattern.matcher(usuario.getEmail());
            if (!matcher.matches()) {
                throw new UsuarioException("Email inválido");
            }
        }
        if (usuario.getLogin() == null || "".equals(usuario.getLogin())) {
            throw new UsuarioException("É necessário informar o Login");
        }
        if (usuario.getSenha() == null || "".equals(usuario.getSenha())) {
            throw new UsuarioException("É necessário informar o senha");
        }
        
        String x = usuario.getSenha();
        int i = usuario.getSenha().length();
        
        if (usuario.getSenha().length() < 8 || usuario.getSenha().length() > 25) {
            throw new UsuarioException("Quantidade de caracteres da senha entre 8 e 25");
        }
        if (usuario.getGrupoFilial() == null || "".equals(usuario.getGrupoFilial())) {
            throw new UsuarioException("É necessário informar a Filial");
        }
        if (usuario.getGrupoFilial() == null || "Selecione".equals(usuario.getGrupoFilial())) {
            throw new UsuarioException("É necessário informar a Filial");
        }
        if (usuario.getDepartamento() == null || "Selecione".equals(usuario.getDepartamento())) {
            throw new UsuarioException("É necessário informar o Departamento");
        }
        if (usuario.getCargo() == null || "Selecione".equals(usuario.getCargo())) {
            throw new UsuarioException("É necessário informar o Cargo");
        }
        
        return true;
    }

}
