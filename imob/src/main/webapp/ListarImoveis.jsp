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
                                <!--<form role="form" action="imovel" method="POST">-->
                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <h3 class="panel-title">Filtrar busca</h3>
                                    </div>
                                    <hr>
                                </div>

                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-4">
                                        <div class="col-25">
                                            <label class="control-label" for="codImovel">Código do Imóvel</label>
                                        </div>
                                        <div id="custom-search-input">                                            
                                            <div class="input-group col-md-12">                                                
                                                <input type="text" class="form-control input-sm" placeholder="digite o cód. do imóvel" id="codImovel" name="codImovel" />
                                                <span class="input-group-btn">
                                                    <!--<button class="btn btn-info btn-sm" type="button" id="PesquisaNome">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                    <a href="#" class="btn btn-info" onclick="this.href = 'imovel?comando=lista&codImov=' + document.getElementById('codImovel').value">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </a>-->
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-auto col-sm-auto col-md-2">
                                        <div class="form-group">
                                            <div class="col-25">
                                                <label class="control-label" for="tipo">Tipo do imóvel</label>
                                            </div>	
                                            <select id="tipo" name="tipo" class="form-control">
                                                <option value="">Selecione</option>
                                                <option value="casa">Casa</option>
                                                <option value="apartamento">Apartamento</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-xs-auto col-sm-auto col-md-2">
                                        <div class="form-group">
                                            <div class="col-25">
                                                <label class="control-label" for="servico">Serviço</label>
                                                <select id="servico" name="servico" class="form-control">
                                                    <option value="">Selecione</option>
                                                    <option value="venda">Venda</option>
                                                    <option value="aluguel">Aluguel</option>                                                    
                                                </select>
                                            </div>
                                        </div>
                                    </div>                                    

                                    <div class="col-xs-auto col-sm-auto col-md-1">
                                        <div class="col-25">
                                            <label for="pesquisar">&nbsp;</label>
                                        </div>

                                        <span class="input-group-btn">
                                            <a href="#" class="btn btn-info" onclick="this.href = 'imovel?comando=lista&codImovel=' + document.getElementById('codImovel').value +
                                                            '&tipo=' + document.getElementById('tipo').value +
                                                            '&servico=' + document.getElementById('servico').value">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </a>                                            
                                        </span>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-auto col-sm-auto col-md-auto">
                                        <table class="table table-striped custab">
                                            <thead>
                                                <tr>
                                                    <th>Cód.</th>
                                                    <th>Tipo</th>
                                                    <th>Bairro</th>
                                                    <th>Cidade</th>
                                                    <th>Estado</th>
                                                    <th>Venda(R$)</th>
                                                    <th>Aluguel(R$)</th>
                                                    <th>Serviço</th>
                                                    <th class="text-center">Opções</th>
                                                </tr>
                                            </thead>

                                            <c:forEach items="${lista}" var="i">                                                    
                                                <form action="imovel" method="POST">
                                                    <tr>
                                                    <input type="hidden" name="idImovel" id="idImovel" value="${i.idImovel}"/>
                                                    <td><c:out value="${i.codImovel}"/></td>
                                                    <td><c:out value="${i.tipo}" /></td>
                                                    <td><c:out value="${i.bairro}" /></td>
                                                    <td><c:out value="${i.cidade}" /></td>
                                                    <td><c:out value="${i.uf}" /></td>
                                                    <td><c:out value="${i.valorVenda}" /></td>
                                                    <td><c:out value="${i.valorAluguel}" /></td>
                                                    <td><c:out value="${i.servico}" /></td>                                                                               
                                                    <input type="hidden" name="comando" id="comando" value="listaEditar"/>

                                                    <td class="text-center">
                                                        <button type="submit" class="btn btn-info btn-sm glyphicon glyphicon-pencil" target="_blank"></button>
                                                        <a href="imovel?idImovel=${i.idImovel}&comando=excluir"class="btn btn-danger btn-sm glyphicon glyphicon-remove"></a>
                                                        <a href="imovel?comando=buscarImovel&idImovel=${i.idImovel}" class="btn btn-warning btn-sm glyphicon glyphicon-file"></a>

                                                    </td>
                                                    </tr>
                                                </form>
                                            </c:forEach>
                                        </table>

                                    </div>
                                </div>
                                <!--</form>-->
                            </div>
                        </div>
                    </div>

                </div>	
            </div>

        </div> <!-- MAIN -->
        ${msg}
    </body>
</body>
</html>