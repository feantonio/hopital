<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<jsp:include page="encabezado.jsp"/>
<%
    int folio = Integer.parseInt(request.getParameter("folio"));
    String fecha = request.getParameter("fecha");
    String hora = request.getParameter("hora");
    int idCita = Integer.parseInt(request.getParameter("idCita"));
    int idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
    String nombrePac = request.getParameter("nombrePac");

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
                    <div style="background: violet">
                        <div><center>
                                <div class="col-md-2">
                                    <label>Folio: </label><label style="color: red"><%=idPaciente%></label>                            
                                </div>
                                <div class="col-md-4">
                                    <label>Nombre del paciente: </label><label style="color: red"><%=nombrePac%></label>                            
                                </div>
                                <div class="col-md-3">
                                    <label>Fecha de la cita: </label><label style="color: red"><%=fecha%></label>
                                </div></center>
                            <div class="col-md-3">
                                <label>Hora de la cita: </label><label style="color: red"><%=hora%></label>
                            </div></center>
                        </div><br><br>
                    </div>
                            <form action="#">
                                <input type="hidden" name="folio" value="<%=folio%>">
                                <input type="hidden" name="fecha" value="<%=fecha%>">
                                <input type="hidden" name="hora" value="<%=hora%>">
                                <input type="hidden" name="idCita" value="<%=idCita%>">
                                <input type="hidden" name="idPaciente" value="<%=idPaciente%>">
                                <input type="hidden" name="nombrePac" value="<%=nombrePac%>">
                            <div class="col-md-3">
                                <label>Peso:</label>
                                <input type="text" class="form-control input-sm" name="peso" maxlength="7" onkeypress="return validarDecimal(event)" required>
                            </div>
                            <div class="col-md-3">
                                <label>Talla:</label>
                                <input type="text" class="form-control input-sm" name="talla" maxlength="4" onkeypress="return validarDecimal(event)" required>
                            </div>
                            <div class="col-md-3">
                                <label>Tipo de sangre:</label>
                                <select class="form-control" name="sangre" required>
                                    <option value="">--Selecciona grupo sanguineo--</option>
                                    <option value="A+">A+</option>
                                    <option value="A-">A-</option>
                                    <option value="B+">B+</option>
                                    <option value="B-">B-</option>
                                    <option value="O+">O+</option>
                                    <option value="O-">O-</option>
                                    <option value="R+">R+</option>
                                    <option value="R-">R-</option>
                                    <option value="AB+">AB+</option>
                                    <option value="AB-">AB-</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label>Temperatura:</label>
                                <input type="text" class="form-control input-sm" name="temperatura" maxlength="7" onkeypress="return validarDecimal(event)" required>
                            </div><br>



                            <div class="col-md-4">
                                <label>Sintomas:</label>
                                <input type="text" class="form-control input-sm" name="sintoma" maxlength="30" onkeypress="return validarLetras(event)" required>
                            </div>
                            <div class="col-md-4">
                                <label>Descripcion del sintoma:</label>
                                <textarea class="form-control" name="desSin"  maxlength="100" onkeypress="return validarLetras(event)" required></textarea>
                            </div>
                            <div class="col-md-4">
                                <label>Diagnóstico:</label>
                                <textarea class="form-control" name="diagnostico"   maxlength="50" onkeypress="return validarLetras(event)"required></textarea>
                            </div><br><br><br><br><br><br><br><br><br><br><br><br>


                            <div>
                                <label class="col-sm-4 control-label"></label>
                                <label class="col-sm-3 control-label" style="color: blue">¿El paciente presenta alguna alergia?</label>
                                <div class="col-sm-2">
                                    <select class="form-control" name="ale" onchange="mostrarAlergia(this)" required>
                                        <option value="">--Selecciona una opción--</option>
                                        <option value="Si">Si</option>
                                        <option value="No">No</option>
                                    </select>
                                    <script>
                                    function mostrarAlergia(datoSeleccionado)
                                    {
                                            var dato = datoSeleccionado.value;

                                            if(dato == "Si")
                                            {
                                                    var mostrarDiv = document.getElementById("agregaAlergia");
                                                    mostrarDiv.style.display = "block";
                                            }
                                            else
                                            {
                                                    var mostrarDiv = document.getElementById("agregaAlergia");
                                                    mostrarDiv.style.display = "none";
                                            }

                                    }
                                    </script>
                                </div>
                            </div><br><br><br>

                            <div id="agregaAlergia" style="display:none">  
                                <div class="col-md-12"> <label style="background: goldenrod"><center>DATOS DE LA ALERGIA</center></label></div>
                                <div class="col-md-6">
                                    <label>Nombre de la alergia:</label>
                                    <input type="text" class="form-control input-sm" name="alergia" maxlength="30" onkeypress="return validarLetras(event)">
                                </div>
                                <div class="col-md-6">
                                    <label>Descripción de la alergia:</label>
                                    <textarea class="form-control" name="desAle"   maxlength="100" onkeypress="return validarLetras(event)"></textarea>
                                </div><br><br><br><br><br><br><br><br><br><br><br>
                            </div>
                            
                            <div class="btn-group pull-right">
                                <button type="reset" >Limpiar</button>
                                <button type="submit" >Continuar</button>
                            </div>
                    </form>
                </div>
            </div>
        </div>
<%
    if (request.getParameter("sintoma")!= null) 
    {
       conexionBD conBD = new conexionBD();
       int idExp;

            if(conBD.enchufar())
            {
                    if(conBD.registrarExpediente(fecha, Double.parseDouble(request.getParameter("peso")),
                                                        Double.parseDouble(request.getParameter("talla")), 
                                                        Double.parseDouble(request.getParameter("temperatura")),
                                                        request.getParameter("sangre"), idPaciente, idCita))
                    { 
                        ResultSet buscarExpediente;
                        buscarExpediente = conBD.buscar("Select idExpediente from expediente where folio='"+ idPaciente +"' and idCita='"+ idCita +"'");
                        buscarExpediente.next();
                        idExp = buscarExpediente.getInt("idExpediente");
                        
                        conBD.registrarSintomas(request.getParameter("sintoma"), request.getParameter("desSin"),
                                                request.getParameter("diagnostico"), idExp);
                        
                        if (request.getParameter("ale").equals("Si"))
                        {
                          conBD.registrarAlergias(request.getParameter("alergia"), request.getParameter("desAle"), idPaciente);
                        }
                         %>
                         <script>
                             alertify.success("Datos cargados correctamente");
                             setTimeout("location.href='aprobarTratamiento.jsp?folio=<%=folio%>&expediente=<%=idExp%>&cita=<%=idCita%>'", 2000);
                         </script>    
                         <%
                      conBD.desenchufar();
                     }
                     else
                     {
                          %>
                         <script>
                             alertify.error("Error verifique los datos");
                             setTimeout("location.href='generaExpediente.jsp?folio=<%=folio%>$fecha=<%=fecha%>$idCita=<%=idCita%>$idPaciente=<%=idPaciente%>$nombrePac=<%=nombrePac%>", 2000);
                         </script>    
                         <%
                     }
             }      
    }
%>
<jsp:include page="piePagina.jsp"/>