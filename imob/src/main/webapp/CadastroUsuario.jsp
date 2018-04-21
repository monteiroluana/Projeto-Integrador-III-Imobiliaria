<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro - Usuários</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css">
        <script>
            function check(){
                var x = ${msg};
                if(x.localeCompare("deu certo")){
                    
                }else{
                    
                }
            }
        </script>
    </head>

    <body>
        <nav class="navbar navbar-inverse sidebar" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">LOGO</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Clientes <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a>
                            <ul class="dropdown-menu forAnimate" role="menu">
                                <li><a href="CadastroCliente.jsp">Cadastrar</a></li>
                                <li><a href="cliente?action=lista">Consultar</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Imóveis <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a>
                            <ul class="dropdown-menu forAnimate">
                                <li><a href="cadastro-imoveis.html">Cadastrar</a></li>
                                <li><a href="consultar-imoveis.html">Consultar</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Usuários <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a>
                            <ul class="dropdown-menu forAnimate">
                                <li><a href="#">Cadastrar</a></li>
                                <li><a href="usuario?action=lista">Consultar</a></li>
                            </ul>
                        </li>
                        <li><a href="venda.html">Venda<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-usd"></span></a></li>

                        <li><a href="locacao.html">Locação<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-piggy-bank"></span></a></li>
                        <li><a href="relatorios.html">Relatórios<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-comment"></span></a></li>
                        <li><a href="logout.html">Log out<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-lock"></span></a></li>

                    </ul>	
                </div>
            </div>
        </nav> <!--MENU-->

        <div class="main">
            <div class="container">
                <div class="row centered-form">
                    <div >
                        <br>
                        <br>
                        <br>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Cadastro de Usuários</h3>
                            </div>
                            <div class="panel-body">
                                <form role="form" action="usuario" method="POST">
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <h3 class="panel-title">Dados do Usuário</h3>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <label for="nome" class="control-label">Nome*</label>
                                            <input type="text" name="nome" id="nome" class="form-control input-sm" placeholder="Nome Completo">
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="grupoFilial">Grupo/Filial*</label>
                                                </div>	
                                                <select id="grupoFilial" name="grupoFilial" class="form-control">
                                                    <option>Selecione</option>
                                                    <option>São Paulo</option>
                                                    <option>Porto Alegre</option>
                                                    <option>Recife</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="departamento">Departamento*</label>
                                                </div>	
                                                <select id="departamento" name="departamento" class="form-control">
                                                    <option>Selecione</option>
                                                    <option>Diretoria</option>
                                                    <option>Administrativo</option>
                                                    <option>Vendas</option>
                                                    <option>TI</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" forcCargo">Cargo*</label>
                                                </div>	
                                                <select id="cargo" name="cargo" class="form-control">
                                                    <option>Selecione</option> 
                                                    <option>Diretor(a)</option>
                                                    <option>Gerente</option>
                                                    <option>BackOffice</option>
                                                    <option>Vendedor(a)</option>
                                                    <option>Suporte Técnico</option>
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
                                            <label for="login" class="control-label">Login*</label>
                                            <input type="text" name="login" id="login" class="form-control input-sm" placeholder="Login">
                                        </div>

                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <label for="senha" class="control-label">Senha*</label>
                                            <input type="password" name="senha" id="senha" class="form-control input-sm" placeholder="Entre 8 e 25 dígitos">
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <label for="confirmar" class="control-label">Confirmar Senha*</label>
                                            <input type="password" name="confirmar" id="confirmar" class="form-control input-sm">
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <label for="email" class="control-label">Email</label>
                                            <input type="text" name="email" id="email" class="form-control input-sm" placeholder="email">
                                            <!-- input escondido que passa o comando para o servlet 
                                            (Deve ter um forma mais simples de fazer isso)-->
                                            <input type="hidden" name="comando" id="comando" value="cadastrar">

                                        </div>
                                    </div>

                                    <div class="row">
                                        <br>
                                        <div class="col-xs-10 col-sm-10 col-md-10">
                                            <button type="button submit" class="btn btn-info" >Salvar</button>
                                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">Deu certo?</button>
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
                            <p><c:out value="${msg}"/></p>
                        </div>
                        <div class="modal-body">

                            

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>

                </div>
            </div>
            
        </div><!--Conteúdo primcipal-->

    </body>
</html>
