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
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/login.css">
       
    </head>
    <style>
        body{
            background-image: url(img/background_login.jpg);
		background-repeat: no-repeat;
		background-size: cover;
        }
    </style>
    <body>
        <div class="jumbotron col-md-3 col-xs-auto" id="loginn">
            <div class="row">
                <div class="col-md-12">

                    <form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputEmail2">Usuário</label>
                            <input type="text" class="form-control" id="usr" placeholder="nome de usuário" required>
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputPassword2">Senha</label>
                            <input type="password" class="form-control" id="pass" placeholder="senha" required>
                            <div class="help-block text-right"><a href="">Esqueci minha senha</a></div>
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn btn-primary btn-block" onclick="access()">acessar</button>
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
            function access(){
                var usr = document.getElementById('usr').value;
                var pass = document.getElementById("pass").value;
                if(usr == 'adm' && pass == 'adm'){
                    alert("Bem vindo adm");
                    window.location.replace("inicial.jsp");
                }else{
                    alert("Usuário ou senha incorretos.");
                }
            }
        </script>
    </body>
</html>
