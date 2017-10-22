<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<%@page session="true"%>
<jsp:include page="encabezadoDoctor.jsp"/>
<br><br><br><br><br><br><br><br><br><br><br>
<center><label style="color:red;">Espere procesando...</label></center>
<br><br><br><br><br><br><br><br><br><br><br>
<%
    try 
    {
        if(request.getParameter("nombre") != null)
        {
            
            String nombre = request.getParameter("nombre");
            int cedula = Integer.parseInt(request.getParameter("cedula"));
            int especial = Integer.parseInt(request.getParameter("especial"));
            String curp = request.getParameter("curp");
            String tel = request.getParameter("telefono");
            String nacion = request.getParameter("nacion");
            
            String fecha = request.getParameter("fecha");
            String sexo = request.getParameter("sexo");
            
            String calle = request.getParameter("calle");
            String num = request.getParameter("num");
            String col = request.getParameter("colonia");
            
            String mun = request.getParameter("municipio");
            String edo = request.getParameter("estado");
            String pais = request.getParameter("pais");
            
            String foto = request.getParameter("foto");
            int folio = Integer.parseInt(request.getParameter("folio"));
            String cedAnt = request.getParameter("cedAnt");
            
            conexionBD bd = new conexionBD();
            if (bd.enchufar()) 
            {
             if (bd.ejecutarSentencia("Update doctores set cedula='" + cedula +
                                                        "', nombreDoc='"+ nombre.toUpperCase() +
                                                        "', curpDoc='"+ curp.toUpperCase() +
                                                        "', fotoDoc='"+ foto +
                                                        "', sexoDoc='"+ sexo +
                                                        "', fechaNacDoc='"+ fecha +
                                                        "', nacionalidadDoc='"+ nacion.toUpperCase() +
                                                        "', calle='"+ calle.toUpperCase() +
                                                        "', noExterior='"+ num +
                                                        "', colonia='"+ col.toUpperCase() +
                                                        "', telefono='"+ tel +
                                                        "', municipio='"+ mun.toUpperCase() +
                                                        "', estado='"+ edo.toUpperCase() +
                                                        "', pais='"+ pais.toUpperCase() +
                                                        "', idEspecialidad='"+ especial +
                                                        "' where idDoctor='" + folio + "'")) 
             {
                 ResultSet buscarId;
                 buscarId = bd.buscar("Select idUsuario from usuarios where usuario="+ cedAnt +"");
                 buscarId.next();
                int idUser = buscarId.getInt("idUsuario");
                bd.ejecutarSentencia("Update usuarios set usuario='" + cedula +
                                                    "', contrasena='" + curp.toUpperCase() +
                                                    "' where idUsuario="+ idUser +"");
               %>
                    <script>
                        alertify.success("Editado correctamente");
                        setTimeout("location.href='registros.jsp'", 2000);
                    </script>
               <%
             }
            else
            {
            %>
                <script>
                    alertify.error("Error al editar");
                    setTimeout("location.href='registros.jsp'", 2000);
                </script>
           <%
}
       
            }
        }
                
    } catch (Exception e) 
    {
        %>
        <script>location.href="registros.jsp";</script>
        <%
    }
    
%>
<jsp:include page="pieDoctor.jsp"/>