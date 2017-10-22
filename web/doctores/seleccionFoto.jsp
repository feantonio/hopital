<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<jsp:include page="encabezado.jsp"/>
<%int folio = Integer.parseInt(request.getParameter("folio"));%>
<body class="homepage">
    <div id="page-wrapper">
        <nav id="nav">
            <ul>
                <li><a href="menuDoctor.jsp?folio=<%=folio%>">Inicio</a></li>
                <li><a href="datosPersonales.jsp?folio=<%=folio%>">Datos personales</a></li>
                <li><a href="citasMedicas.jsp?folio=<%=folio%>">Citas médicas</a></li>
                <li><a href="../login.jsp?cerrar='true'">Cerrar sesión</a></li>
            </ul>
        </nav>
                <br><br>
        <center>               
            <div id="main-wrapper"><br><br>
<div class="container">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h4><i class='glyphicon glyphicon-edit'></i>AGRAGAR FOTOGRAFIA</h4>
        </div>
        <div class="panel-body">
            <div class="modal-body">
                <form class="form-horizontal" action="subirFoto.jsp?folio=<%=folio%>" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Fotografia</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" name="foto" required>
                        </div>
                    </div>

                    <div class="btn-group pull-right">
                        <button type="submit" >Subir</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<br><br> <br><br> <br><br> <br><br> <br><br>
<jsp:include page="piePagina.jsp"/>