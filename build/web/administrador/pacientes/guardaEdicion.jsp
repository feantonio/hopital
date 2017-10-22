<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<%@page session="true"%>
<jsp:include page="encabezadoPaciente.jsp"/>
<br><br><br><br><br><br><br><br><br><br><br>
<center><label style="color:red;">Espere procesando...</label></center>
<br><br><br><br><br><br><br><br><br><br><br>
<%
    try 
    {
        if(request.getParameter("nombre") != null)
        {
            String nombre = request.getParameter("nombre");
            String curp = request.getParameter("curp");
            String fecha = request.getParameter("fecha");
            String sexo = request.getParameter("sexo");
            
            String calle = request.getParameter("calle");
            String num = request.getParameter("num");
            String col = request.getParameter("colonia");
            
            String mun = request.getParameter("municipio");
            String edo = request.getParameter("estado");
            String pais = request.getParameter("pais");
            String tel = request.getParameter("telefono");
            
            String foto = request.getParameter("foto");
            int folio = Integer.parseInt(request.getParameter("folio"));
            
            conexionBD bd = new conexionBD();
            ResultSet buscarId;
            if (bd.enchufar()) 
            {
             if (bd.ejecutarSentencia("Update pacientes set nombrePac='" + nombre.toUpperCase() + 
                                                        "', fotoPac='"+ foto +
                                                        "', fechaNacPac='"+ fecha +
                                                        "', sexoPac='"+ sexo +
                                                        "', curpPac='"+ curp.toUpperCase() +
                                                        "', calle='"+ calle.toUpperCase() +
                                                        "', noExterior='"+ num +
                                                        "', colonia='"+ col.toUpperCase() +
                                                        "', telefono='"+ tel +
                                                        "', municipio='"+ mun.toUpperCase() +
                                                        "', estado='"+ edo.toUpperCase() +
                                                        "', pais='"+ pais.toUpperCase() +
                                                        "' where folio='" + folio + "'")) 
             {
                buscarId = bd.buscar("Select idUsuario from usuarios where usuario='"+ folio +"'");
                buscarId.next();
                int idUser = buscarId.getInt("idUsuario");
                bd.ejecutarSentencia("Update usuarios set contrasena='"+ curp.toUpperCase() +
                        "' where idUsuario='"+ idUser +"'");
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
                bd.desenchufar();
        }
                
    } catch (Exception e) 
    {
        %>
        <script>location.href="registros.jsp";</script>
        <%
    }
    
%>
<jsp:include page="piePaciente.jsp"/>