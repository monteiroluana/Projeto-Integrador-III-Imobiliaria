<%-- 
    Document   : fimCadastro
    Created on : 15/04/2018, 16:20:09
    Author     : Luana
--%>
<%@page import="br.com.evolution.dao.DaoUsuario"%>
<%@page import="br.com.evolution.model.Usuario"%>
<%@page import="java.util.List"%>

<%
    Usuario usuario = new Usuario();
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
    daoUsuario.iserir(usuario);
    
// LISTANDO 
    List<Usuario> lista = daoUsuario.listar();

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <th>NOME</th>
                <th>LOGIN</th>
                <th>SENHA</th>
                <th>EMAIL</th>
                <th>GRUPO/FILIAL</th>
                <th>DEPARTAMENTO</th>
                <th>CARGO</th>
            </tr>
            <%
            for(Usuario u: lista){
            %>

            <tr>
                <td><%=u.getNome()%></td>
                <td><%=u.getLogin()%></td>
                <td><%=u.getSenha()%></td>
                <td><%=u.getEmail()%></td>
                <td><%=u.getGrupoFilial()%></td>
                <td><%=u.getDepartamento()%></td>
                <td><%=u.getCargo()%></td>

            </tr>

            <%
            };
            %>

    </body>
</html>
