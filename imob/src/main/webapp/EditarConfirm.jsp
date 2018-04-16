<%-- 
    Document   : EditarConfirm
    Created on : 15/04/2018, 20:55:54
    Author     : Luana
--%>

<%@page import="br.com.evolution.dao.DaoUsuario"%>
<%@page import="br.com.evolution.model.Usuario"%>
<%
    Usuario usuario = new Usuario();
    //peguei as informações do formulário 
    usuario.setNome(request.getParameter("nome"));
    usuario.setLogin(request.getParameter("login"));
    usuario.setSenha(request.getParameter("senha"));
    usuario.setEmail(request.getParameter("email"));
    usuario.setGrupoFilial(request.getParameter("grupoFilial"));
    usuario.setDepartamento(request.getParameter("departamento"));
    usuario.setCargo(request.getParameter("cargo"));

//ATUALIZANDO NO BANCO
    DaoUsuario daoUsuario = new DaoUsuario();
    daoUsuario.atualizar(usuario);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Usuário: <%=usuario.getNome()%></h1>
        <h3>Login:<%=usuario.getLogin()%></h3>
        <h3>Senha:<%=usuario.getSenha()%></h3>
        <h3>Email:<%=usuario.getEmail()%></h3>
        <h3>Grupo:<%=usuario.getGrupoFilial()%></h3>
        <h3>Depar:<%=usuario.getDepartamento()%></h3>
        <h3>Cargo:<%=usuario.getCargo()%></h3>
    </body>
</html>
