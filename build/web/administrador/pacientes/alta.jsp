<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>        
		  <div class="modal-body">
                      <form class="form-horizontal" action="#">
                        <div class="form-group">
				<label class="col-sm-2 control-label">Nombre</label>
				<div class="col-sm-10">
                                    <input type="text" class="form-control" name="nombre" placeholder="Nombre del paciente" maxlength="30" onkeypress="return validarLetras(event)" required>
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
                                      <label>Fecha de nacimiento</label>
                                      <input type="date" class="form-control input-sm" data-format="dd-mm-yyyy" name="fecha" placeholder="aaaa-mm-dd" required>
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
                          <br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
                          <div class="form-group">
				<label class="col-sm-2 control-label">Teléfono</label>
				<div class="col-sm-10">
                                    <input type="text" class="form-control" name="telefono" placeholder="Teléfono fijo" maxlength="10" onkeypress="return validarNumeros(event)" required>
				</div>
			 </div>
                       
                          <input type="hidden" name="foto" maxlength="50" value="">
		  <div class="btn-group pull-right">
                      <button type="reset" >Limpiar</button>
                      <button type="submit" >Guardar datos</button>
		  </div>
		  </form>
                </div>
 <%
    if (request.getParameter("nombre")!= null) 
    {
       conexionBD conBD = new conexionBD();
       ResultSet buscarFolio;

            if(conBD.enchufar())
            {
                if(conBD.registrarPaciente(request.getParameter("nombre"), request.getParameter("foto"), request.getParameter("fecha"), 
                        request.getParameter("sexo"), request.getParameter("curp"), request.getParameter("calle"), 
                        request.getParameter("num"), request.getParameter("colonia"), request.getParameter("telefono"), 
                        request.getParameter("municipio"), request.getParameter("estado"), request.getParameter("pais")))
                {
                    buscarFolio = conBD.buscar("Select folio from pacientes where curpPac='"+request.getParameter("curp")+"'");
                    buscarFolio.next();
                    int folioUser = buscarFolio.getInt("folio");
                    conBD.registrarUsuario(""+folioUser, request.getParameter("curp").toUpperCase(), 3);
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
                         alertify.error("Error al registrar");
                     </script>    
                     <%
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
