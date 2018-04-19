<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <h1 style="text-align: center">Lista de Clientes</h1>
        <hr>
        <div id="menu">
            <ul>
                <li><a href="CadastroUsuario.jsp">cadastro usuário</a></li>
                <li><a href="CadastroCliente.jsp">cadastro cliente</a></li>
                <li><a href="usuario?action=lista">listar usuário</a></li>
                <li><a href="cliente?action=lista">listar cliente</a></li>
            </ul>
        </div>
        <table border="1" id="tabela">

            <tr>
                <th style="display:none">ID.USUARIO</th>
                <th>CPF</th>
                <th>NOME</th>
                <th>NASCIMENTO</th>
                <th>SEXO</th>
                <th>TELEFONE</th>
                <th>CELULAR</th>
                <th>EMAIL</th>
                <th>--AÇÃO--</th>
            </tr>
            <c:forEach items="${lista}" var="c">
                <tr>
                    <td><c:out value="${c.cpf}" /></td>
                    <td><c:out value="${c.nome}" /></td>
                    <td><c:out value="${c.dataNasc}" /></td>
                    <td><c:out value="${c.sexo}" /></td>
                    <td><c:out value="${c.telefone}" /></td>
                    <td><c:out value="${c.celular}" /></td>
                    <td><c:out value="${c.email}" /></td>
                    <td><a href="#">Editar</a>
                        <a href="#">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
