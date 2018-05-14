<%-- 
    Document   : EditarUsuario
    Created on : Apr 30, 2018, 11:05:29 AM
    Author     : I864970
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css">
        <script src="http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/lib/w3data.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuários</title>
    </head>
    <body>
        <div w3-include-html="menu.html"></div>
        <script>
            w3IncludeHTML();
        </script>
    </div class="main">
    <div class="container">
        <div class="row centered-form">
            <div >
                <br>
                <br>
                <br>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Edição de Usuário</h3>
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
                                    <input type="text" name="nome" id="nome" class="form-control input-sm" placeholder="Nome Completo" value=<%=request.getParameter("nome")%>>
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
                                            <option>Retaguarda</option>
                                            <option>Vendas</option>
                                            <option>TI</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-auto col-sm-auto col-md-2">
                                    <div class="form-group">
                                        <div class="col-25">
                                            <label class="control-label" for="Cargo">Cargo*</label>
                                        </div>	
                                        <select id="cargo" name="cargo" class="form-control">
                                            <option>Selecione</option> 
                                            <option value="Diretor(a)">Diretor(a)</option>
                                            <option value="Gerente">Gerente</option>
                                            <option value="Backoffice">BackOffice</option>
                                            <option value="Vendedor(a)">Vendedor(a)</option>
                                            <option value="Suporte Técnico">Suporte Técnico</option>
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
                                    <input type="text" name="login" id="login" class="form-control input-sm" placeholder="Login" value="<%=request.getParameter("login")%>">
                                </div>                                        
                                <div class="col-xs-auto col-sm-auto col-md-4">
                                    <label for="email" class="control-label">Email</label>
                                    <input type="text" name="email" id="email" class="form-control input-sm" placeholder="email" value="<%=request.getParameter("email")%>">
                                    <!-- input escondido que passa o comando para o servlet 
                                    (Deve ter um forma mais simples de fazer isso)-->
                                    <input type="hidden" name="comando" id="comando" value="editar">
                                    <input type="hidden" id="idUsuario" name="idUsuario" value="<%=request.getParameter("idUsuario")%>">

                                </div>
                            </div>

                            <div class="row">
                                <br>
                                <div class="col-xs-10 col-sm-10 col-md-10">

                                    <button type="button submit" class="btn btn-info btn-sm" >Salvar</button>
                                    <button type="button" class="btn btn-danger btn-sm" onclick="javascript:window.close()">Cancelar</button>
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
