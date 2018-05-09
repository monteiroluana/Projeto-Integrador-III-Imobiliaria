<%-- 
    Document   : listarImoveis
    Created on : May 4, 2018, 3:58:12 PM
    Author     : I864970
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Imóveis</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css">
        <script src="http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/lib/w3data.js"></script>


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
                                <h3 class="panel-title">Consultar Imóveis</h3>
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

                                        <div class="col-xs-auto col-sm-auto col-md-4">

                                            <div id="custom-search-input">
                                                <div class="input-group col-md-12">
                                                    <input type="text" class="form-control input-sm" placeholder="digite o cód. de referência" />
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
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="TipoImovel">Tipo do imóvel</label>
                                                </div>	
                                                <select id="TipoImovel" name="TipoImovel" class="form-control">
                                                    <option value="1">Selecione</option>
                                                    <option value="2">Casa</option>
                                                    <option value="3">Apartamento</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="Status">Status do imóvel</label>
                                                </div>	
                                                <select id="Status" name="Status" class="form-control">
                                                    <option value="1">Selecione</option>
                                                    <option value="2">Livre</option>
                                                    <option value="3">Ocupado</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="Status">Faixa de preço</label>
                                                </div>




                                                <!--
                                                         <select id="Status" name="Status" class="form-control">
                                                                <option value="1">Selecione</option>
                                                                <option value="2">Livre</option>
                                                                <option value="3">Ocupado</option>
                                                        </select> -->
                                            </div>
                                        </div>
                                    </div>	

                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-auto">
                                            <table class="table table-striped custab">
                                                <thead>
                                                    <tr>
                                                        <th>Cód. Ref</th>
                                                        <th>Tipo do imóvel</th>
                                                        <th>Bairro</th>
                                                        <th>Cidade</th>
                                                        <th>Estado</th>
                                                        <th>Valor</th>
                                                        <th>Situação</th>
                                                        <th class="text-center">Opções</th>
                                                    </tr>
                                                </thead>

                                                <c:forEach items="${lista}" var="i">
                                                    <tr>
                                                        <td><c:out value="${i.codImovel}"/></td>
                                                        <td><c:out value="${i.tipo}" /></td>
                                                        <td><c:out value="${i.bairro}" /></td>
                                                        <td><c:out value="${i.cidade}" /></td>
                                                        <td><c:out value="${i.uf}" /></td>
                                                        <td><c:out value="${i.valorVenda}" /></td>
                                                        <td><c:out value="${i.situacao}" /></td>
                                                    <input style="display: none" value="${i.idImovel}"/>                                                     

                                                    <td class="text-center">
                                                        <a href="imovel?idImovel=${i.idImovel}&comando=listaEditar"class="btn btn-info btn-sm" target="_blank">Editar</a>
                                                        <!-- <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerModal">Deletar</button> -->
                                                        <a href="imovel?idImovel=${i.idImovel}&comando=excluir"class="btn btn-danger btn-sm">Excluir</a>
                                                    </td>
                                                    </tr>

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
                            <p>Deseja realmente excluir o imóvel e todas as suas informações?</p>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Excluir</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        </div>

                    </div>

                </div>
            </div><!--CONFIRMAR-EXCLUSÃO-->
        </div> <!-- MAIN -->
    </body>
</body>
</html>
