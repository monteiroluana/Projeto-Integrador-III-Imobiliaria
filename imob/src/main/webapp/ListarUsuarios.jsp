<%@page import="java.util.List"%>
<%@page import="br.com.evolution.model.Usuario"%>
<%@page import="br.com.evolution.dao.DaoUsuario"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    //  DaoUsuario daoUsuario = new DaoUsuario();
// LISTANDO 
    //List<Usuario> lista = daoUsuario.listar();

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            ul{list-style:none;padding:0px}	
            a{text-decoration:none;font-family:arial;}
            #tabela a{color:black}
            #tabela a:hover{color:blue;}
            #menu ul li a:hover{text-decoration:none;color:red;font-family:arial}
            #menu ul li a:visited{color:white;}
            ul li{ width:290px;padding:5px;display: inline; padding: 2px 30px;}		
            #menu{background-color: #262626;height: 60px;line-height: 60px;text-align: center;color:white;}
        </style>
    </head>
    <body>
        <h1 style="text-align: center">LISTA DE USUÁRIOS</h1>
        <hr>
        <div id="menu">
            <ul>
                <li><a href="CadastroUsuario.jsp">CADASTRO</a></li>
                <li><a href="usuario?action=lista">LISTAR USUÁRIOS</a></li>
            </ul>
        </div>
        <table border="1" id="tabela">

            <tr>
                <th style="display:none">ID.USUARIO</th>
                <th>NOME</th>
                <th>LOGIN</th>
                <th>SENHA</th>
                <th>EMAIL</th>
                <th>GRUPO/FILIAL</th>
                <th>DEPARTAMENTO</th>
                <th>CARGO</th>
                <th>--AÇÃO--</th>
            </tr>
            <c:forEach items="${lista}" var="u">
                <tr>
                    <td><c:out value="${u.nome}" /></td>
                    <td><c:out value="${u.login}" /></td>
                    <td><c:out value="${u.senha}" /></td>
                    <td><c:out value="${u.email}" /></td>
                    <td><c:out value="${u.grupoFilial}" /></td>
                    <td><c:out value="${u.departamento}" /></td>
                    <td><c:out value="${u.cargo}" /></td>
                    <td><a href="#">Editar</a>
                        <a href="#">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
