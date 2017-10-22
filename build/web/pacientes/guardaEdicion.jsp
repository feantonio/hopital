<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<%@page session="true"%>
<%int folio = Integer.parseInt(request.getParameter("folio"));%>
<jsp:include page="encabezado.jsp"/>
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
               <br><br><br><br><br><br><br><br><br><br><br>
               <center><label style="color:red;">Espere procesando...</label></center>
               <br><br><br><br><br><br><br><br><br><br><br>
<div class="container">
    <div class="panel panel-info">

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
                                                        "', pais='"+ pais.toUpperCase()+ 
                                                        "' where folio='" + folio + "'")) 
             {
                buscarId = bd.buscar("Select idUsuario from usuarios where usuario='"+ folio +"'");
                buscarId.next();
                int idUser = buscarId.getInt("idUsuario");
                bd.ejecutarSentencia("Update usuarios set contrasena='"+ curp.toUpperCase() +
                        "' where idUsuario='"+ idUser +"'");
               %>
                    <script>
                        alertify.success("Datos editados correctamente");
                        setTimeout("location.href='datosPersonales.jsp?folio=<%=folio%>'", 2000);
                    </script>
               <%
             }
            else
            {
            %>
                <script>
                    alertify.error("Error al editar");
                    setTimeout("location.href='datosPersonales.jsp?folio=<%=folio%>'", 2000);
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
  </div>
    </div>
</div>
<jsp:include page="piePagina.jsp"/>