<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<jsp:include page="encabezado.jsp"/>
<%
    int folio = Integer.parseInt(request.getParameter("folio"));
    int idExp = Integer.parseInt(request.getParameter("expediente"));
    int idCita = Integer.parseInt(request.getParameter("cita"));
%>
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

        <div id="main-wrapper">
            <div class="panel panel-info">
              
                <div class="panel-body">
                    <form action="#">
                        <input type="hidden" name="folio" value="<%=folio%>">
                        <input type="hidden" name="expediente" value="<%=idExp%>">
                        <input type="hidden" name="cita" value="<%=idCita%>">
                    <label class="col-sm-4 control-label"></label>
                    <label class="col-sm-3 control-label" style="color: blue">¿El paciente requiere de algún tratamiento?</label>
                    <div class="col-sm-2">
                        <select class="form-control" name="aprobar" onchange="this.form.submit()" required>
                            <option value="">--Selecciona una opción--</option>
                            <option value="Si">Si</option>
                            <option value="No">No</option>
                        </select>
                    </div>
                    </form>
                </div>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            </div>
        </div>

<%
 if(request.getParameter("aprobar") != null)
 {
    if (request.getParameter("aprobar").equals("Si"))
    {
        %>
        <script>
            setTimeout("location.href='tratamiento.jsp?folio=<%=folio%>&expediente=<%=idExp%>&cita=<%=idCita%>'", 1);
        </script>    
        <%
    }
    else
    {
        %>
        <script>
            setTimeout("location.href='aprobarHospitalizar.jsp?folio=<%=folio%>&expediente=<%=idExp%>&cita=<%=idCita%>'", 1);
        </script>    
        <%
    }
 }
   %>
<jsp:include page="piePagina.jsp"/>