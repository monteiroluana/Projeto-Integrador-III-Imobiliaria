<%-- 
    Document   : index
    Created on : Apr 20, 2018, 2:31:24 PM
    Author     : I864970
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/lib/w3data.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script> <!--validador-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.min.js"></script> <!--validador-->
        
        
    </head>
    <script>
        function checkUser(){
            var user = document.querySelector("#usr");
            if(user.value === ""){
                user.setCustomValidity("Insira um usuário");
            }
        }
        
        function checkSenha(){
            var senha = document.querySelector("#pass");
            if(senha.value === ""){
                senha.setCustomValidity("Insira uma senha");
            }
        }
    </script>
    <body>
        <div class="jumbotron col-md-3 col-xs-auto" id="loginn">
            <div class="row">
                <div class="col-md-12">

                    <form class="form" role="form" method="post" data toogle="validator" action="autenticador" accept-charset="UTF-8" id="login-nav" name="login-nav">
                        <div class="form-group">

                            <input type="text" class="form-control" name="usr" id="usr" placeholder="nome de usuário" oninvalid="checkUser();" oninput="this.setCustomValidity('')" required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">

                            <input type="password" class="form-control" id="pass" name="pass" placeholder="senha" oninvalid="checkSenha();" oninput="this.setCustomValidity('')" required>
                            <div class="help-block text-right"><a href="">Esqueci minha senha</a></div>
                        </div>
                        <div class="form-group">
                            <button type="button submit" class="btn btn-primary btn-block" onClick="guardaNome()" >acessar</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <div class="navbar navbar-default navbar-fixed-bottom" id="footer">
            <div class="container text-center text-md-left">

                <div class="row">
                    <div class="col-md-4">
                        <p class="navbar-text pull-left">© 2018- D.Evolution
                            <a href="https://github.com/monteiroluana/PI_III" target="_blank" >github</a>
                        </p>
                    </div>
                    <hr class="clearfix w-100 d-md-none">

                </div>
            </div>	
        </div>
        <script>
            function access() {
                var usr = document.getElementById('usr').value;
                var pass = document.getElementById("pass").value;
                if (usr == 'adm' && pass == 'adm') {
                    alert("Bem vindo adm");
                    window.location.replace("inicial.jsp");
                } else {
                    alert("Usuário ou senha incorretos.");
                }
            }
            function guardaNome() {
                var nome = document.getElementById("usr").value;
                document.cookie = nome;

            }
        </script>
    </body>
    <style>

        /* CSS Document */

        

        .form-login {
            background-color: #EDEDED;
            padding-top: 10px;
            padding-bottom: 20px;
            padding-left: 20px;
            padding-right: 20px;
            border-radius: 15px;
            border-color:#d2d2d2;
            border-width: 5px;
            box-shadow:0 1px 0 #cfcfcf;
        }.form-control {
            border-radius: 10px;
        }.wrapper {
            text-align: center;
        }#footer{
            background-color: #EDEDED;
            opacity: 0.9;
        }.form-login{
            vertical-align: middle;
            top: 50%;
            left: 50%;

        }#loginn{
            margin-top: 1%;
            margin-left: 74%;
            opacity: 0.9;
            border-radius: 25px;
        }#loginn:hover{
            opacity: 1;
        }
        body,html{
            background-image: url(https://images.pexels.com/photos/40142/new-york-skyline-manhattan-hudson-40142.jpeg);
            background-repeat: no-repeat;
            background-size: cover;
            height: 100%;
        }.centered-form{
            margin-top: 60px;
        }.centered-form .panel{
            background: rgba(255, 255, 255, 0.8);
            box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
        }figure{
            border: medium solid blac
                k;
            float: right;
        }input[type=text], select, textarea{
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            resize: vertical;
        }label {
            padding: 12px 12px 12px 0;
            display: inline-block;
        }input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }.container {
            border-radius: 5px;
            padding: 20px;
        }.main .row{
            padding: 0px;
            margin: 0px;
            /* remove outer padding */
        }nav.sidebar.navbar {
            border-radius: 0px;
            /*Remove rounded coners*/
        }nav.sidebar, .main{
            -webkit-transition: margin 200ms ease-out;
            -moz-transition: margin 200ms ease-out;
            -o-transition: margin 200ms ease-out;
            transition: margin 200ms ease-out;
        }.main{
            padding: 10px 10px 0 10px;
            /* Add gap to nav and right windows.*/
        }@media (min-width: 768px) {
            /*small/medium side display*/
            /*Allow main to be next to Nav*/
            .main{
                position: absolute;
                width: calc(100% - 40px); /*keeps 100% minus nav size*/
                margin-left: 40px;
                float: right;
            }nav.sidebar:hover + .main{
                margin-left: 200px;
                /*lets nav bar to be showed on mouseover*/
            }nav.sidebar.navbar.sidebar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand {
                margin-left: 0px;
                /*Center Brand*/
            }nav.sidebar .navbar-brand, nav.sidebar .navbar-header{
                text-align: center;
                width: 100%;
                margin-left: 0px;
                /*Center Brand*/
            }nav.sidebar a{
                padding-right: 13px;
                /*Center Icons*/
            }nav.sidebar .navbar-nav > li:first-child{
                border-top: 1px #e5e5e5 solid;
                /*adds border top to first nav box */
            }nav.sidebar .navbar-nav > li{
                border-bottom: 1px #e5e5e5 solid;
                /*adds border to bottom nav boxes*/
            }nav.sidebar .navbar-nav .open .dropdown-menu {
                position: static;
                float: none;
                width: auto;
                margin-top: 0;
                background-color: transparent;
                border: 0;
                -webkit-box-shadow: none;
                box-shadow: none;
                /* Colors/style dropdown box*/
            }nav.sidebar .navbar-collapse, nav.sidebar .container-fluid{
                padding: 0 0px 0 0px;
                /*allows nav box to use 100% width*/

            }.navbar-inverse .navbar-nav .open .dropdown-menu>li>a {
                color: #777;
                /*colors dropdown box text */
            }nav.sidebar{
                width: 200px;
                height: 100%;
                margin-left: -160px;
                float: left;
                z-index: 8000;
                margin-bottom: 0px;
                position: fixed;
                /*gives sidebar width/height*/
            }nav.sidebar li {
                width: 100%;
                /*give sidebar 100% width;*/
            }nav.sidebar:hover{
                margin-left: 0px;
                /* Move nav to full on mouse over*/
            }.forAnimate{
                opacity: 0;
                /*for hiden things when navbar hidden*/
            }
        }nav.sidebar .navbar-nav .open .dropdown-menu>li>a:hover, nav.sidebar .navbar-nav .open .dropdown-menu>li>a:focus {
            color: #CCC;
            background-color: transparent;
        }
        nav:hover .forAnimate{
            opacity: 1;
        }
        section{
            padding-left: 15px;
        }
        #anexo {
            background-color: #5CBFDE;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
            margin: 10px;
            padding: 6px 20px
        }
        input[type="file"] {
            display: none
        }

        #custom-search-input{

            border: solid 1px #E4E4E4;
            border-radius: 6px;
            background-color: #fff;
        }

        #custom-search-input input{
            border: 0;
            box-shadow: none;
        }

        #custom-search-input button{
            background: none;
            box-shadow: none;
            border: 0;
            color: #666666;
            border-left: solid 1px #ccc;
        }

        #custom-search-input button:hover{
            border: 0;
            box-shadow: none;
            border-left: solid 1px #ccc;
        }

        #custom-search-input .glyphicon-search{
            font-size: 18px;
        }.custab{
            border: 1px solid #ccc;
            padding: 5px;
            margin: 5% 0;
            box-shadow: 3px 3px 2px #ccc;
            transition: 0.5s;
        }
        .custab:hover{
            box-shadow: 3px 3px 0px transparent;
            transition: 0.5s;
        }


    </style>
</html>
