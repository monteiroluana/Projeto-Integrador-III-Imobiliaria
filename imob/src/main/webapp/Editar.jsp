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
        <style>
            ul{list-style:none;padding:0px}	
            a{text-decoration:none;color:white;font-family:arial}
            a:hover{text-decoration:none;color:red;font-family:arial}
            ul li{ width:290px;padding:5px;display: inline; padding: 2px 30px;}		
            #menu{background-color: #262626;height: 60px;line-height: 60px;text-align: center;}
        </style>
    </head>
    <body>
        <h1 style="text-align: center">Editar usuário</h1>
        <hr>
        <div id="menu">
            <ul>
                <li><a href="CadastroUsuario.jsp">cadastro usuário</a></li>
                <li><a href="CadastroCliente.jsp">cadastro cliente</a></li>
                <li><a href="usuario?action=lista">listar usuário</a></li>
                <li><a href="cliente?action=lista">listar cliente</a></li>
            </ul>
        </div>

        <form action="EditarConfirm.jsp" method="POST">
            <p><input type="hidden" name="idUsuario" value="<%=usuario.getIdUsuario()%>"></p>
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
