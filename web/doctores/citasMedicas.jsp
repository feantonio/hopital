<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<jsp:include page="encabezado.jsp"/>
<%int folio = Integer.parseInt(request.getParameter("folio"));%>
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
        <center>               
            <div id="main-wrapper">  

 
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Citas del dia</a></li>
    <li><a href="#tabs-2">Proximas citas</a></li>
    <li><a href="#tabs-3">Citas atendidas</a></li>
  </ul>
    <%
    Calendar c = Calendar.getInstance(); 
    int idDoc=-1, hrs, min, seg, dia, mes, annio;
    dia = c.get(Calendar.DATE);
    mes = (c.get(Calendar.MONTH)) + 1;
    annio = c.get(Calendar.YEAR);
    String fecha = ""+annio+"-"+mes+"-"+dia;

    hrs = c.get(Calendar.HOUR_OF_DAY);
    min = c.get(Calendar.MINUTE);
    seg = c.get(Calendar.SECOND);
    String hora = ""+hrs+":"+min+":"+seg;
    %>
  <div id="tabs-1">
      <p style="color: red">FECHA: <%=fecha%></p>
    <table class="bordered-table zebra-striped" id="registro">
                <thead>
                <th>No</th>
                <th>Hora</th>
                <th>Nombre del paciente</th>
                <th>Estado</th>

                <th>Atender</th>
                </thead>
                <tbody>
                    <%
                        conexionBD bd = new conexionBD();
                        Object[] fila = new Object[5];
                        Object[] docfila = new Object[2];
                        ResultSet respuesta, doc, paciente, idDoctor;
                        String nomPaciente, estado="", color="";
                        
                        if (bd.enchufar()) 
                        {    
                                idDoctor = bd.buscar("Select idDoctor from doctores where cedula=" + folio);
                                idDoctor.next();
                                idDoc = idDoctor.getInt("idDoctor");
                                
                                respuesta = bd.buscar("Select *from citas where fechaCita='"+ fecha +"' and idDoctor= '" + idDoc + "'");
                                while (respuesta.next()) 
                                {
                                    fila[0] = respuesta.getInt("idCita");
                                    fila[1] = respuesta.getString("fechaCita");
                                    fila[2] = respuesta.getString("horaCita");
                                    fila[3] = respuesta.getInt("estadoCita");
                                     if(fila[3].equals(0))
                                    {
                                        estado = "Pendiente";
                                        color = "Red";
                                    }
                                    else if (fila[3].equals(1))
                                    {
                                        estado = "Atendido";
                                        color = "Blue";
                                    }
                                    fila[4] = respuesta.getInt("folio");
                                  
                                    paciente = bd.buscar("Select nombrePac from pacientes where folio="+ fila[4]);
                                    paciente.next();
                                    nomPaciente = paciente.getString("nombrePac");
                                    %>
                                    <tr>
                                        <td><%=fila[0]%></td>
                                        <td><%=fila[2]%></td>
                                        <td><%=nomPaciente%></td>
                                        <td style="color: <%=color%>"><%=estado%></td>
                                        <td><%
                                            if(fila[3].equals(0)){%>
                                           <a class='btn btn-default' title='Atender' onclick="location.href = 'generaExpediente.jsp?folio=<%=folio%>&fecha=<%=fecha%>&hora=<%=fila[2]%>&idCita=<%=fila[0]%>&idPaciente=<%=fila[4]%>&nombrePac=<%=nomPaciente%>'"><i class="glyphicon glyphicon-hand-up"></i></a> 
                                           <%}
                                           else
                                            {%>
                                            <a class='btn btn-default' title='Ver expediente' onclick="location.href = '#'"><i class="glyphicon glyphicon-print"></i></a> 
                                           <%}%>
                                        </td>
                                    </tr>
                                    <%
                                }
                        }
                    %>
                </tbody>
            </table>
  </div>
    
    
  <div id="tabs-2">
   
  </div>
    
    
  <div id="tabs-3">

  </div>
</div>
<jsp:include page="piePagina.jsp"/>
 