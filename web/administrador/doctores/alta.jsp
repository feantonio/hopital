<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>    
 <%
                        conexionBD bd = new conexionBD();
                        String tabla = "especialidades";
                        Object[] fila = new Object[2];
                        ResultSet respuesta;
                        if (bd.enchufar()) 
                        {
 %>
		  <div class="modal-body">
                      <form class="form-horizontal" action="#">
                        <div class="form-group">
				<label class="col-sm-2 control-label">Nombre</label>
				<div class="col-sm-10">
                                    <input type="text" class="form-control" name="nombre" placeholder="Nombre del doctor" maxlength="30" onkeypress="return validarLetras(event)" required>
				</div>
			 </div>
                          <div class="form-group">
				<label class="col-sm-2 control-label">Cedula</label>
				<div class="col-sm-10">
                                    <input type="text" class="form-control" name="cedula" placeholder="Cedula profesional" maxlength="8" onkeypress="return validarNumeros(event)" required>
				</div>
			 </div>
                         <div class="form-group">
                             <label class="col-sm-2 control-label">CURP</label>
                             <div class="col-sm-10">
                                 <input type="text" class="form-control" name="curp" placeholder="Clave Única de Registro" maxlength="18" required>
                             </div>
                       </div>
                          
                          <div>    
                                <div class="col-md-6">
                                    <label>Especialidad</label>
                                    <select class="form-control" name="especialidad" onchange="mostrarOcultar(this)"required>
					<option value="">-- Selecciona especialidad --</option>
                                        <%
                                        if (bd.ver(tabla) != null) {
                                        respuesta = bd.ver(tabla);
                                        while (respuesta.next()) {
                                            fila[0] = respuesta.getInt("idEspecialidad");
                                            fila[1] = respuesta.getString("nombreEsp");
                                            %>
                                        <option value="<%=fila[0]%>"><%=fila[1]%></option>
                                            <%
                                        }
                                        }
                                            %>
                                    <option value="Otro">Otro</option>
                                    </select>
                                  <script>
                                    function mostrarOcultar(datoSeleccionado)
                                    {
                                            var dato = datoSeleccionado.value;

                                            if(dato == "Otro")
                                            {
                                                    var mostrarDiv = document.getElementById("nuevaEspecialidad");
                                                    mostrarDiv.style.display = "block";
                                            }
                                            else
                                            {
                                                    var mostrarDiv = document.getElementById("nuevaEspecialidad");
                                                    mostrarDiv.style.display = "none";
                                            }

                                    }
                                </script>
                                </div>
                                  
                                  <div id="nuevaEspecialidad" style="display:none">  
                                    <br><br><br><br>
                                      <label style="color:blue;">****************INGRESE LOS DATOS DE LA NUEVA ESPECIALIDAD*****************</label>
                                    <div class="col-md-6">
                                        <label style="color:orange;">Especialidad</label>
                                        <input type="text" class="form-control input-sm" name="esp" value="" placeholder="Nombre de la nueva especialidad" maxlength="30" onkeypress="return validarLetras(event)">
                                    </div>
                                    <div class="col-md-6">
                                        <label style="color:orange;">Costo</label>
                                        <input type="text" class="form-control input-sm" name="costo" value="" placeholder="Costo sugerido" maxlength="7" onkeypress="return validarPrecios(event)">
                                    </div>
                                      <label style="color:blue;">*************************************************************************</label>
                                </div>
                                  
                                  
                                  
                                <div class="col-md-6">
                                      <label>Telefono</label>
                                    <input type="text" class="form-control input-sm" name="telefono" placeholder="Telefono fijo" maxlength="10" onkeypress="return validarNumeros(event)" required>
				</div>
			</div>
                          
			<div>  
				  <div class="col-md-6">
                                      <label>Fecha de nacimiento</label>
                                      <input type="date" class="form-control input-sm" data-format="dd-mm-yyyy" name="fecha" id="datepicker" required>
				  </div>
                                <div class="col-md-6">
                                    <label>Sexo</label>
                                    <select class="form-control" name="sexo" required>
					<option value="">-- Selecciona un género --</option>
					<option value="H">Hombre</option>
					<option value="M">Mujer</option>
                                        <option value="O">Otro</option>
				  </select>
                                </div>
			</div>
                       <div>  
				  <div class="col-md-6">
                                      <label>Calle</label>
                                    <input type="text" class="form-control input-sm" name="calle" placeholder="Calle" maxlength="30" required>
				  </div>
                                <div class="col-md-6">
                                    <label>No. Exterior</label>
                                    <input type="text" class="form-control input-sm" name="num" placeholder="Num. exterior" maxlength="4" required>
                                </div>
			</div>	 
                          <div>  
				  <div class="col-md-6">
                                      <label>Colonia</label>
                                    <input type="text" class="form-control input-sm" name="colonia" placeholder="Colonia" maxlength="20" required>
				  </div>
                                <div class="col-md-6">
                                    <label>Municipio</label>
                                    <input type="text" class="form-control input-sm" name="municipio" placeholder="Municipio" maxlength="30" onkeypress="return validarLetras(event)" required>
                                </div>
			</div>
                        <div>  
				  <div class="col-md-6">
                                      <label>Estado</label>
                                      <input type="text" class="form-control input-sm" name="estado" placeholder="Estado" maxlength="30" onkeypress="return validarLetras(event)" required>
				  </div>
                                <div class="col-md-6">
                                    <label>Pais</label>
                                    <input type="text" class="form-control input-sm" name="pais" placeholder="País de procedencia" maxlength="30" onkeypress="return validarLetras(event)"required>
                                </div>
			</div>
                          <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

                          <div class="form-group">
				<label class="col-sm-2 control-label">Nacionalidad</label>
				<div class="col-sm-10">
                                    <input type="text" class="form-control" name="nacion" placeholder="Nacionalidad" maxlength="30" onkeypress="return validarLetras()(event)" required>
				</div>
			 </div>
                       
                          <input type="hidden" name="foto" value="">
		  <div class="btn-group pull-right">
                      <button type="reset" >Limpiar</button>
                      <button type="submit" >Guardar datos</button>
		  </div>
		  </form>
                </div>
                        
                  
 <%
                        }
                        bd.desenchufar();
    if (request.getParameter("nombre")!= null) 
    {
       conexionBD conBD = new conexionBD();
       int idEsp;

            if(conBD.enchufar())
            {
                if (request.getParameter("especialidad").equals("Otro"))
                {
                   conBD.registrarEspecialidad(request.getParameter("esp"), Double.parseDouble(request.getParameter("costo")));
                    ResultSet buscarId;
                    buscarId = conBD.buscar("Select idEspecialidad from especialidades where nombreEsp='"+ request.getParameter("esp") +"'");
                    buscarId.next();
                    idEsp = buscarId.getInt("idEspecialidad");
                    if(conBD.registrarDoctor(Integer.parseInt(request.getParameter("cedula")), request.getParameter("nombre"), 
                                                         request.getParameter("curp"), request.getParameter("foto"), 
                                                         request.getParameter("sexo"), request.getParameter("fecha"), 
                                                         request.getParameter("nacion"), request.getParameter("calle"), 
                                                         request.getParameter("num"), request.getParameter("colonia"), 
                                                         request.getParameter("telefono"), request.getParameter("municipio"), 
                                                         request.getParameter("estado"), request.getParameter("pais"), idEsp))
                    {
                        conBD.registrarUsuario(request.getParameter("cedula"), request.getParameter("curp"), 2);
                         %>
                         <script>
                             alertify.success("Registro exitoso");
                             setTimeout("location.href='registros.jsp'", 2000);
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
                else
                {
                    if(conBD.registrarDoctor(Integer.parseInt(request.getParameter("cedula")), request.getParameter("nombre"), 
                                                         request.getParameter("curp"), request.getParameter("foto"), 
                                                         request.getParameter("sexo"), request.getParameter("fecha"), 
                                                         request.getParameter("nacion"), request.getParameter("calle"), 
                                                         request.getParameter("num"), request.getParameter("colonia"), 
                                                         request.getParameter("telefono"), request.getParameter("municipio"), 
                                                         request.getParameter("estado"), request.getParameter("pais"), 
                                                        Integer.parseInt(request.getParameter("especialidad"))))
                    {
                        conBD.registrarUsuario(request.getParameter("cedula"), request.getParameter("curp").toUpperCase(), 2);
                         %>
                         <script>
                             alertify.success("Registro exitoso");
                             setTimeout("location.href='registros.jsp'", 2000);
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
             else
             {
                   %>
              <script>
                  alertify.error("Error al conectarse");
              </script>    
              <%
             }
    }

%>
