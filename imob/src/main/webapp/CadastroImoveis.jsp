<%-- 
    Document   : CadastroImoveis
    Created on : May 4, 2018, 3:51:31 PM
    Author     : I864970
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro - Imóveis</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css">
        <script src="http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/lib/w3data.js"></script><!--includeHTML-->
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
                                <h3 class="panel-title">Cadastro de Imóveis</h3>
                            </div>
                            <div class="panel-body">
                                <form role="form">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-xs-auto col-sm-auto col-md-6">
                                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                                        <div class="form-group">
                                                            <div class="col-25">
                                                                <label for="data" class="control-label">Data</label>
                                                            </div>

                                                            <input type="text" name="data" id="data" class="form-control input-sm" placeholder="DD/MM/AA">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-xs-auto col-sm-auto col-md-6">

                                                    <label class="control-label" for="servico">Servico</label>
                                                    <select id="Servico" name="Servico" class="form-control">
                                                        <option>Selecione</option>
                                                        <option>Venda</option>
                                                        <option>Locação</option>                                                    
                                                    </select>

                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-xs-auto col-sm-auto col-md-6">
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="categoria">Categoria</label>
                                                        </div>	
                                                        <select id="categoria" name="categoria" class="form-control">
                                                            <option value="1">Residencial</option>
                                                            <option value="2">Comercial</option>
                                                            <option value="3">Rural</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-xs-auto col-sm-auto col-md-6">	
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="tipo_imovel">Tipo do Imóvel</label>
                                                        </div>	
                                                        <select id="tipo_imovel" name="tipo_imovel" class="form-control">
                                                            <option value="1">Apartamento</option>
                                                            <option value="2">Casa</option>
                                                            <option value="3">Terreno</option>
                                                        </select>
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="row">
                                                <div class="col-xs-auto col-sm-auto col-md-6">
                                                    <div class="col-25">
                                                        <label class="control-label" for="CPF">CPF</label>
                                                    </div>	
                                                    <input type="text" name="CPF" id="CPF" class="form-control" placeholder="CPF">
                                                    <br>
                                                    <a href="#" class="btn btn-info" onclick="this.href = 'cliente?comando=buscaCliente&cpfCliente=' + document.getElementById('CPF').value">Buscar</a>							
                                                </div>

                                                <div class="col-xs-auto col-sm-auto col-md-6">
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="proprietario">Proprietário</label>
                                                        </div>	
                                                        <input type="text" name="proprietário" id="proprietario" class="form-control input-sm" value="${clienteP.nome}">
                                                        <input type="hidden" id="idCliente" name="idCliente" value="${clienteP.idCliente}">

                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="categoria">Status do Imóvel</label>
                                                        </div>	
                                                        <select id="Status" name="Status" class="form-control">
                                                            <option value="1">Livre</option>
                                                            <option value="2">Ocupado</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-auto col-sm-auto col-md-6">
                                            <div>
                                                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                                    <!-- Indicators -->
                                                    <ol class="carousel-indicators">
                                                        <li data-target="#myCarousel" data-slide-to="0" class=""></li>
                                                        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                                                        <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
                                                    </ol>
                                                    <div class="carousel-inner" role="listbox">
                                                        <div class="item active">
                                                            <img class="first-slide"  src="img/1.jpeg" alt="Foto da casa">

                                                        </div>
                                                        <div class="item">
                                                            <img class="second-slide" src="img/2.jpeg" alt="Foto da casa">

                                                        </div>
                                                        <div class="item">
                                                            <img class="third-slide" src="img/3.jpeg" alt="Foto da casa">

                                                        </div>
                                                    </div>
                                                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>

                                                    </a>
                                                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>

                                                    </a>

                                                </div><!--carousel-->

                                                <label for="selecao-arquivo" id="anexo">Selecionar um arquivo &#187;</label>
                                                <input id="selecao-arquivo" type="file">

                                            </div><!--DIV DO CAROUSEL-->	
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="col-25">
                                                    <label class="control-label" for="info">Outras Informações</label>
                                                </div>	
                                            </div>
                                            <div class="form-group">
                                                <textarea class="form-control" rows="4" id="info"></textarea>
                                            </div>


                                        </div>
                                    </div>

                                    <div class="row"> 
                                        <hr>
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Dependencias</h3>

                                        </div>

                                        <div class="col-xs-auto col-sm-auto col-md-3">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="Banheiros">Banheiros</label>
                                                </div>	
                                                <input type="text" name="Banheiros" id="Banheiros" class="form-control input-sm" placeholder="Banheiros">
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-3">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="Suite">Suite</label>
                                                </div>	
                                                <input type="text" name="Suite" id="Suite" class="form-control input-sm" placeholder="Suite">
                                            </div>
                                        </div>

                                        <div class="col-xs-auto col-sm-auto col-md-3">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="Vagas">Vagas na Garagem</label>
                                                </div>	
                                                <input type="text" name="Vagas" id="Vagas" class="form-control input-sm" placeholder="Vagas">
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-3">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="Area_util">Área útil</label>
                                                </div>	
                                                <input type="text" name="Area_util" id="Area_util" class="form-control input-sm" placeholder="Área útil">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-6">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="Area_total">Área total</label>
                                                </div>	
                                                <input type="text" name="Area_total" id="Area_total" class="form-control input-sm" placeholder="Área total">
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-6">								
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Localização</h3>									
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-6">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="CEP">CEP</label>
                                                    </div>	
                                                    <input type="text" name="CEP" id="CEP" class="form-control input-sm" placeholder="CEP">
                                                    <br>
                                                    <button type="button" class="btn btn-info">Buscar</button>
                                                </div>
                                            </div>

                                            <div class="col-xs-auto col-sm-auto col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="Rua">Rua</label>
                                                    </div>	
                                                    <input type="text" name="Rua" id="Rua" class="form-control input-sm" placeholder="Rua">
                                                </div>
                                            </div>

                                            <div class="col-xs-auto col-sm-auto col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="Bairro">Bairro</label>
                                                    </div>	
                                                    <input type="text" name="Bairro" id="Bairro" class="form-control input-sm" placeholder="Bairro">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-6">

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="Número">Número</label>
                                                    </div>	
                                                    <input type="text" name="Numero" id="Numero" class="form-control input-sm" placeholder="Número">
                                                </div>
                                            </div>
                                            <div class="col-xs-auto col-sm-auto col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="Complemento">Complemento</label>
                                                    </div>	
                                                    <input type="text" name="Complemento" id="Complemento" class="form-control input-sm" placeholder="Complemento">
                                                </div>
                                            </div>

                                            <div class="col-xs-auto col-sm-auto col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="Cidade">Cidade</label>
                                                    </div>	
                                                    <input type="text" name="Cidade" id="Cidade" class="form-control input-sm" placeholder="Cidade">
                                                </div>
                                            </div>
                                            <div class="col-xs-auto col-sm-auto col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="UF">UF</label>
                                                    </div>	
                                                    <input type="text" name="UF" id="UF" class="form-control input-sm" placeholder="UF">
                                                </div>
                                            </div>



                                        </div>		
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-6">								
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Valores</h3>									
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">

                                        <div class="col-xs-auto col-sm-auto col-md6">
                                            <div class="col-xs-4 col-sm-4 col-md-4">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="Valor">Valor*</label>
                                                    </div>	
                                                    <input type="text" name="Valor" id="Valor" class="form-control input-sm" placeholder="Valor">
                                                </div>
                                            </div>
                                            <div class="col-xs-4 col-sm-4 col-md-4">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="Condomínio">Condomínio</label>
                                                    </div>	
                                                    <input type="text" name="Condominio" id="Condominio" class="form-control input-sm" placeholder="Condomínio">
                                                </div>
                                            </div>
                                            <div class="col-xs-4 col-sm-4 col-md-4">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="IPTU">IPTU</label>
                                                    </div>	
                                                    <input type="text" name="IPTU" id="IPTU" class="form-control input-sm" placeholder="IPTU">
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <br>
                                        <div class="col-xs-auto col-sm-auto col-md-6">
                                            <button type="button" class="btn btn-info" >Salvar</button>
                                            <button type="button" class="btn btn-danger" >Cancelar</button>
                                        </div>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
