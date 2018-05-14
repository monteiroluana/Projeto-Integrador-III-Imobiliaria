<%@page import="java.util.List"%>
<%@page import="br.com.evolution.model.Cliente"%>
<%@page import="br.com.evolution.dao.DaoCliente"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar clientes</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/lib/w3data.js"></script><!--includeHTML-->
        <link rel="stylesheet" href="css/styles.css">
        <!--
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
        -->
    </head>
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
                                <h3 class="panel-title">Consultar Clientes</h3>
                            </div>
                            <div class="panel-body">
                                <!-- <form role="form"> -->
                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <h3 class="panel-title">Filtrar busca</h3>

                                    </div>
                                    <hr>
                                </div>
                                <div class="row">


                                    <div class="col-xs-auto col-sm-auto col-md-4">

                                        <div id="custom-search-input">
                                            <div class="input-group col-md-12">
                                                <input type="text" class="form-control input-sm" placeholder="insira nome ou CPF" id="pesquisa" name="pesquisa"/>
                                                <span class="input-group-btn">

                                                    <!--<button class="btn btn-info btn-sm" type="button" id="PesquisaNome">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                        
                                                    </button>-->

                                                    <a href="#" class="btn btn-info" onclick="this.href = 'cliente?comando=lista&pesquisa=' + document.getElementById('pesquisa').value">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </a>

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
                                                    <th>CPF</th>
                                                    <th>Endereço</th>
                                                    <th>Cidade</th>
                                                    <th>UF</th>
                                                    <th>Email</th>
                                                    <th>Telefone</th>
                                                    <th class="text-center">Opções</th>
                                                </tr>

                                            </thead>
                                        
                                        <c:forEach items="${lista}" var="c">
                                            <form action="cliente" method="POST">

                                                <tr>
                                                <input type="hidden" name="idCliente" id="idCliente" value="${c.idCliente}"/>
                                                <td id="nome"><c:out value="${c.nome}" /></td>
                                                <td id="cpf"><c:out value="${c.cpf}" /></td>
                                                <td id="rua"><c:out value="${c.rua}" /></td>
                                                <td id="cidade"><c:out value="${c.cidade}" /></td>
                                                <td id="uf"><c:out value="${c.uf}" /></td>
                                                <td id="email"><c:out value="${c.email}" /></td>
                                                <td id="telefone"><c:out value="${c.telefone}" /></td>
                                                <input type="hidden" name="comando" id="comando" value="listaEditar"/>

                                                <td class="text-center">                                                            
                                                    <!-- <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">Editar</button> -->
                                                    <!-- <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerModal">Excluir</button> -->
                                                    <button type="submit" class="btn btn-info btn-sm" target="_blank">Editar</button>                                                        
                                                    <a href="cliente?idCliente=${c.idCliente}&comando=excluir"class="btn btn-danger btn-sm">Excluir</a>

                                                </td>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                        </table>


                                    </div>
                                </div>
                                <!-- </form> -->
                            </div>
                        </div>
                    </div>

                </div>	
            </div>

            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Dados do Cliente</h4>
                        </div>
                        <div class="modal-body">

                            <form role="form">
                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <h3 class="panel-title">Dados Pessoais</h3>
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <label for="Nome" class="control-label">Nome*</label>
                                        <input type="text" name="Nome" id="Nome" class="form-control input-sm" placeholder="Nome Completo">
                                    </div>
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <label for="Data" class="control-label">Data de nascimento*</label>
                                        <input type="text" name="Data" id="Data" class="form-control input-sm" placeholder="DD/MM/AA">
                                    </div>
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <label for="CPF" class="control-label">CPF*</label>
                                        <input type="text" name="CPF" id="CPF" class="form-control input-sm" placeholder="000.000.000-00">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <br>
                                        <h3 class="panel-title">Endereço</h3>
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <label for="CEP" class="control-label">CEP*</label>
                                        <input type="text" name="CEP" id="CEP" class="form-control input-sm" placeholder="CEP">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <label for="Rua" class="control-label">Rua</label>
                                        <input type="text" name="Rua" id="Rua" class="form-control input-sm">
                                    </div>
                                    <div class="col-xs-auto col-sm-auto col-md-2">
                                        <label for="Número" class="control-label">Número</label>
                                        <input type="text" name="Número" id="Número" class="form-control input-sm">
                                    </div>
                                    <div class="col-xs-auto col-sm-auto col-md-3">
                                        <label for="Complemento" class="control-label">Complemento</label>
                                        <input type="text" name="Complemento" id="Complemento" class="form-control input-sm">
                                    </div>
                                    <div class="col-xs-auto col-sm-auto col-md-3">
                                        <label for="Bairro" class="control-label">Bairro*</label>
                                        <input type="text" name="Bairro" id="Bairro" class="form-control input-sm">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <label for="Cidade" class="control-label">Cidade</label>
                                        <input type="text" name="Cidade" id="Cidade" class="form-control input-sm">
                                    </div>
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <label for="Estado" class="control-label">Estado</label>
                                        <input type="text" name="Estado" id="Estado" class="form-control input-sm">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <br>
                                        <h3 class="panel-title">Contato</h3>
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <label for="Telefone" class="control-label">Telefone</label>
                                        <input type="text" name="Telefone" id="Telefone" class="form-control input-sm">
                                    </div>
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <label for="Celular" class="control-label">Celular</label>
                                        <input type="text" name="Celular" id="Celular" class="form-control input-sm">
                                    </div>
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <label for="Email" class="control-label">Email</label>
                                        <input type="text" name="Email" id="Email" class="form-control input-sm">
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
            </div><!--MODAL-EDITAR-->


            <div id="removerModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Confirmar exclusão</h4>
                        </div>

                        <div class="modal-body">
                            <p>Deseja realmente excluir o cliente e todas as suas informações?</p>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Excluir</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

                        </div>

                    </div>

                </div>

            </div><!--CONFIRMAR-EXCLUSÃO-->

        </div> <!-- MAIN -->
${msg}


        <!--
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
        -->
    </body>
</html>
