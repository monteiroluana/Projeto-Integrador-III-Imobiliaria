<%-- 
    Document   : venda
    Created on : May 4, 2018, 3:21:24 PM
    Author     : I864970
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Venda</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css">
        <script src="http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/lib/w3data.js"></script><!--includeHTML-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"/>
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
    </head>
    <style>
        body{
            background-image: url(https://i.imgur.com/KSBmJOW.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
        }
    </style>
    <body>
        <div w3-include-html="menu.html"></div>
        <script>
            w3IncludeHTML();
            function mudaImagem() {

                document.getElementById("imagem_do_menu").style.cssText = "width: 200px; height: 136px; margin-left:0; margin-top: 0";
            }
            function resetaImagem() {
                document.getElementById("imagem_do_menu").style.cssText = "width: 60px; height: 50px; margin-left: 128px; margin-top: 100px;";
            }
        </script>

        <div class="container">
            <div class="row centered-form">
                <div>
                    <br>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Abertura de Contrato Venda/Aluguel</h3>
                        </div>
                        <div class="panel-body">
                            <form role="form" action="contrato" method="POST">
                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <h3 class="panel-title">Venda/Aluguel</h3>
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label for="codigoContrato" class="control-label">Código do contrato</label>
                                            <div class="input-group">
                                                <input type="text" name="codigoContrato" id="codigoContrato" class="form-control input-sm" value="${codContrato}" disabled>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="datetimepicker" class="control-label">Data</label>
                                            <div class="input-group date">
                                                <input type="text" id="datetimepicker" name="datetimepicker" class="form-control"/>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label for="corretor" class="control-label">Corretor*</label>
                                            <input type="text" name="corretor" id="corretor" class="form-control input-sm" placeholder="corretor" value="">
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label" for="filtro"> Tipo de contrato </label>
                                        <div>
                                            <select id="filtro" name="filtro" class="form-control">
                                                <option>Selecione</option>
                                                <option<c:if test="${imovel.servico=='Venda'}">selected</c:if>>Venda</option>
                                                <option<c:if test="${imovel.servico=='Aluguel'}">selected</c:if>>Aluguel</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label for="locatario" class="control-label">Locatário*</label>
                                            <input type="text" name="locatario" id="locatario" class="form-control input-sm" placeholder="locatario" value="${cliente.nome}">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <label for="cpf" class="control-label">CPF*</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="00000000000" name="cpf" id="cpf" value="${cliente.cpf}">
                                            <span class="input-group-btn">
                                                <!-- <a href="#" class="btn btn-info" onclick="this.href = 'cliente?comando=buscaLocatario&i=${imovel.idImovel}&cpfLocatario=' + document.getElementById('cpf').value">Buscar</a> -->
                                                <button class="btn btn-info" type="submit">
                                                    <span class="glyphicon glyphicon-search"></span>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <br>
                                        <h3 class="panel-title">Dados do Imóvel</h3>
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <label for="codRef" class="control-label">Cód. Referência*</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="00000" name="codRef" id="codRef" value="${imovel.codImovel}" disabled>
                                            <span class="input-group-btn">
                                                <!-- <button class="btn btn-info" type="button" id="cod-pesquisa"><span class="glyphicon glyphicon-search"></span>
                                                </button> -->
                                            </span>

                                        </div>
                                    </div>


                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label for="imovel" class="control-label">Tipo Imóvel</label>
                                            <input type="text" name="tipo" id="tipo" class="form-control input-sm" placeholder="tipo imovel" value="${imovel.tipo}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <div class="col-25">
                                                <label class="control-label" for="categoria">Categoria</label>
                                            </div>	
                                            <!--<select id="categoria" name="categoria" class="form-control">
                                                <option value="0">Selecione</option>
                                                <option value="1">Residencial</option>
                                                <option value="2">Comercial</option>
                                                <option value="3">Rural</option>-->
                                            <input type="text" name="categoria" id="categoria" class="form-control input-sm" placeholder="Categoria" value="${imovel.complemento}" disabled>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="proprietario" class="control-label">Proprietário*</label>
                                            <input type="text" name="proprietario" id="proprietario" class="form-control input-sm" placeholder="proprietario" value="${imovel.idCliente}" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label for="endereco" class="control-label">Endereço*</label>
                                            <input type="text" name="endereco" id="endereco" class="form-control input-sm" placeholder="endereco" value="${imovel.rua}"  disabled>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label for="numero" class="control-label">Número*</label>
                                            <input type="text" name="numero" id="numero" class="form-control input-sm" placeholder="numero" value="${imovel.num}"  disabled>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label for="complemento" class="control-label">Complemento</label>
                                            <input type="text" name="complemento" id="complemento" class="form-control input-sm" placeholder="complemento" value="${imovel.complemento}"  disabled>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label for="bairro" class="control-label">Bairro</label>
                                            <input type="text" name="bairro" id="bairro" class="form-control input-sm" placeholder="bairro" value="${imovel.bairro}"  disabled>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="cidade" class="control-label">Cidade</label>
                                            <input type="text" name="cidade" id="cidade" class="form-control input-sm" placeholder="cidade" value="${imovel.cidade}"  disabled>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="form-group">
                                            <div class="col-25">
                                                <label class="control-label" for="uf">UF*</label>
                                            </div>	
                                            <input type="text" name="uf" id="uf" class="form-control input-sm" placeholder="uf" value="${imovel.uf}" disabled>
                                        </div>
                                    </div>	
                                </div>
                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-6">
                                        <br>
                                        <h3 class="panel-title">Período de aluguel</h3>
                                        <hr>
                                    </div>
                                    <div class="col-xs-auto col-sm-auto col-md-6">
                                        <br>
                                        <h3 class="panel-title">Valores</h3>
                                        <hr>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label for="datetimepicker_de" class="control-label">De</label>
                                            <div class="input-group date" >
                                                <input id="datetimepicker_de" name="datetimepicker_de" type="text" class="form-control"/>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label for="datetimepicker_ate" class="control-label">Até</label>
                                            <div class="input-group date" >
                                                <input id="datetimepicker_ate" name="datetimepicker_ate" type="text" class="form-control"/>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label for="valorVenda" class="control-label">Valor Venda</label>
                                            <input type="text" name="valorVenda" id="valorVenda" class="form-control input-sm" placeholder="Valor de venda" value="${imovel.valorVenda}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label for="valorAluguel" class="control-label">Valor Aluguel</label>
                                            <input type="text" name="valorAluguel" id="valorAluguel" class="form-control input-sm" placeholder="Valor de aluguel" value="${imovel.valorAluguel}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label for="condominio" class="control-label">Condomínio</label>
                                            <input type="text" name="condominio" id="condominio" class="form-control input-sm" placeholder="condominio" value="${imovel.condominio}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label for="iptu" class="control-label">IPTU</label>
                                            <input type="text" name="cidade" id="iptu" class="form-control input-sm" placeholder="iptu" value="${imovel.iptu}" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-9">

                                    </div>
                                    <div class="col-sm-3">
                                        <input type="hidden" name="idImovel" id="idImovel" value="${imovel.idImovel}">
                                        <input type="hidden" name="idCliente" id="idCliente" value="${cliente.idCliente}">  
                                        <input type="hidden" name="codContrato" id="codContrato" value="${codContrato}">  
                                        <button type="button submit" class="btn btn-info">Gerar contrato</button>                                        
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            $(function () {
                $("#datetimepicker_de").datetimepicker({
                    defaultDate: "01/01/2018",
                    locale: "pt-br",
                });
                $("#datetimepicker_ate").datetimepicker({
                    defaultDate: "12/12/2018",
                    locale: "pt-br",
                });
                $("#datetimepicker").datetimepicker({
                    defaultDate: "01/01/2018",
                    locale: "pt-br",
                });

            });
        </script> <!--Calendario-->
    </body>
</html>
