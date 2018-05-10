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
                                                    <label class="control-label" for="min">Faixa de preço</label>
                                                </div>
												<input type="text" name="min" id="min" class="form-control input-sm" placeholder="menor valor">
											</div>
										</div>
										<div class="col-xs-auto col-sm-auto col-md-2">
											<div class="form-group">
												<div class="col-25">
												<label for="pesquisar">&nbsp;</label>
											</div>
												<input type="text" name="max" id="max" class="form-control input-sm" placeholder="maior valor">
                                            </div>
                                        </div>
										<div class="col-xs-auto col-sm-auto col-md-2">
											<div class="form-group">
												<div class="col-25">
													<label class="control-label" for="servico">Serviço</label>
													<select id="servico" name="servico" class="form-control">
														<option>Selecione</option>
														<option>Venda</option>
														<option>Locação</option>                                                    
													</select>
												</div>
											</div>
										</div>
										<div class="col-xs-auto col-sm-auto col-md-1">
											<div class="form-group">
												<div class="col-25">
													<label class="control-label" for="estado">UF</label>
													<select id="estado" name="estado" class="form-control" style="width: auto">
														<option>AC</option>
														<option>AL</option>
														<option>AP</option>
														<option>AM</option>
														<option>BA</option>
														<option>CE</option>
														<option>DF</option>
														<option>ES</option>
														<option>GO</option>
														<option>MA</option>
														<option>MT</option>
														<option>MS</option>
														<option>MG</option>
														<option>PA</option>
														<option>PB</option>
														<option>PR</option>
														<option>PE</option>
														<option>PI</option>
														<option>RJ</option>
														<option>RN</option>
														<option>RS</option>
														<option>RO</option>
														<option>RR</option>
														<option>SC</option>
														<option>SP</option>
														<option>SE</option>
														<option>TO</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-xs-auto col-sm-auto col-md-1">
											<div class="col-25">
												<label for="pesquisar">&nbsp;</label>
											</div>
											
											<button class="btn btn-info btn-sm" type="button" id="pesquisar">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										
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

        </div> <!-- MAIN -->
    </body>
</body>
</html>
