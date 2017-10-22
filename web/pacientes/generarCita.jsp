<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="modelo.conexionBD"%>
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
                 <div class="container">
                      <br><br>
<%
String fecha = request.getParameter("fecha");
int idEsp = Integer.parseInt(request.getParameter("especialidad"));
String temporal = request.getParameter("doctor");
String nombreEspecial="";
String[] segFecha = fecha.split("-");
int d, m ,a;
a = Integer.parseInt(segFecha[0]);
m = Integer.parseInt(segFecha[1]);
d = Integer.parseInt(segFecha[2]);

Calendar c = Calendar.getInstance();
int dia, mes, annio;
dia = c.get(Calendar.DATE);
mes = (c.get(Calendar.MONTH)) + 1;
annio = c.get(Calendar.YEAR);

if(a != annio)
{
    %>
        <br><br><br><br><br><br><br><br>
           <center>
               <label style="color:red;">¡Fecha extemporanea!</label><br>
               <a href="calendarioCita.jsp?folio=<%=folio%>">Regresar al calendario</a>
           </center>
        <br><br><br><br><br><br><br><br><br><br>
     <%
}
else
{
    if(m < mes)
    {
        %>
         <br><br><br><br><br><br><br><br>
               <center>
                   <label style="color:red;">¡Fecha extemporanea!</label><br>
                   <a href="calendarioCita.jsp?folio=<%=folio%>">Regresar al calendario</a>
               </center>
        <br><br><br><br><br><br><br><br><br><br>
         <%
    }
    else
    {
        if(d < dia)
        {
            %>
            <br><br><br><br><br><br><br><br>
               <center>
                   <label style="color:red;">¡Fecha extemporanea!</label><br>
                   <a href="calendarioCita.jsp?folio=<%=folio%>">Regresar al calendario</a>
               </center>
            <br><br><br><br><br><br><br><br><br><br>
            <%     
        }
        else
        {
            conexionBD conBD = new conexionBD();
            conBD.enchufar();
            ResultSet respuesta, buscar, especial, disponible;
            especial = conBD.buscar("Select nombreEsp from especialidades where idEspecialidad='"+ idEsp +"'");
            if(especial.next())
              nombreEspecial = especial.getString("nombreEsp");
          %>  
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4><i class='glyphicon glyphicon-edit'></i>Generar cita</h4>
                </div>
                <div class="panel-body">
                    <div class="modal-body">
                        <form class="form-horizontal" action="#">
                            <input type="hidden" name="folio" value="<%=folio%>">
                                    <div>
                                            <div class="col-md-6">
                                            <center><label>Especialidad del doctor</label></center>
                                            <select class="form-control" name="especialidad" onchange="this.form.submit()">
                                                <option value="<%=idEsp%>"><%=nombreEspecial%></option>
                                                <%
                                                String tabla = "especialidades";
                                                Object[] fila = new Object[2];
                                                if (conBD.ver(tabla) != null) 
                                                {
                                                    respuesta = conBD.ver(tabla);
                                                    while (respuesta.next()) 
                                                    {
                                                        fila[0] = respuesta.getInt("idEspecialidad");
                                                        fila[1] = respuesta.getString("nombreEsp");
                                                        %>
                                                        <option value="<%=fila[0]%>"><%=fila[1]%></option>
                                                        <%
                                                    }
                                                }
                                                    %>

                                            </select>
                                        </div>
                                             
                                        <div class="col-md-6">
                                            <center><label>Doctores</label></center>
                                            <select class="form-control" name="doctor" required>
                                                <option value="">-- Seleccione --</option>
                                                <%
                                                    Object[] doc = new Object[2];
                                                    buscar = conBD.buscar("Select idDoctor, nombreDoc from doctores where idEspecialidad='"+ idEsp +"'");
                                                    while (buscar.next()) {
                                                        doc[0] = buscar.getInt("idDoctor");
                                                        doc[1] = buscar.getString("nombreDoc");
                                                        %>
                                                    <option value="<%=doc[0]%>"><%=doc[1]%></option>
                                                        <%
                                                    }
                                                    %>
                                            </select>
                                        </div>
                                    </div>
                                <table style="width:100%; padding:5px;">
                                    <tr>
                                        <td>
                                           <center><label>Fecha para la cita médica</label></center>
                                            <input type="text" name="fecha" value="<%=fecha%>" class="form-control input-sm" readonly="true" style="margin-bottom:12px; width:95%; padding: .4em;">
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <label>Hora</label>
                                            <select name="hora" class="form-control" style="margin-bottom:12px; width:95%; padding: .4em;">
                                                <option value="">- -</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                                <option value="16">16</option>
                                                <option value="17">17</option>

                                            </select>				
                                        </td>
                                        <td>
                                            <label>Minuto</label>
                                            <select name="min" class="form-control" style="margin-bottom:12px; width:95%; padding: .4em;">
                                                <option value="">- -</option>
                                                <option value="00">00</option>
                                                <option value="15">15</option>
                                                <option value="30">30</option>
                                                <option value="45">45</option>
                                            </select>				
                                        </td>
                                    </tr>

                                </table>
                            <div class="btn-group pull-right">
                                <button type="submit" onclick="location.href='calendarioCita.jsp?folio=<%=folio%>'">Atrás</button>
                                <button type="submit" >Guardar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%
            if (temporal != "") 
            {
                String hora=""+ request.getParameter("hora") +":"+ request.getParameter("min") +":00";
                disponible = conBD.buscar("Select horaCita from citas where fechaCita='"+ request.getParameter("fecha") +
                                                                     "' and horaCita='"+ hora +
                                                                     "' and idDoctor="+ Integer.parseInt(request.getParameter("doctor")));
                if(disponible.next())
                {
                    String x="";
                    %>
                    <script>
                        alertify.error("Horario no disponible");
                        setTimeout("location.href='generarCita.jsp?folio=<%=folio%>&&fecha=<%=fecha%>&&especialidad=<%=idEsp%>&&doctor=<%=x%>'", 2000);
                    </script>    
                    <%  
                }
                else
                {
                    if(conBD.registrarCita(request.getParameter("fecha"), hora, 0, folio, Integer.parseInt(request.getParameter("doctor"))))
                    {
                         %>
                         <script>
                             alertify.success("Cita médica aceptada");
                             setTimeout("location.href='agendaCitas.jsp?folio=<%=folio%>'", 2000);
                         </script>    
                         <%
                      conBD.desenchufar();
                     }
                     else
                     {
                          %>
                         <script>
                             alertify.error("Error al registrar verifique datos");
                         </script>    
                         <%
                     }
                }
            }
      }
    }   
}
%>
<jsp:include page="piePagina.jsp"/>