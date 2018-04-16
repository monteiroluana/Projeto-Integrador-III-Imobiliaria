<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <h1 style="text-align: center;color:red;">Cadastro de usuário</h1>
        <hr>
        
        <form action="${pageContext.request.contextPath}/inserirUsuario" method="POST">
            <p> <input type="text" name="nome" placeholder=" nome*"> </p>
            <p> <input type="text" name="login" placeholder=" login*"></p>
            <p> <input type="text" name="senha" placeholder=" senha*"></p>
            <p> <input type="text" name="email" placeholder=" email*"></p>
            <p> <input type="text" name="grupoFilial" placeholder=" grupo/filial*"> </p>
            <p> <input type="text" name="departamento" placeholder=" departamento*"></p>
            <p> <input type="text" name="cargo" placeholder=" cargo*"></p>
            <input type="submit" value="Cadastrar">
        </form>
    </body>
</html>
