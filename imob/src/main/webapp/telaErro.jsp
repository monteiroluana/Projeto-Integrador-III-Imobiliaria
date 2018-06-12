<%-- 
    Document   : autorizacao
    Created on : Jun 9, 2018, 6:57:09 PM
    Author     : I864970
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acesso negado</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/lib/w3data.js"></script><!--includeHTML-->
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <style>
        
    </style>
    <body>
        <div class="row">
            <div class="col-sm-6 jumbotron" style="border-radius: 15px;">
                <h1><c:out value="${msg}"/></h1>                                
                <img src="img/autoriza.jpg" style="padding: 10px; width: 255px; height: 255px; ">
                <a href="inicial.jsp"><button type="button" class="btn btn-info">Voltar ao início</button></a><br>
            </div>
        </div>
        
    </body>
</html>
