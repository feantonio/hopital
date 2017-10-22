<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<jsp:include page="encabezado.jsp"/>
<%int folio = Integer.parseInt(request.getParameter("folio"));%>
<body class="homepage">
    <div id="page-wrapper">
        <nav id="nav">
            <ul>
                <li><a href="menuPaciente.jsp?folio=<%=folio%>">Inicio</a></li>
                <li><a href="datosPersonales.jsp?folio=<%=folio%>">Datos personales</a></li>
                <li><a href="#">Expediente médico</a></li>
                <li><a href="#">Citas médicas</a>
                    <ul>
                        <li><a href="calendarioCita.jsp?folio=<%=folio%>">Generar cita</a></li>
                        <li><a href="agendaCitas.jsp?folio=<%=folio%>">Agenda de citas</a></li>
                    </ul>
                </li>
                <li><a href="../login.jsp?cerrar='true'">Cerrar sesión</a></li>
            </ul>
        </nav>
                
              <br><br>
        <center>               
            <div id="main-wrapper">

<%
   
    Object[] fila = new Object[13];
    String tipo = "";
    if ( request.getParameter("folio") != null) 
    {
        conexionBD conBD = new conexionBD();
        int id = Integer.parseInt(request.getParameter("folio"));
        ResultSet resultadoBusqueda;

        if (conBD.enchufar()) {
            resultadoBusqueda = conBD.buscar("Select *from pacientes where folio= '" + id + "'");
            if (resultadoBusqueda != null) {
                resultadoBusqueda.next();
                fila[0] = resultadoBusqueda.getInt("folio");
                fila[1] = resultadoBusqueda.getString("nombrePac");
                fila[2] = resultadoBusqueda.getString("fotoPac");
                fila[3] = resultadoBusqueda.getString("fechaNacPac");
                fila[4] = resultadoBusqueda.getString("sexoPac");
                fila[5] = resultadoBusqueda.getString("curpPac");
                fila[6] = resultadoBusqueda.getString("calle");
                fila[7] = resultadoBusqueda.getString("noExterior");
                fila[8] = resultadoBusqueda.getString("colonia");
                fila[9] = resultadoBusqueda.getString("telefono");
                fila[10] = resultadoBusqueda.getString("municipio");
                fila[11] = resultadoBusqueda.getString("estado");
                fila[12] = resultadoBusqueda.getString("pais");

                conBD.desenchufar();

                if (fila[4].equals("H")) {
                    tipo = "Hombre";
                } else if (fila[4].equals("M")) {
                    tipo = "Mujer";
                } else {
                    tipo = "Otro";
                }
            }
        } else {
%>
<script>
    alertify.error("Error al conectarse");
</script>    
<%
        }
    }


%>
<br><br>
<div class="container">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h4><i class='glyphicon glyphicon-edit'></i>Datos personales</h4>
        </div>
        <div class="panel-body">
            <div class="modal-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <a href="seleccionFoto.jsp?folio=<%=fila[0]%>"> <img src="fotos/<%=fila[2]%>" alt="" width="200" /> </a>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Nombre</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="nombre" value="<%=fila[1]%>" readonly="true" onkeypress="return validarLetras(event)" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">CURP</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="curp" value="<%=fila[5]%>" readonly="true" required>
                        </div>
                    </div>
                    <div>  
                        <div class="col-md-6">
                            <label>Fecha de nacimiento</label>
                            <input type="text" class="form-control input-sm" name="fecha" value="<%=fila[3]%>" readonly="true" required>
                        </div>
                        <div class="col-md-6">
                            <label>Sexo</label>
                            <input type="text" class="form-control input-sm" name="sexo" value="<%=tipo%>" readonly="true" required>
                        </div>
                    </div>
                    <div>  
                        <div class="col-md-6">
                            <label>Calle</label>
                            <input type="text" class="form-control input-sm" name="calle" value="<%=fila[6]%>" readonly="true" required>
                        </div>
                        <div class="col-md-6">
                            <label>No. Exterior</label>
                            <input type="text" class="form-control input-sm" name="num" value="<%=fila[7]%>" readonly="true" required>
                        </div>
                    </div>	 
                    <div>  
                        <div class="col-md-6">
                            <label>Colonia</label>
                            <input type="text" class="form-control input-sm" name="colonia" value="<%=fila[8]%>" readonly="true" required>
                        </div>
                        <div class="col-md-6">
                            <label>Municipio</label>
                            <input type="text" class="form-control input-sm" name="municipio" value="<%=fila[10]%>" readonly="true" onkeypress="return validarLetras(event)" required>
                        </div>
                    </div>
                    <div>  
                        <div class="col-md-6">
                            <label>Estado</label>
                            <input type="text" class="form-control input-sm" name="estado" value="<%=fila[11]%>" readonly="true" onkeypress="return validarLetras(event)" required>
                        </div>
                        <div class="col-md-6">
                            <label>Pais</label>
                            <input type="text" class="form-control input-sm" name="pais" value="<%=fila[12]%>" readonly="true" onkeypress="return validarLetras(event)"required>
                        </div>
                    </div>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Teléfono</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="telefono" value="<%=fila[9]%>" readonly="true" onkeypress="return validarNumeros(event)" required>
                        </div>
                    </div>

                        <input type="hidden" name="folio" value="<%=fila[0]%>">
                    <div class="btn-group pull-right">
                        <button type="submit"  onclick="location.href='edita.jsp?folio=<%=fila[0]%>'">Editar datos</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
                        <jsp:include page="piePagina.jsp"/>