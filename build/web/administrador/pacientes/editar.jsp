<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<jsp:include page="encabezadoPaciente.jsp"/>

<%
    Object[] fila = new Object[13];
    String tipo = "";
    if (request.getParameter("folio") != null) {
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
            <h4><i class='glyphicon glyphicon-edit'></i>Edición de paciente</h4>
        </div>
        <div class="panel-body">
            <div class="modal-body">
                <form class="form-horizontal" action="guardaEdicion.jsp">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Nombre</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="nombre" value="<%=fila[1]%>" maxlength="30" onkeypress="return validarLetras(event)" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">CURP</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="curp" value="<%=fila[5]%>" maxlength="18" required>
                        </div>
                    </div>
                    <div>  
                        <div class="col-md-6">
                            <label>Fecha de nacimiento</label>
                            <input type="date" class="form-control input-sm" data-format="dd-mm-yyyy" name="fecha" value="<%=fila[3]%>" required>
                        </div>
                        <div class="col-md-6">
                            <label>Sexo</label>
                            <select class="form-control" name="sexo" required>
                                <option value="<%=fila[4]%>"><%=tipo%></option>
                                <option value="H">Hombre</option>
                                <option value="M">Mujer</option>
                                <option value="O">Otro</option>
                            </select>
                        </div>
                    </div>
                    <div>  
                        <div class="col-md-6">
                            <label>Calle</label>
                            <input type="text" class="form-control input-sm" name="calle" value="<%=fila[6]%>" maxlength="30" required>
                        </div>
                        <div class="col-md-6">
                            <label>No. Exterior</label>
                            <input type="text" class="form-control input-sm" name="num" value="<%=fila[7]%>" maxlength="4" onkeypress="return validarNumeros(event)" required>
                        </div>
                    </div>	 
                    <div>  
                        <div class="col-md-6">
                            <label>Colonia</label>
                            <input type="text" class="form-control input-sm" name="colonia" value="<%=fila[8]%>" maxlength="20" required>
                        </div>
                        <div class="col-md-6">
                            <label>Municipio</label>
                            <input type="text" class="form-control input-sm" name="municipio" value="<%=fila[10]%>" maxlength="30" onkeypress="return validarLetras(event)" required>
                        </div>
                    </div>
                    <div>  
                        <div class="col-md-6">
                            <label>Estado</label>
                            <input type="text" class="form-control input-sm" name="estado" value="<%=fila[11]%>" maxlength="30" onkeypress="return validarLetras(event)" required>
                        </div>
                        <div class="col-md-6">
                            <label>Pais</label>
                            <input type="text" class="form-control input-sm" name="pais" value="<%=fila[12]%>" maxlength="30" onkeypress="return validarLetras(event)"required>
                        </div>
                    </div>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Teléfono</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="telefono" value="<%=fila[9]%>" onkeypress="return validarNumeros(event)" required>
                        </div>
                    </div>
                        <input type="hidden" name="foto" value="<%=fila[2]%>">
                        <input type="hidden" name="folio" value="<%=fila[0]%>">
                    <div class="btn-group pull-right">
                        <button type="submit" >Guardar datos</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="piePaciente.jsp"/>