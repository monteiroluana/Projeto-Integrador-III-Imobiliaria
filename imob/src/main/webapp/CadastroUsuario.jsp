<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro - Usu�rios</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/lib/w3data.js"></script>
        <link rel="stylesheet" href="css/styles.css">

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

            function checkNome() {
                var nome = document.querySelector("#nome");
                if (nome.value === "") {
                    nome.setCustomValidity("Insira um nome");
                }
            }
            function checkLogin() {
                var login = document.querySelector("#login");
                if (login.value === "") {
                    login.setCustomValidity("Insira um login");
                }
            }
            function checkSenha() {
                var senha = document.querySelector("#senha");
                if (senha.value === "") {
                    senha.setCustomValidity("Insira uma senha");
                }
            }
            function checkConfirmar() {
                var confirmar = document.querySelector("#confirmar");
                if (confirmar.value === "") {
                    confirmar.setCustomValidity("Insira uma senha de confirma��o");
                }

            }
            function checkEmail() {
                var email = document.querySelector("#email");
                if (email === "") {
                    email.setCustomValidity("Insira um email v�lido");
                }
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
                                <h3 class="panel-title">Cadastro de Usu�rios</h3>
                            </div>
                            <div class="panel-body">
                                <form role="form" action="usuario" method="POST">
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <h3 class="panel-title">Dados do Usu�rio</h3>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <label for="nome" class="control-label">Nome*</label>
                                            <input type="text" name="nome" id="nome" class="form-control input-sm" placeholder="Nome Completo" oninput="this.setCustomValidity('')" oninvalid="checkNome();" required>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="grupoFilial">Grupo/Filial*</label>
                                                </div>	
                                                <select id="grupoFilial" name="grupoFilial" class="form-control" required>
                                                    <option>Selecione</option>
                                                    <option>Sao Paulo</option>
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
                                                    <option>BackOffice</option>
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
                                                    <option>Gerente</option>
                                                    <option>BackOffice</option>
                                                    <option>Vendedor(a)</option>
                                                    <option>Suporte T�cnico</option>
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
                                            <input type="text" name="login" id="login" class="form-control input-sm" placeholder="Login"  oninput="this.setCustomValidity('')" oninvalid="checkLogin();" required>
                                        </div>

                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <label for="senha" class="control-label">Senha*</label>
                                            <input type="password" name="senha" id="senha" class="form-control input-sm" placeholder="Entre 8 e 25 d�gitos"  oninput="this.setCustomValidity('')" oninvalid="checkSenha();" required>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <label for="confirmar" class="control-label">Confirmar Senha*</label>
                                            <input type="password" name="confirmar" id="confirmar" class="form-control input-sm" oninput="this.setCustomValidity('')" oninvalid="checkConfirmar();" required>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <label for="email" class="control-label">Email</label>
                                            <input type="text" name="email" id="email" class="form-control input-sm" placeholder="email"  oninput="this.setCustomValidity('')" oninvalid="checkEmail();" required>
                                            <!-- input escondido que passa o comando para o servlet 
                                            (Deve ter um forma mais simples de fazer isso)-->
                                            <input type="hidden" name="comando" id="comando" value="cadastrar">

                                        </div>
                                    </div>

                                    <div class="row">
                                        <br>
                                        <div class="col-xs-10 col-sm-10 col-md-10">
                                            <button type="button submit" class="btn btn-info" >Salvar</button>

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

        </div><!--Conte�do primcipal-->

    </body>
</html>
