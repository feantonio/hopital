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
                        <div class="col-md-12"> <label style="background: goldenrod"><center>DATOS DEL TRATAMIENTO</center></label></div>
                        <div class="col-md-4">
                            <label>Medicamento:</label>
                            <input type="text" class="form-control input-sm" name="medicina" maxlength="30" required>
                        </div>
                        <div class="col-md-4">
                            <label>Dosis:</label>
                            <input type="text" class="form-control input-sm" name="dosis" maxlength="50" required>
                        </div>
                        <div class="col-md-4">
                            <label>Duración:</label>
                            <input type="text" class="form-control input-sm" name="duracion" maxlength="10" required>
                        </div><br><br><br><br><br><br>
                      
                         <div class="btn-group pull-right">
                                <button type="submit" onclick=" location.href='aprobarHospitalizar.jsp?folio=<%=folio%>&expediente=<%=idExp%>&cita=<%=idCita%>'">Terminar</button>
                                <button type="submit" >Anexar</button>
                            </div>
                    </form>
                        
                        
                </div>
                <br><br><br><br><br><br><br><br><br><br><br>
            </div>
        </div>
<%  
     
    if(request.getParameter("medicina") != null)
    {
        conexionBD conBD = new conexionBD();
        if(conBD.enchufar())
        {
            if(conBD.registrarTratamiento(request.getParameter("medicina"), request.getParameter("dosis"), 
                                       request.getParameter("duracion"), idExp))
            {
                %>
                <script>
                    alert("Tratamiento registado");
                </script>    
                <%
               //response.sendRedirect("tratamiento.jsp?folio=" +folio+ "&expediente="+idExp);
            }
            else
            {
                %>
                <script>
                    alert("Error verifique los datos");
                </script>   
                <%
            }
        }
    }
%>
<jsp:include page="piePagina.jsp"/>