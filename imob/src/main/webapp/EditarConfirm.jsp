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
    usuario.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
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
        <style>
            ul{list-style:none;padding:0px}	
            a{text-decoration:none;color:white;font-family:arial}
            #menu ul li a:hover{text-decoration:none;color:red;font-family:arial}
            #menu ul li a:visited{color:white;}
            ul li{ width:290px;padding:5px;display: inline; padding: 2px 30px;}		
            #menu{background-color: #262626;height: 60px;line-height: 60px;text-align: center;}
        </style>
    </head>
    <body>
        <h1 style="text-align: center">LISTA DE USUÁRIOS</h1>
        <hr>
        <div id="menu">
            <ul>
                <li><a href="CadastroUsuario.jsp">cadastro usuário</a></li>
                <li><a href="CadastroCliente.jsp">cadastro cliente</a></li>
                <li><a href="usuario?action=lista">listar usuário</a></li>
                <li><a href="cliente?action=lista">listar cliente</a></li>
            </ul>
        </div>
        <h3>Usuário: <%=usuario.getNome()%></h3>
        <h3>Login:<%=usuario.getLogin()%></h3>
        <h3>Senha:<%=usuario.getSenha()%></h3>
        <h3>Email:<%=usuario.getEmail()%></h3>
        <h3>Grupo:<%=usuario.getGrupoFilial()%></h3>
        <h3>Depar:<%=usuario.getDepartamento()%></h3>
        <h3>Cargo:<%=usuario.getCargo()%></h3>
    </body>
</html>
