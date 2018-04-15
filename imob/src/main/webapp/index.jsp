<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
       <h1 style="text-align: center">Cadastro de usuário</h1>
        <hr>
        
        <form action="fimCadastro.jsp" method="POST">
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
