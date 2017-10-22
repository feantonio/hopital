<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<%@page session="true"%>
<jsp:include page="encabezadoDoctor.jsp"/>
<br><br><br><br><br><br><br><br><br><br><br>
<center><label style="color:red;">Espere procesando...</label></center>
<br><br><br><br><br><br><br><br><br><br><br>
<%
    try 
    {
        if(request.getParameter("id") != null)
        {
            int id = Integer.parseInt(request.getParameter("id"));
            conexionBD bd = new conexionBD();
             ResultSet resultadoBusqueda;
            if (bd.enchufar()) 
            {
               resultadoBusqueda = bd.buscar("Select cedula, fotoDoc from doctores where idDoctor='" + id + "'");
               resultadoBusqueda.next();
               int cedula = resultadoBusqueda.getInt("cedula");
               String foto = resultadoBusqueda.getString("fotoDoc");
               
               File  archivo=new File("C:\\Users\\Felipe\\Documents\\NetBeansProjects\\hospital\\web\\doctores\\fotos\\"+ foto);

             if (bd.ejecutarSentencia("Delete from doctores where idDoctor='" + id +"'")) 
             {
                 bd.ejecutarSentencia("Delete from usuarios where usuario='" + cedula +"'");
                   try 
                    {
                        if (archivo.exists())
                        {
                            if (archivo.isFile())
                            {
                                archivo.delete();
                            }
                        }
                    } 
                    catch (Exception e) 
                    {

                    }
               %>
                    <script>
                        alertify.success("Registro borrado: " + <%=id%>);
                        setTimeout("location.href='registros.jsp'", 1000);
                    </script>
               <%
             }
       
            }
        }
                
    } catch (Exception e) 
    {
        %>
        <script>location.href="registros.jsp";</script>
        <%
    }
    
%>
<jsp:include page="pieDoctor.jsp"/>