<%-- 
    Document   : EditarCliente
    Created on : 08/05/2018, 21:38:21
    Author     : bruna.ssjodai
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
        <title>Editar Cliente</title>
        <script type="text/javascript" >
        
            function limpa_formulário_cep() {
            //Limpa valores do formulário de cep.
            document.getElementById('rua').value = ("");
            document.getElementById('bairro').value = ("");
            document.getElementById('cidade').value = ("");
            document.getElementById('uf').value = ("");
            }

            function meu_callback(conteudo) {
            if (!("erro" in conteudo)) {
            //Atualiza os campos com os valores.
            document.getElementById('rua').value = (conteudo.logradouro);
            document.getElementById('bairro').value = (conteudo.bairro);
            document.getElementById('cidade').value = (conteudo.localidade);
            document.getElementById('uf').value = (conteudo.uf);
            } //end if.
            else {
            //CEP não Encontrado.
            limpa_formulário_cep();
            alert("CEP não encontrado.");
            }
            }

            function pesquisacep(valor) {

            //Nova variável "cep" somente com dígitos.
            var cep = valor.replace(/\D/g, '');
            //Verifica se campo cep possui valor informado.
            if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;
            //Valida o formato do CEP.
            if (validacep.test(cep)) {

            //Preenche os campos com "..." enquanto consulta webservice.
            document.getElementById('rua').value = "...";
            document.getElementById('bairro').value = "...";
            document.getElementById('cidade').value = "...";
            document.getElementById('uf').value = "...";
            //Cria um elemento javascript.
            var script = document.createElement('script');
            //Sincroniza com o callback.
            script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';
            //Insere script no documento e carrega o conteúdo.
            document.body.appendChild(script);
            } //end if.
            else {
            //cep é inválido.
            limpa_formulário_cep();
            alert("Formato de CEP inválido.");
            }
            } //end if.
            else {
            //cep sem valor, limpa formulário.
            limpa_formulário_cep();
            }
            }
            ;
         
        </script>

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
                                <h3 class="panel-title">Editar Cliente</h3>
                            </div>
                            <div class="panel-body">
                                <form role="form" action="cliente" method="POST">
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-4">                                            
                                            <h3 class="panel-title">Dados Pessoais</h3>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <label for="nome" class="control-label">Nome*</label>
                                            <input type="text" name="nome" id="nome" class="form-control input-sm" placeholder="Nome Completo" value="${cliente.nome}">
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-4">

                                            <label for="data" class="control-label">Data de nascimento*</label>
                                            <input type="text" name="data" id="data" class="form-control input-sm" placeholder="DD/MM/AAAA" value="${dataNasc}">
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <label for="cpf" class="control-label">CPF*</label>
                                            <input type="text" name="cpf" id="cpf" class="form-control input-sm" placeholder="000.000.000-00" value="${cliente.cpf}">
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
                                            <label for="cep" class="control-label">CEP*</label>
                                            <input type="text" name="cep" id="cep" class="form-control input-sm" placeholder="CEP" value="${cliente.cep}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <label for="rua" class="control-label">Rua</label>
                                            <input type="text" name="rua" id="rua" class="form-control input-sm" value="${cliente.rua}">
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <label for="número" class="control-label">Número</label>
                                            <input type="text" name="num" id="num" class="form-control input-sm" value="${cliente.num}">
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-3">
                                            <label for="complemento" class="control-label">Complemento</label>
                                            <input type="text" name="complemento" id="complemento" class="form-control input-sm" value="${cliente.complemento}">
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-3">
                                            <label for="bairro" class="control-label">Bairro*</label>
                                            <input type="text" name="bairro" id="bairro" class="form-control input-sm" value="${cliente.bairro}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <label for="cidade" class="control-label">Cidade</label>
                                            <input type="text" name="cidade" id="cidade" class="form-control input-sm" value="${cliente.cidade}">
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <label for="estado" class="control-label">Estado</label>
                                            <input type="text" name="uf" id="uf" class="form-control input-sm" value="${cliente.uf}">
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
                                            <label for="telefone" class="control-label">Telefone</label>
                                            <input type="text" name="telefone" id="telefone" class="form-control input-sm" value="${cliente.telefone}">
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <label for="celular" class="control-label">Celular</label>
                                            <input type="text" name="celular" id="celular" class="form-control input-sm" value="${cliente.celular}">
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <label for="email" class="control-label">Email</label>
                                            <input type="text" name="email" id="email" class="form-control input-sm" value="${cliente.email}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <input type="hidden" name="comando" id="comando" value="editar">
                                        <input type="hidden" name="idCliente" id="idCliente" value="${cliente.idCliente}">
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
        </div>	

    </body>
</html>
