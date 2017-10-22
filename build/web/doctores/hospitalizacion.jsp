<%@page import="java.util.Calendar"%>
<%@page import="java.text.ParsePosition"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
                    <div>  
                        <div class="col-md-12"> <label style="background: goldenrod"><center>DATOS DE HOSPITALIZACION</center></label></div>
                        <div class="col-md-4">
                            <label>No. cama:</label>
                            <input type="text" class="form-control input-sm" name="cama" required>
                        </div>
                        <div class="col-md-4">
                            <label>Fecha de entrada:</label>
                            <input type="date" class="form-control input-sm" name="entrada" required>
                        </div>
                        <div class="col-md-4">
                            <label>Fecha estimada de salidad:</label>
                            <input type="date" class="form-control input-sm" name="salida" required>
                        </div><br>
                    </div><br><br><br><br><br><br>
                         <div class="btn-group pull-right">
                                <button type="submit" >Finalizar</button>
                            </div>
                    </form>
                </div>
                    <br><br><br><br><br><br><br><br><br><br><br>
            </div>
        </div>
<%
    if (request.getParameter("cama") != null)
    {
       // Calendar c = Calendar.getInstance(); 
        //int dia, mes, annio;
        //dia = c.get(Calendar.DATE);
        //mes = (c.get(Calendar.MONTH)) + 1;
        //annio = c.get(Calendar.YEAR);
        //String fecha = ""+annio+"-"+mes+"-"+dia;

        //SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd"); 
        //Date fechaHoy = sdf.parse(fecha , new ParsePosition(0));
        //Date fechaEn = sdf.parse(request.getParameter("entrada") , new ParsePosition(0));
        //Date fechaSal = sdf.parse(request.getParameter("salida") , new ParsePosition(0));
        
        ResultSet buscar;
        conexionBD conBD = new conexionBD();
        int no=-1;

        if(conBD.enchufar())
        {
            buscar = conBD.buscar("Select noCama from hospitalizacion where noCama='"+ Integer.parseInt(request.getParameter("cama"))
                              +"' and fechaEnt='"+ request.getParameter("entrada") 
                              +"' and fechaSal='"+request.getParameter("salida")+"'");
            
            
            if (buscar.next()){
                no = buscar.getInt("noCama");
                %><script>alert("Cama <%=no%> no disponible");</script><%
            }
            else
            {
                conBD.registrarHospitalizar(Integer.parseInt(request.getParameter("cama")), 
                                            request.getParameter("entrada"), 
                                            request.getParameter("salida"), idExp);
                conBD.ejecutarSentencia("Update citas set estadoCita=" + 1 + " where idCita="+idCita);
                response.sendRedirect("citasMedicas.jsp?folio=" +folio);
            }
        }
    }
%>
<jsp:include page="piePagina.jsp"/>