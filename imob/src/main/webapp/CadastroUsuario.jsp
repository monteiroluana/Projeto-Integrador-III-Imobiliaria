<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <h1 style="text-align: center">Cadastrar Usuário</h1>
        <hr>
        <div id="menu">
            <ul>
                <li><a href="CadastroUsuario.jsp">cadastro usuário</a></li>
                <li><a href="CadastroCliente.jsp">cadastro cliente</a></li>
                <li><a href="usuario?action=lista">listar usuário</a></li>
                <li><a href="cliente?action=lista">listar cliente</a></li>
            </ul>
        </div>

        <form action="usuario" method="POST">
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
