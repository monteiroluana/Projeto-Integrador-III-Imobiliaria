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


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/styles.css">
<script src="http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/lib/w3data.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Consultar - Usuários</title>
<script>
    

</script>

<body>
    <div w3-include-html="menu.html"></div>
    <script>
        w3IncludeHTML();
    </script>

    <div class="main">
        <div class="container">
            <div class="row centered-form">
                <div >
                    <br>
                    <br>
                    <br>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Consultar Usuários</h3>
                        </div>
                        <div class="panel-body">
                            <form role="form">
                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <h3 class="panel-title">Filtrar busca</h3>

                                    </div>
                                    <hr>
                                </div>
                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-2">
                                        <div class="form-group">
                                            <div class="col-25">
                                                <label class="control-label" for="Departamento">Departamento*</label>
                                            </div>	
                                            <select id="Departamento" name="Departamento" class="form-control">
                                                <option value="1">Selecione</option>
                                                <option value="2">Diretoria</option>
                                                <option value="3">Administrativo</option>
                                                <option value="4">Vendas</option>
                                                <option value="5">TI</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-auto col-sm-auto col-md-2">
                                        <div class="form-group">
                                            <div class="col-25">
                                                <label class="control-label" for="categoria">Grupo/Filial*</label>
                                            </div>	
                                            <select id="categoria" name="categoria" class="form-control">
                                                <option value="1">Selecione</option>
                                                <option value="2">São Paulo</option>
                                                <option value="3">Porto Alegre</option>
                                                <option value="4">Recife</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-xs-auto col-sm-auto col-md-4">

                                        <div class="col-25">
                                            <label class="control-label" for="categoria">Busca por nome</label>
                                        </div>	
                                        <div id="custom-search-input">
                                            <div class="input-group col-md-12">
                                                <input type="text" class="form-control input-sm" placeholder="buscar" />
                                                <span class="input-group-btn">
                                                    <button class="btn btn-info btn-sm" type="button" id="PesquisaNome">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                </div>


                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-auto">
                                        <table class="table table-striped custab">
                                            <thead>
                                                <tr>
                                                    <th>Nome</th>
                                                    <th>Departamento</th>
                                                    <th>Cargo</th>
                                                    <th>Filial</th>
                                                    <th>Login</th>
                                                    <th class="text-center">Opções</th>
                                                </tr>
                                            </thead>
                                            
                                            <c:forEach items="${lista}" var="u">
                                                <form action="usuario?nome=${u.nome}&dpto=${u.departamento}&cargo=${u.cargo}&gf=${u.grupoFilial}&email=${u.email}&idUsuario=${u.idUsuario}&comando=listaEditar" method="GET">
                                                <tr>
                                                     
                                                    <td><c:out value="${u.nome}"/></td>
                                                    <td><c:out value="${u.departamento}" /></td>
                                                    <td><c:out value="${u.cargo}" /></td>
                                                    <td><c:out value="${u.grupoFilial}" /></td>
                                                    <td><c:out value="${u.email}" /></td>
                                                     <input style="display: none" value="${u.idUsuario}"/>                                                     
                                                                                                         
                                                    <td class="text-center">
                                                        <button type="button submit" class="btn btn-danger btn-sm"> Editar</a>
                                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerModal">Deletar</button>
                                                    </td>
                                                </tr>
                                                </form>
                                            </c:forEach>                                           
                                        </table>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>	
        </div>

        <dialog><div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Dados do Usuário</h4>
                    </div>
                    <div class="modal-body">

                        <form role="form">
                            <div class="row">
                                <div class="col-xs-auto col-sm-auto col-md-6">
                                    <label for="Nome" class="control-label">Nome*</label>
                                    <input type="text" name="Nome" id="Nome" class="form-control input-sm" placeholder="Nome Completo">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-auto col-sm-auto col-md-4">
                                    <div class="form-group">
                                        <div class="col-25">
                                            <label class="control-label" for="AlteraCategoria">Grupo/Filial*</label>
                                        </div>	
                                        <select id="AlteraCategoria" name="AlteraCategoria" class="form-control">
                                            <option value="1">Selecione</option>
                                            <option value="2">São Paulo</option>
                                            <option value="3">Porto Alegre</option>
                                            <option value="4">Recife</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-auto col-sm-auto col-md-4">
                                    <div class="form-group">
                                        <div class="col-25">
                                            <label class="control-label" for="AlteraDepartamento">Departamento*</label>
                                        </div>	
                                        <select id="AlteraDepartamento" name="AlteraDepartamento" class="form-control">
                                            <option value="1">Selecione</option>
                                            <option value="2">Diretoria</option>
                                            <option value="3">Administrativo</option>
                                            <option value="4">Vendas</option>
                                            <option value="5">TI</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-auto col-sm-auto col-md-4">
                                    <div class="form-group">
                                        <div class="col-25">
                                            <label class="control-label" for="AlteraCargo">Cargo*</label>
                                        </div>	
                                        <select id="AlteraCargo" name="AlteraCargo" class="form-control">
                                            <option value="1">Selecione</option> 
                                            <option value="2">Diretor(a)</option>
                                            <option value="3">Gerente</option>
                                            <option value="4">BackOffice</option>
                                            <option value="5">Vendedor(a)</option>
                                            <option value="6">Suporte Técnico</option>
                                        </select>
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-xs-auto col-sm-auto col-md-4">
                                    <br>
                                    <h3 class="panel-title">Dados de Acesso </h3>
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-auto col-sm-auto col-md-4">
                                    <label for="AlteraLogin" class="control-label">Login*</label>
                                    <input type="text" name="AlteraLogin" id="AlteraLogin" class="form-control input-sm" placeholder="Login">
                                </div>

                                <div class="col-xs-auto col-sm-auto col-md-4">
                                    <label for="AlteraSenha" class="control-label">Senha*</label>
                                    <input type="password" name="AlteraSenha" id="AlteraSenha" class="form-control input-sm" placeholder="Entre 8 e 25 dígitos">
                                </div>
                                <div class="col-xs-auto col-sm-auto col-md-4">
                                    <label for="AlteraConfirmar" class="control-label">Confirmar Senha*</label>
                                    <input type="password" name="AlteraConfirmar" id="AlteraConfirmar" class="form-control input-sm">
                                </div>
                            </div>

                            <div class="row">
                                <br>
                                <div class="col-xs-10 col-sm-10 col-md-10">
                                    <button type="button" class="btn btn-info" >Salvar</button>
                                </div>
                            </div>

                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>

            </div>
            </div></dialog><!--MODAL-EDITAR-->

        <div id="removerModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Confirmar exclusão</h4>
                    </div>
                    <div class="modal-body">
                        <p>Deseja realmente excluir o usuário e todas as suas informações?</p>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Excluir</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    </div>

                </div>

            </div>
        </div><!--CONFIRMAR-EXCLUSÃO-->

    </div> <!-- MAIN -->

    <!-- 
    <h1 style="text-align: center">Lista de Usuários</h1>
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

    -->

</table>
</body>

