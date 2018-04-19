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
        <h1 style="text-align: center">Cadastrar Cliente</h1>
        <hr>
        <div id="menu">
            <ul>
                <li><a href="CadastroUsuario.jsp">cadastro usuário</a></li>
                <li><a href="CadastroCliente.jsp">cadastro cliente</a></li>
                <li><a href="usuario?action=lista">listar usuário</a></li>
                <li><a href="cliente?action=lista">listar cliente</a></li>
            </ul>
        </div>

        <form action="cliente" method="POST">
            <p> <input type="text" name="cpf" placeholder=" cpf*"> </p>
            <p> <input type="text" name="nome" placeholder=" nome*"> </p>
            <p> <input type="text" name="dataNasc" placeholder=" nascimento*"></p>
            <p> <input type="text" name="sexo" placeholder=" sexo*"> </p>
            <p> <input type="text" name="telefone" placeholder=" telefone*"></p>
            <p> <input type="text" name="celular" placeholder=" celular*"> </p>
            <p> <input type="text" name="email" placeholder=" email*"></p>
            <p> <input type="text" name="cep" placeholder=" cep*"></p>
            <p> <input type="text" name="endereco" placeholder=" endereço*"> </p>
            <p> <input type="text" name="bairro" placeholder=" bairro*"> </p>
            <p> <input type="text" name="cidade" placeholder=" cidade*"> </p>
            <p> <input type="text" name="uf" placeholder=" uf*"> </p>
            <p> <input type="text" name="num" placeholder=" num*"> </p>
            <p> <input type="text" name="complemento" placeholder=" complemento*"> </p>
            <input type="submit" value="Cadastrar">
        </form>
    </body>
</html>
