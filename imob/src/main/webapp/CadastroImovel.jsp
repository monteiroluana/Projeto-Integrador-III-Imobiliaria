<%-- 
    Document   : CadastroImovel
    Created on : May 4, 2018, 3:51:31 PM
    Author     : I864970
--%>

<%@page import="br.com.devolution.model.Cliente"%>
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
    <script>

        $(document).ready(function () {
            document.getElementById('pro-image').addEventListener('change', readImage, false);
            $(".preview-images-zone").sortable();
            $(document).on('click', '.image-cancel', function () {
                let no = $(this).data('no');
                $(".preview-image.preview-show-" + no).remove();
                $().remove();
            });
        });
        var num = 4;
        function readImage() {
            if (window.File && window.FileList && window.FileReader) {
                var files = event.target.files; //FileList object
                var output = $(".preview-images-zone");
                for (let i = 0; i < files.length; i++) {
                    var file = files[i];
                    if (!file.type.match('image'))
                        continue;
                    var picReader = new FileReader();
                    picReader.addEventListener('load', function (event) {
                        var picFile = event.target;
                        var html = '<div class="preview-image preview-show-' + num + '">' +
                                '<div class="image-cancel" data-no="' + num + '">x</div>' +
                                '<div class="image-zone"><img id="pro-img-' + num + '" src="' + picFile.result + '"></div>' +
                                '</div>';

                        output.append(html);//coloca as imagens na parte de baixo da div
                        $('<li data-target="#myCarousel" data-slide-to="' + num + '" class=""></li>').appendTo('#indicator');

                        $('<div class="item"> <img class="slide preview-image preview-show-"' + num + '" src="' + picFile.result + '""></div>').appendTo("#car");
                        num = num + 1;
                    });

                    picReader.readAsDataURL(file);
                }
                $("#pro-image").val('');
            } else {
                console.log('Browser not support');
            }
        }



    </script>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
        .preview-images-zone {
            width: 400px;
            min-height: 180px;
            /* display: flex; */
            padding: 5px 5px 0px 5px;
            position: relative;
            overflow:auto;
        }
        .preview-images-zone > .preview-image {
            height: 90px;
            width: 90px;
            position: relative;
            margin-right: 5px;
            float: left;
            margin-bottom: 5px;
        }
        .preview-images-zone > .preview-image > .image-zone {
            width: 100%;
            height: 100%;
        }
        .preview-images-zone > .preview-image > .image-zone > img {
            width: 100%;
            height: 100%;
        }
        .preview-images-zone > .preview-image > .tools-edit-image {
            position: absolute;
            z-index: 100;
            color: #fff;
            bottom: 0;
            width: 100%;
            text-align: center;
            margin-bottom: 10px;
            display: none;
        }
        .preview-images-zone > .preview-image > .image-cancel {
            font-size: 18px;
            position: absolute;
            top: 0;
            right: 0;
            font-weight: bold;
            margin-right: 10px;
            cursor: pointer;
            display: none;
            z-index: 100;
        }
        .preview-image:hover > .image-zone {
            cursor: move;
            opacity: .5;
        }
        .preview-image:hover > .tools-edit-image,
        .preview-image:hover > .image-cancel {
            display: block;
        }
        .ui-sortable-helper {
            width: 90px !important;
            height: 90px !important;
        }

        .container {
            padding-top: 50px;
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
            }function checkCpf() {
                var cpf = document.querySelector("#cpf");
                if (cpf.value === "") {
                    cpf.setCustomValidity("Insira um cpf");
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
                                <h3 class="panel-title">Cadastro de Imóveis</h3>
                            </div>
                            <div class="panel-body">
                                <form role="form" action="imovel" method="POST">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-xs-auto col-sm-auto col-md-6">
                                                    <div class="col-25">
                                                        <label class="control-label" for="cpf">CPF*</label>
                                                    </div>	
                                                    <input oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                   type = "number"
                                                   maxlength = "11" type="number" name="cpf" id="cpf" class="form-control" oninvalid="checkCpf();" oninput="this.setCustomValidity('')" placeholder="CPF" value="${clienteP.cpf}" required="">
                                                    <br>
                                                    <a href="#" class="btn btn-info" onclick="this.href = 'cliente?comando=buscaCliente&cpfCliente=' + document.getElementById('cpf').value">Buscar</a>							
                                                </div>
                                                <div class="col-xs-auto col-sm-auto col-md-6">
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="proprietario">Proprietário</label>
                                                        </div>	
                                                        <input type="text" name="proprietario" id="proprietario" class="form-control input-sm" value="${clienteP.nome}">
                                                        <input type="hidden" id="idCliente" name="idCliente" value="${clienteP.idCliente}">

                                                    </div>

                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-xs-auto col-sm-auto col-md-6">

                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label for="dataCad" class="control-label">Data*</label>
                                                        </div>

                                                        <input type="text" name="dataCad" id="dataCad" class="form-control input-sm" placeholder="DD/MM/AA" required>
                                                    </div>

                                                </div>

                                                <div class="col-xs-auto col-sm-auto col-md-6">
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="servico">Servico</label>
                                                            <select id="servico" name="servico" class="form-control">
                                                                <option>Selecione</option>
                                                                <option>Venda</option>
                                                                <option>Aluguel</option>                                                    
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-xs-auto col-sm-auto col-md-6">
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="categoria">Categoria</label>
                                                        </div>	
                                                        <select id="categoria" name="categoria" class="form-control">
                                                            <option>Selecione</option>
                                                            <option>Residencial</option>
                                                            <option>Comercial</option>
                                                            <option>Rural</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-xs-auto col-sm-auto col-md-6">	
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="tipo">Tipo do Imóvel</label>
                                                        </div>	
                                                        <select id="tipo" name="tipo" class="form-control">
                                                            <option>Selecione</option>
                                                            <option>Apartamento</option>
                                                            <option>Casa</option>
                                                            <option>Terreno</option>
                                                        </select>
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="row">
                                                <div class="col-xs-auto col-sm-auto col-md-6">
                                                   <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="codImovel">Cód. Imóvel</label>
                                                        </div>	
                                                        <input type="text" name="codImovel" id="codImovel" class="form-control input-sm" placeholder="codImovel" value=${codGerado} disabled>
                                                    </div>
                                                </div>
                                                <div class="col-xs-auto col-sm-auto col-md-6">
                                                    
                                                </div>
                                            </div> 
                                            <div class="row">
                                                <div class="col-xs-3 col-sm-3 col-md-3">
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="valorVenda"oninvalid="this.setCustomValidity('Campo obrigatório')" oninput="this.setCustomValidity('')" required >Venda*</label>
                                                        </div>	
                                                        <input type="number" name="valorVenda" id="valorVenda" class="form-control input-sm" placeholder="Valor venda" value="0">
                                                    </div>
                                                </div>
                                                <div class="col-xs-3 col-sm-3 col-md-3">
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="valorAluguel" oninvalid="this.setCustomValidity('Campo obrigatório')" oninput="this.setCustomValidity('')" required >Aluguel*</label>
                                                        </div>	
                                                        <input type="number" name="valorAluguel" id="valorAluguel" class="form-control input-sm" placeholder="Valor aluguel" value="0">
                                                    </div>
                                                </div>
                                                <div class="col-xs-3 col-sm-3 col-md-3">
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="condominio">Condomínio</label>
                                                        </div>	
                                                        <input type="number" name="condominio" id="condominio" class="form-control input-sm" placeholder="Condomínio" value="0">
                                                    </div>
                                                </div>
                                                <div class="col-xs-3 col-sm-3 col-md-3">
                                                    <div class="form-group">
                                                        <div class="col-25">
                                                            <label class="control-label" for="iptu">IPTU</label>
                                                        </div>	
                                                        <input type="number" name="iptu" id="iptu" class="form-control input-sm" placeholder="IPTU" value="0">
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="row">
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


                                        <div class="col-xs-auto col-sm-auto col-md-6">
                                            <div>
                                                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                                    <!-- Indicators -->
                                                    <ol class="carousel-indicators"id="indicator">
                                                        <li class="preview-image preview-show-1" data-target="#myCarousel" data-slide-to="0" class=""></li>
                                                        <li class="preview-image preview-show-2" data-target="#myCarousel" data-slide-to="1" class=""></li>
                                                        <li class="preview-image preview-show-3" data-target="#myCarousel" data-slide-to="2" class=""></li>

                                                    </ol>
                                                    <div class="carousel-inner" role="listbox" id="car">
                                                        <div class="item active ">
                                                            <img class="first-slide preview-image preview-show-1"  src="img/1.jpeg" data-no="1" alt="Foto da casa">
                                                        </div>
                                                        <div class="item">
                                                            <img class="second-slide preview-image preview-show-2" src="img/2.jpeg" data-no="2" alt="Foto da casa">

                                                        </div>
                                                        <div class="item">
                                                            <img class="third-slide preview-image preview-show-3" src="img/3.jpeg" data-no="3" alt="Foto da casa">

                                                        </div>
                                                    </div>
                                                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>

                                                    </a>
                                                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>

                                                    </a>

                                                </div><!--carousel-->

                                                <!-- -------------------------------------------------------------------------------------------->
                                                <div class="container">
                                                    <fieldset class="form-group">
                                                        <a href="javascript:void(0)" onclick="$('#pro-image').click()">Selecione algumas imagens    </a>
                                                        <input type="file" id="pro-image" name="pro-image" style="display: none;" class="form-control" multiple>
                                                    </fieldset>
                                                    <div class="preview-images-zone">
                                                        <div class="preview-image preview-show-1">
                                                            <div class="image-cancel" data-no="1">x</div>
                                                            <div class="image-zone"><img id="pro-img-1" src="img/1.jpeg"></div>
                                                        </div>
                                                        <div class="preview-image preview-show-2">
                                                            <div class="image-cancel" data-no="2">x</div>
                                                            <div class="image-zone"><img id="pro-img-2" src="img/2.jpeg"></div>
                                                        </div>
                                                        <div class="preview-image preview-show-3">
                                                            <div class="image-cancel" data-no="3">x</div>
                                                            <div class="image-zone"><img id="pro-img-3" src="img/3.jpeg"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- -------------------------------------------------------------------------------------------->

                                            </div><!--DIV DO CAROUSEL-->	



                                        </div>
                                    </div>

                                    <div class="row"> 
                                        <hr>
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Dependencias</h3>

                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="quartos">Quartos</label>
                                                </div>	
                                                <input type="number" name="quartos" id="quartos" class="form-control input-sm" placeholder="Quartos" value="0">
                                            </div>
                                        </div>

                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="banheiros">Banheiros</label>
                                                </div>	
                                                <input type="number" name="banheiros" id="banheiros" class="form-control input-sm" placeholder="banheiros" value="0">
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="suites">Suítes</label>
                                                </div>	
                                                <input type="number" name="suites" id="suites" class="form-control input-sm" placeholder="Suítes" value="0">
                                            </div>
                                        </div>

                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="vagasGaragem">Vagas na Garagem</label>
                                                </div>	
                                                <input type="number" name="vagasGaragem" id="vagasGaragem" class="form-control input-sm" placeholder="Vagas" value="0">
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="areaUtil">Área útil*</label>
                                                </div>	
                                                <input type="number" name="areaUtil" id="areaUtil" class="form-control input-sm" placeholder="Área útil" value="0" oninvalid="this.setCustomValidity('Campo obrigatório')" oninput="this.setCustomValidity('')" required>
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-2">
                                            <div class="form-group">
                                                <div class="col-25">
                                                    <label class="control-label" for="areaTotal" oninvalid="this.setCustomValidity('Campo obrigatório')" oninput="this.setCustomValidity('')" required>Área total*</label>
                                                </div>	
                                                <input type="number" name="areaTotal" id="areaTotal" class="form-control input-sm" placeholder="Área total" value="0">
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
                                                        <label class="control-label" for="cep" oninvalid="this.setCustomValidity('Campo obrigatório')" oninput="this.setCustomValidity('')" required >CEP*</label>
                                                    </div>	
                                                    <input type="number" name="cep" id="cep" class="form-control input-sm" placeholder="CEP"onblur="pesquisacep(this.value);">
                                                    <br>
                                                    <button type="button" class="btn btn-info">Buscar</button>
                                                </div>
                                            </div>

                                            <div class="col-xs-auto col-sm-auto col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="rua">Rua</label>
                                                    </div>	
                                                    <input type="text" name="rua" id="rua" class="form-control input-sm" placeholder="Rua">
                                                </div>
                                            </div>

                                            <div class="col-xs-auto col-sm-auto col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="bairro">Bairro</label>
                                                    </div>	
                                                    <input type="text" name="bairro" id="bairro" class="form-control input-sm" placeholder="Bairro">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-auto col-sm-auto col-md-6">

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="num" oninvalid="this.setCustomValidity('Campo obrigatório')" oninput="this.setCustomValidity('')" required >Número*</label>
                                                    </div>	
                                                    <input type="number" name="num" id="num" class="form-control input-sm" placeholder="Número" value="0">
                                                </div>
                                            </div>
                                            <div class="col-xs-auto col-sm-auto col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="complemento">Complemento</label>
                                                    </div>	
                                                    <input type="text" name="complemento" id="complemento" class="form-control input-sm" placeholder="Complemento">
                                                </div>
                                            </div>

                                            <div class="col-xs-auto col-sm-auto col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="cidade">Cidade</label>
                                                    </div>	
                                                    <input type="text" name="cidade" id="cidade" class="form-control input-sm" placeholder="Cidade">
                                                </div>
                                            </div>
                                            <div class="col-xs-auto col-sm-auto col-md-6">
                                                <div class="form-group">
                                                    <div class="col-25">
                                                        <label class="control-label" for="uf">UF</label>
                                                    </div>	
                                                    <input type="text" name="uf" id="uf" class="form-control input-sm" placeholder="UF">
                                                </div>
                                                <input type="hidden" name="comando" id="comando" value="cadastrar"/>
                                            </div>
                                        </div>		
                                    </div>
                                    <hr>


                                    <div class="row">
                                        <br>
                                        <div class="col-xs-auto col-sm-auto col-md-6">
                                            <button type="submit" class="btn btn-info" >Salvar</button>
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
