<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="text-align: center">FIM - Cadastro de usuário</h1>
        <hr>

        <table border="1">

            <tr>
                <th>ID.USUARIO</th>
                <th>NOME</th>
                <th>LOGIN</th>
                <th>SENHA</th>
                <th>EMAIL</th>
                <th>GRUPO/FILIAL</th>
                <th>DEPARTAMENTO</th>
                <th>CARGO</th>
                <th>--AÇÃO--</th>
            </tr>
            <c:forEach items="${usuario}" var="u">
                <tr>
                    <td><c:out value="${u.nome}"/></td>
                    <td><c:out value="${u.login}"/></td>
                    <td><c:out value="${u.senha}"/></td>
                    <td><c:out value="${u.email}"/></td>
                    <td><c:out value="${u.grupoFilial}"/></td>
                    <td><c:out value="${u.departamento}"/></td>
                    <td><c:out value="${u.cargo}"/></td>
                    <td> <a href="Editar.jsp?idUsuario=<c:out value="${u.idUsuario}"/>">Editar</a> 
                        <a href="Excluir.jsp?idUsuario=<c:out value="${u.idUsuario}"/>">Excluir</a>
                    </td>

                </tr>
            </c:forEach>

        </table>

    </body>
</html>
