<%@page import="java.util.Calendar"%>
<%@page import="modelo.conexionBD"%>
<%@page import="java.sql.ResultSet"%>
<jsp:include page="encabezado.jsp"/>
<%int folio = Integer.parseInt(request.getParameter("folio"));%>
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
<div>
    <div class="panel panel-info">
        <div class="panel-heading">
            <div class="btn-group pull-right">
                <button type='button' onclick=" location.href='calendarioCita.jsp?folio=<%=folio%>' "><span class="glyphicon glyphicon-plus" ></span> Nueva cita</button>
            </div>
            <h4><i class='glyphicon glyphicon-list'></i> Citas agendadas</h4>
        </div>
        <div class="panel-body">
            <table class="bordered-table zebra-striped" id="registro">
                <thead>
                <th>No</th>
                <th>Fecha</th>
                <th>Hora</th>
                <th>Área</th>
                <th>Doctor</th>
                <th>Estado</th>

                <th>Acciones</th>
                </thead>
                <tbody>
                    <%
                        conexionBD bd = new conexionBD();
                        Object[] fila = new Object[6];
                        Object[] docfila = new Object[2];
                        ResultSet respuesta, doc, especial;
                        String especialidad, estado="", color="";
                        if (bd.enchufar()) 
                        {    
                                respuesta = bd.buscar("Select *from citas where folio= '" + folio + "'");
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
                                    fila[5] = respuesta.getInt("idDoctor");
                                
                                    doc = bd.buscar("Select nombreDoc, idEspecialidad from doctores where idDoctor="+ fila[5]);
                                    while(doc.next())
                                    {
                                        docfila[0] = doc.getString("nombreDoc");
                                        docfila[1] = doc.getString("idEspecialidad");
                                    }
                                     especial = bd.buscar("Select nombreEsp from especialidades where idEspecialidad="+ docfila[1]);
                                     especial.next();
                                     especialidad = especial.getString("nombreEsp");
                                    %>
                                    <tr>
                                        <td><%=fila[0]%></td>
                                        <td><%=fila[1]%></td>
                                        <td><%=fila[2]%></td>
                                        <td><%=especialidad%></td>
                                        <td><%=docfila[0]%></td>
                                        <td style="color:<%=color%>;"><%=estado%></td>
                                        <td> <%
                                            if(fila[3].equals(0))
                                            {%>
                                            <a href="eliminarCita.jsp?id=<%=fila[0]%>&&folio=<%=folio%>" class='btn btn-default' title='Cancelar cita' ><i class="glyphicon glyphicon-trash"></i> </a>  
                                               <form action="/hospital/comprobante_cita" name="form1">
                                                    <a href="javascript:document.form1.submit()" class='btn btn-default' title='Imprimir comprobante'/> <i class="glyphicon glyphicon-print"></i> </a>
                                                    <input type="hidden" name="fecha" value="<%=fila[1]%>">
                                                </form> 
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
    </div>
</div><br><br><br><br><br><br>

    <jsp:include page="piePagina.jsp"/>