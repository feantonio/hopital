<%@page import="java.util.Calendar"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<jsp:include page="encabezado.jsp"/>
<%  int folio = Integer.parseInt(request.getParameter("folio"));%>
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
                 <div class="container">
                      <br><br>
<br><br><br><br><br><br><br><br><br><br><br>
<center><label style="color:red;">Espere procesando...</label></center>
<br><br><br><br><br><br><br><br><br><br><br>
<%
    try 
    {
        if(request.getParameter("id") != null)
        {
            int id = Integer.parseInt(request.getParameter("id"));
            conexionBD bd = new conexionBD();
            if (bd.enchufar()) 
            {
             if (bd.ejecutarSentencia("Delete from citas where idCita='" + id +"'")) 
             {
               %>
                    <script>
                        alertify.success("Cita cancelada");
                        setTimeout("location.href='agendaCitas.jsp?folio=<%=folio%>'", 2000);
                    </script>
               <%
             }
             bd.desenchufar();
            }
        }
                
    } catch (Exception e) 
    {
        %>
        <script>location.href="agendaCitas.jsp";</script>
        <%
    }
    
%>
<jsp:include page="piePagina.jsp"/>