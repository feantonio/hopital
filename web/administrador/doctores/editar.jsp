<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<jsp:include page="encabezadoDoctor.jsp"/>

<%
    Object[] fila = new Object[16];
    Object[] esp = new Object[2];
    String tipo = "";
    if (request.getParameter("folio") != null) {
        conexionBD conBD = new conexionBD();
        int id = Integer.parseInt(request.getParameter("folio"));
        ResultSet resultadoBusqueda, busqueda;

        if (conBD.enchufar()) {
            resultadoBusqueda = conBD.buscar("Select *from doctores where idDoctor= '" + id + "'");
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
            <h4><i class='glyphicon glyphicon-edit'></i>Edición de doctor</h4>
        </div>
        <div class="panel-body">
            <div class="modal-body">
                <form class="form-horizontal" action="guardaEdicion.jsp">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Nombre</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="nombre" value="<%=fila[2]%>" maxlength="30" onkeypress="return validarLetras(event)" required>
                        </div>
                    </div>
                        
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Cedula</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="cedula" value="<%=fila[1]%>" maxlength="8" onkeypress="return validarNumeros()(event)" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Especialidad</label>
                            <select class="col-sm-10" name="especial" required>
                                <option value="<%=esp[0]%>"><%=esp[1]%></option>
                                        <%
                                        conexionBD bd = new conexionBD();
                                        bd.enchufar();
                                        if (bd.ver(tabla) != null) {
                                        respuesta = bd.ver(tabla);
                                        while (respuesta.next()) {
                                            especialidad[0] = respuesta.getInt("idEspecialidad");
                                            especialidad[1] = respuesta.getString("nombreEsp");
                                            %>
                                        <option value="<%=especialidad[0]%>"><%=especialidad[1]%></option>
                                            <%
                                        }
                                        }
                                        bd.desenchufar();
                                            %>
                            </select>
                    </div>
                        
                    <div class="form-group">
                        <label class="col-sm-2 control-label">CURP</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="curp" value="<%=fila[3]%>" maxlength="18" required>
                        </div>
                    </div>
                        <div>  
                        <div class="col-md-6">
                            <label>Teléfono</label>
                            <input type="text" class="form-control input-sm" name="telefono" value="<%=fila[11]%>" maxlength="10" onkeypress="return validarNumeros(event)" required>
                        </div>
                        <div class="col-md-6">
                            <label>Nacionalidad</label>
                            <input type="text" class="form-control input-sm" name="nacion" value="<%=fila[7]%>" maxlength="20" onkeypress="return validarLetras(event)" required>
                        </div>
                    </div>
                    <div>  
                        <div class="col-md-6">
                            <label>Fecha de nacimiento</label>
                            <input type="date" class="form-control input-sm" data-format="dd-mm-yyyy" name="fecha" value="<%=fila[6]%>" required>
                        </div>
                        <div class="col-md-6">
                            <label>Sexo</label>
                            <select class="form-control" name="sexo" required>
                                <option value="<%=fila[5]%>"><%=tipo%></option>
                                <option value="H">Hombre</option>
                                <option value="M">Mujer</option>
                                <option value="O">Otro</option>
                            </select>
                        </div>
                    </div>
                    <div>  
                        <div class="col-md-6">
                            <label>Calle</label>
                            <input type="text" class="form-control input-sm" name="calle" value="<%=fila[8]%>" maxlength="30" required>
                        </div>
                        <div class="col-md-6">
                            <label>No. Exterior</label>
                            <input type="text" class="form-control input-sm" name="num" value="<%=fila[9]%>" maxlength="4" onkeypress="return validarNumeros(event)" required>
                        </div>
                    </div>	 
                    <div>  
                        <div class="col-md-6">
                            <label>Colonia</label>
                            <input type="text" class="form-control input-sm" name="colonia" value="<%=fila[10]%>" maxlength="20" required>
                        </div>
                        <div class="col-md-6">
                            <label>Municipio</label>
                            <input type="text" class="form-control input-sm" name="municipio" value="<%=fila[12]%>" maxlength="30" onkeypress="return validarLetras(event)" required>
                        </div>
                    </div>
                    <div>  
                        <div class="col-md-6">
                            <label>Estado</label>
                            <input type="text" class="form-control input-sm" name="estado" value="<%=fila[13]%>" maxlength="30" onkeypress="return validarLetras(event)" required>
                        </div>
                        <div class="col-md-6">
                            <label>Pais</label>
                            <input type="text" class="form-control input-sm" name="pais" value="<%=fila[14]%>" maxlength="30" onkeypress="return validarLetras(event)"required>
                        </div>
                    </div>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br> <br><br><br><br> 
                        <input type="hidden" name="foto" value="<%=fila[4]%>">
                        <input type="hidden" name="folio" value="<%=fila[0]%>">
                        <input type="hidden" name="cedAnt" value="<%=fila[1]%>">
                    <div class="btn-group pull-right">
                        <button type="submit" >Guardar datos</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
                        <jsp:include page="pieDoctor.jsp"/>