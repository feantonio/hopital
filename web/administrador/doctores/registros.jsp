<%@page import="modelo.conexionBD"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE HTML>
<jsp:include page="encabezadoDoctor.jsp"/>
<div>
    <div class="">
        <div class="panel-heading">
            <div class="btn-group pull-right">
                <button type='button' id="nuevo"><span class="glyphicon glyphicon-plus" ></span> Nuevo doctor</button>
            </div>
            <h4><i class='glyphicon glyphicon-list'></i> Registro de doctores</h4>
        </div>
        <div class="panel-body">
            <table class="bordered-table zebra-striped" id="registro">
                <thead>

                <th>Cedula</th>
                <th>Nombre</th>
                <th>CURP</th>
                <th>Especilidad</th>
                
                <th>Foto</th>
                <th>Sexo</th>
                <th>Nacimiento</th>
                <th>Nacionalidad</th>
                
                <th>Calle</th>
                <th>No.Ext</th>
                <th>Colonia</th>
                <th>Telefono</th>
                <th>Municipio</th>
                <th>Estado</th>
                <th>Pais</th>
                
                <th>Acciones</th>
                </thead>
                <tbody>
                    <%
                        conexionBD bd = new conexionBD();
                        String tabla = "doctores";
                        Object[] fila = new Object[16];
                        Object[] especialidad = new Object[2];
                        ResultSet respuesta, busqueda;
                        if (bd.enchufar()) {
                            if (bd.ver(tabla) != null) {
                                respuesta = bd.ver(tabla);
                                while (respuesta.next()) {
                                    fila[0] = respuesta.getInt("idDoctor");
                                    fila[1] = respuesta.getInt("cedula");
                                    fila[2] = respuesta.getString("nombreDoc");
                                    fila[3] = respuesta.getString("curpDoc");
                                   
                                    fila[4] = respuesta.getString("fotoDoc");
                                    fila[5] = respuesta.getString("sexoDoc");
                                    fila[6] = respuesta.getString("fechaNacDoc");
                                    fila[7] = respuesta.getString("nacionalidadDoc");
                                    
                                    fila[8] = respuesta.getString("calle");
                                    fila[9] = respuesta.getString("noExterior");
                                    fila[10] = respuesta.getString("colonia");
                                    fila[11] = respuesta.getString("telefono");
                                    fila[12] = respuesta.getString("municipio");
                                    fila[13] = respuesta.getString("estado");
                                    fila[14] = respuesta.getString("pais");
                                    fila[15] = respuesta.getInt("idEspecialidad");
                                    
                                    busqueda = bd.buscar("Select *from especialidades where idEspecialidad='"+ fila[15] +"'");
                                    busqueda.next();
                                    especialidad[0] = busqueda.getInt("idEspecialidad");
                                    especialidad[1] = busqueda.getString("nombreEsp");
                                    

                    %>
                    <tr>
                        <td><%=fila[1]%></td>
                        <td><%=fila[2]%></td>
                        <td><%=fila[3]%></td>
                        <td><%=especialidad[1]%></td>
                        <td><img src="../../doctores/fotos/<%=fila[4]%>" alt="10" width="50"></td>
                        <td><%=fila[5]%></td>
                        <td><%=fila[6]%></td>
                        <td><%=fila[7]%></td>
                        <td><%=fila[8]%></td>
                        <td><%=fila[9]%></td>
                        <td><%=fila[10]%></td>
                        <td><%=fila[11]%></td>
                        <td><%=fila[12]%></td>
                        <td><%=fila[13]%></td>
                        <td><%=fila[14]%></td>
                        <td>
                            <a class='btn btn-default' title='Editar' onclick="location.href = 'editar.jsp?folio=<%=fila[0]%>'"><i class="glyphicon glyphicon-edit"></i></a> 
                            <a href="#" class='btn btn-default' title='Borrar' onclick="elimina(<%=fila[0]%>)"><i class="glyphicon glyphicon-trash"></i> </a>
                        </td>

                    </tr>
                    <%
                                }
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div><br><br><br><br><br><br>
<div id="alta">
    <jsp:include page="alta.jsp"/>  
</div>
    <jsp:include page="pieDoctor.jsp"/>