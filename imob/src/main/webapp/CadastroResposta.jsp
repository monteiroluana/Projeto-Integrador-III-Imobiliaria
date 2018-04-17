<%-- 
    Document   : fimCadastro
    Created on : 15/04/2018, 16:20:09
    Author     : Luana
--%>
<%@page import="br.com.evolution.dao.DaoUsuario"%>
<%@page import="br.com.evolution.model.Usuario"%>
<%@page import="java.util.List"%>

<%
  /*  Usuario usuario = new Usuario();
    //peguei as informações do formulário 
    usuario.setNome(request.getParameter("nome"));
    usuario.setLogin(request.getParameter("login"));
    usuario.setSenha(request.getParameter("senha"));
    usuario.setEmail(request.getParameter("email"));
    usuario.setGrupoFilial(request.getParameter("grupoFilial"));
    usuario.setDepartamento(request.getParameter("departamento"));
    usuario.setCargo(request.getParameter("cargo"));

// INSERINDO NO BANCO
    DaoUsuario daoUsuario = new DaoUsuario();
    daoUsuario.inserir(usuario);*/

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
        <h1 style="text-align: center">FIM - Cadastro de usuário</h1>
        <hr>
        <div id="menu">
            <ul>
                <li><a href="CadastroUsuario.jsp">CADASTRO</a></li>
                <li><a href="ListarUsuarios.jsp">LISTAR USUÁRIOS</a></li>
            </ul>
        </div>

        <h2 style="text-align: center"><%=usuario.getNome()%> cadastrado com Sucesso!</h2>


    </body>
</html>
