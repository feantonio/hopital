<%@page import="modelo.conexionBD"%>        
		  <div class="modal-header">
			<h4 class="modal-title"><i class='glyphicon glyphicon-edit'></i>Agregar nuevo administrador</h4>
		  </div>
		  <div class="modal-body">
                      <form class="form-horizontal" action="#">
			<div id="resultados_ajax"></div>
			  <div class="form-group">
				<label class="col-sm-3 control-label">Usuario</label>
				<div class="col-sm-8">
				  <input type="text" class="form-control" id="nombre" name="usuario" required>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-3 control-label">Contrase�a</label>
				<div class="col-sm-8">
                                    <input type="password" class="form-control" name="pass" >
				</div>
			  </div>
			  
			  <div class="form-group">
				<label class="col-sm-3 control-label">Repite contrase�a</label>
				<div class="col-sm-8">
                                    <input type="password" class="form-control" name="pass2" > 
				</div>
			  </div>
			 			 			 
		  
		  <div class="btn-group pull-right">
                      <button type="reset" >Limpiar</button>
                      <button type="submit" >Guardar datos</button>
		  </div>
		  </form>
                </div>
 <%
    if (request.getParameter("usuario")!= null) 
    {
       conexionBD conBD = new conexionBD();
   
       String pass1 = request.getParameter("pass");
       String pass2 = request.getParameter("pass2");
       if (pass1.equals(pass2))
       {
            if(conBD.enchufar())
            {
                if(conBD.registrarUsuario(request.getParameter("usuario"), pass1, 1))
                {
                     %>
                     <script>
                         alertify.success("Registro exitoso");
                         setTimeout("location.href='verUsuarios.jsp'", 2000);
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
        else
        {
            %>
           <script>
               alertify.error("Contrase�as no coinciden");
           </script>    
           <%
        }
    }

%>
