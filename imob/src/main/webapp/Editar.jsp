<%-- 
    Document   : Editar
    Created on : 15/04/2018, 19:48:32
    Author     : Luana
--%>
<%@page import="java.util.List"%>
<%@page import="br.com.evolution.model.Usuario"%>
<%@page import="br.com.evolution.dao.DaoUsuario"%>
<%
    DaoUsuario daoUsuario = new DaoUsuario();
    Usuario usuario = new Usuario();

    usuario.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
     
    usuario = daoUsuario.buscar(usuario);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="text-align: center">Editar usuário</h1>
        
        <hr>

        <form action="EditarConfirm.jsp" method="POST">
            <p> Nome<input type="text" name="nome" value="<%=usuario.getNome()%>"> </p>
            <p> Login<input type="text" name="login" value="<%=usuario.getLogin()%>"></p>
            <p> Senha<input type="text" name="senha" value="<%=usuario.getSenha()%>"></p>
            <p> Email<input type="text" name="email" value="<%=usuario.getEmail()%>"></p>
            <p> Grupo<input type="text" name="grupoFilial" value="<%=usuario.getGrupoFilial()%>"> </p>
            <p> Depart<input type="text" name="departamento" value="<%=usuario.getDepartamento()%>"></p>
            <p> Cargo<input type="text" name="cargo" value="<%=usuario.getCargo()%>"></p>
            <input type="submit" value="Editar">
        </form>
    </body>
</html>
