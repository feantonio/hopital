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
            <div id="main-wrapper">
<%
    Object[] fila = new Object[16];
    Object[] esp = new Object[2];
    String tipo = "";
    if (request.getParameter("folio") != null) {
        conexionBD conBD = new conexionBD();
        int id = Integer.parseInt(request.getParameter("folio"));
        ResultSet resultadoBusqueda, busqueda;

        if (conBD.enchufar()) {
            resultadoBusqueda = conBD.buscar("Select *from doctores where cedula= '" + id + "'");
            if (resultadoBusqueda != null) {
                resultadoBusqueda.next();
                fila[0] = resultadoBusqueda.getInt("idDoctor");
                fila[1] = resultadoBusqueda.getInt("cedula");
                fila[2] = resultadoBusqueda.getString("nombreDoc");
                fila[3] = resultadoBusqueda.getString("curpDoc");

                fila[4] = resultadoBusqueda.getString("fotoDoc");
                fila[5] = resultadoBusqueda.getString("sexoDoc");
                fila[6] = resultadoBusqueda.getString("fechaNacDoc");
                fila[7] = resultadoBusqueda.getString("nacionalidadDoc");

                fila[8] = resultadoBusqueda.getString("calle");
                fila[9] = resultadoBusqueda.getString("noExterior");
                fila[10] = resultadoBusqueda.getString("colonia");
                fila[11] = resultadoBusqueda.getString("telefono");
                fila[12] = resultadoBusqueda.getString("municipio");
                fila[13] = resultadoBusqueda.getString("estado");
                fila[14] = resultadoBusqueda.getString("pais");
                fila[15] = resultadoBusqueda.getInt("idEspecialidad");
                
                 busqueda = conBD.buscar("Select *from especialidades where idEspecialidad='"+ fila[15] +"'");
                busqueda.next();
                esp[0] = busqueda.getInt("idEspecialidad");
                esp[1] = busqueda.getString("nombreEsp");
                                    
                                    
                conBD.desenchufar();

                if (fila[5].equals("H")) {
                    tipo = "Hombre";
                } else if (fila[5].equals("M")) {
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

                        String tabla = "especialidades";
                        Object[] especialidad = new Object[2];
                        ResultSet respuesta;
%>
<br><br>
<div class="container">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h4><i class='glyphicon glyphicon-edit'></i>Datos personales</h4>
        </div>
        <div class="panel-body">
            <div class="modal-body">
                
                    <div class="form-group">
                        <a href="seleccionFoto.jsp?folio=<%=fila[1]%>"> <img src="fotos/<%=fila[4]%>" alt="" width="200" /> </a>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Nombre</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="nombre" value="<%=fila[2]%>" readonly="true" onkeypress="return validarLetras(event)" required>
                        </div><br><br>
                    </div>
                        
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Cedula</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="cedula" value="<%=fila[1]%>" readonly="true" onkeypress="return validarNumeros()(event)" required>
                        </div><br><br>
                    </div>
                    <div class="form-group">
                       <label class="col-sm-2 control-label">Especialidad</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="especial" value="<%=esp[1]%>" readonly="true" onkeypress="return validarNumeros()(event)" required>
                        </div><br><br>
                    </div>
                        
                    <div class="form-group">
                        <label class="col-sm-2 control-label">CURP</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="curp" value="<%=fila[3]%>" readonly="true" required>
                        </div>
                    </div><br><br>
                        <div>  
                        <div class="col-md-6">
                            <label>Teléfono</label>
                            <input type="text" class="form-control input-sm" name="telefono" value="<%=fila[11]%>" readonly="true" onkeypress="return validarNumeros(event)" required>
                        </div>
                        <div class="col-md-6">
                            <label>Nacionalidad</label>
                            <input type="text" class="form-control input-sm" name="nacion" value="<%=fila[7]%>" readonly="true" onkeypress="return validarLetras(event)" required>
                        </div>
                    </div>
                    <div>  
                        <div class="col-md-6">
                            <label>Fecha de nacimiento</label>
                            <input type="text" class="form-control input-sm" name="fecha" value="<%=fila[6]%>" readonly="true" required>
                        </div>
                        <div class="col-md-6">
                            <label>Sexo</label>
                            <input type="text" class="form-control input-sm" name="sexo" value="<%=tipo%>" readonly="true" required>
                        </div>
                    </div>
                    <div>  
                        <div class="col-md-6">
                            <label>Calle</label>
                            <input type="text" class="form-control input-sm" name="calle" value="<%=fila[8]%>" readonly="true" required>
                        </div>
                        <div class="col-md-6">
                            <label>No. Exterior</label>
                            <input type="text" class="form-control input-sm" name="num" value="<%=fila[9]%>" readonly="true" onkeypress="return validarNumeros()(event)" required>
                        </div>
                    </div>	 
                    <div>  
                        <div class="col-md-6">
                            <label>Colonia</label>
                            <input type="text" class="form-control input-sm" name="colonia" value="<%=fila[10]%>" readonly="true" required>
                        </div>
                        <div class="col-md-6">
                            <label>Municipio</label>
                            <input type="text" class="form-control input-sm" name="municipio" value="<%=fila[12]%>" readonly="true" onkeypress="return validarLetras(event)" required>
                        </div>
                    </div>
                    <div>  
                        <div class="col-md-6">
                            <label>Estado</label>
                            <input type="text" class="form-control input-sm" name="estado" value="<%=fila[13]%>" readonly="true" onkeypress="return validarLetras(event)" required>
                        </div>
                        <div class="col-md-6">
                            <label>Pais</label>
                            <input type="text" class="form-control input-sm" name="pais" value="<%=fila[14]%>" readonly="true" onkeypress="return validarLetras(event)"required>
                        </div>
                    </div>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br> <br><br> 
                    <input type="hidden" name="foto" value="<%=fila[4]%>">
                        <input type="hidden" name="folio" value="<%=fila[0]%>">
                     <div class="btn-group pull-right">
                        <button type="submit"  onclick="location.href='edita.jsp?folio=<%=fila[1]%>'">Editar datos</button>
                    </div>
               
            </div>
        </div>
    </div>
</div>
                        <jsp:include page="piePagina.jsp"/>