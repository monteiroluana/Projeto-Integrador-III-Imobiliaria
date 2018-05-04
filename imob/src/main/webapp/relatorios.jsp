<%-- 
    Document   : relatorios
    Created on : May 4, 2018, 3:37:09 PM
    Author     : I864970
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatórios</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css" />
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>

        <script type="text/javascript" src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
        <link rel="stylesheet" href="css/styles.css">

        <!--PDF -->
        <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light/all.min.css" />
        <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
        <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/jszip.min.js"></script>
        <script src="http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/lib/w3data.js"></script><!--includeHTML-->
    </head>
    <body>
        <div w3-include-html="menu.html"></div>
        <script>
            w3IncludeHTML();
        </script>

        <div class="main">
            <div class="container">
                <div class="row centered-form">
                    <div>
                        <br>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Consulta de Relatórios</h3>
                            </div>
                            <div class="panel-body">
                                <form role="form">
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-4">
                                            <h3 class="panel-title">Filtrar busca</h3>
                                        </div>
                                        <hr>
                                    </div>	
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="datetimepicker_de" class="control-label">Data inicial</label>
                                                <div class="input-group date" id="datetimepicker_de">
                                                    <input type="text" class="form-control"/>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>	
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="datetimepicker_ate" class="control-label">Data final</label>
                                                <div class="input-group date" id="datetimepicker_ate">
                                                    <input type="text" class="form-control"/>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-info" type="button" id="buttonData">
                                                            <span class="glyphicon glyphicon-search"></span>
                                                        </button>
                                                    </span>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <label class="control-label" for="filtro"> Filtrar busca </label>
                                            <div>
                                                <select id="filtro" name="filtro" class="form-control">
                                                    <option>Selecione</option>
                                                    <option>Venda</option>
                                                    <option>Locação</option>
                                                </select>
                                            </div> 
                                        </div>
                                        <div class="col-sm-4">
                                            <label class="control-label" > <br> </label>
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="digite o número do contrato...">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-info" type="button" id="buttonNumeroContrato"><span class="glyphicon glyphicon-search"></span>
                                                    </button>
                                                </span>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-auto col-sm-auto col-md-auto">

                                            <table class="table table-striped custab" id="exportTable">
                                                <thead>
                                                    <tr>
                                                        <th>Data</th>
                                                        <th>NContrato</th>
                                                        <th>Contrato</th>
                                                        <th>Locatario</th>
                                                        <th>Imovel</th>
                                                        <th>CodRef</th>
                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>	
                                                    <tr>
                                                        <td>10/10/2015</td>
                                                        <td>001</td>
                                                        <td>Venda</td>
                                                        <td>Miguel Reis</td>
                                                        <td>Casa</td>
                                                        <td>001</td>
                                                       
                                                    </tr>
                                                    <tr>
                                                        <td>10/10/2018</td>
                                                        <td>002</td>
                                                        <td>Venda</td>
                                                        <td>Italo Macedo</td>
                                                        <td>Apartamento</td>
                                                        <td>003</td>
                                                        	
                                                    </tr>
                                                    <tr>
                                                        <td>10/10/2014</td>
                                                        <td>003</td>
                                                        <td>Locação</td>
                                                        <td>Fernanda Martins</td>
                                                        <td>Casa</td>
                                                        <td>004</td>
                                                        
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <button id="exportButton" class="btn btn-sm btn-danger clearfix"><span class="fa fa-file-pdf-o"></span> Exportar para PDF</button>
                                        <button id="btnExport" class="btn btn-sm btn-danger clearfix"><span class="fa fa-file-pdf-o"></span> Exportar para Excel</button>
                                    </div>
                                </form>
                            </div>
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

            });
        </script> <!--Calendario-->

        <script>
            $("#btnExport").click(function (e) {
                window.open('data:application/vnd.ms-excel,' + $('#exportTable').html());
                e.preventDefault();
            });

        </script> <!--EXCEL-->

        <script>
            jQuery(function ($) {
                $("#exportButton").click(function () {
                    var dataSource = shield.DataSource.create({
                        data: "#exportTable",
                        schema: {
                            type: "table",
                            fields: {
                                Data: {type: String},
                                NContrato: {type: String},
                                Contrato: {type: String},
                                Locatario: {type: String},
                                Imovel: {type: String},
                                CodRef: {type: Number}
                            }
                        }
                    });
                    dataSource.read().then(function (data) {
                        var pdf = new shield.exp.PDFDocument({
                            author: "PrepBootstrap",
                            created: new Date()
                        });
                        pdf.addPage("a4", "landscape");
                        pdf.table(
                                50,
                                50,
                                data,
                                [
                                    {field: "Data", title: "Data", width: 80},
                                    {field: "NContrato", title: "N. Contrato", width: 100},
                                    {field: "Contrato", title: "Contrato", width: 100},
                                    {field: "Locatario", title: "Locatario", width: 100},
                                    {field: "Imovel", title: "Imovel", width: 100},
                                    {field: "CodRef", title: "Cod. Ref", width: 50}
                                ],
                                {
                                    margins: {
                                        top: 50,
                                        left: 50
                                    }
                                }
                        );
                        var timestamp = Date.now();
                        pdf.saveAs({

                            fileName: "Consulta" + timestamp
                        });
                    });
                });
            });
        </script> <!--PDF-->


    </body>
</html>