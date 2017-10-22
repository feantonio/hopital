<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.io.*"%>
<%@page import="java.util.*,java.io.*"%>
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
                

<%
    try
    {
        String ruta = "C:\\Users\\Felipe\\Documents\\NetBeansProjects\\hospital\\web\\doctores\\fotos\\";
        FileItemFactory archivo_factory = new DiskFileItemFactory();
        ServletFileUpload servlet_archivo = new ServletFileUpload(archivo_factory);
        List lista = servlet_archivo.parseRequest(request);
        FileItem dato_imagen = (FileItem)lista.get(0);
        String foto = ""+ dato_imagen.getName();
        
        conexionBD conBD = new conexionBD();
   
        ResultSet resultadoBusqueda;

        if (conBD.enchufar()) 
        {
            String[] ext = foto.split("\\.");
            if ( (ext[1].equals("jpg")) || (ext[1].equals("jpeg")) || (ext[1].equals("png")) )
            {
                resultadoBusqueda = conBD.buscar("Select *from doctores where fotoDoc= '" + foto + "'");
                if (resultadoBusqueda.next()) 
                {
                    %>
                    <script>
                     alertify.error("Ya existe un archivo con el nombre: <%=foto%>");
                     setTimeout("location.href='seleccionFoto.jsp?folio=<%=folio%>'", 2000);
                     </script>
                     <%
                }
                else
                {
                    File archivo=new File(""+ ruta + dato_imagen.getName());
                    dato_imagen.write(archivo);

                        if (conBD.ejecutarSentencia("Update doctores set fotoDoc='" + foto + "' where cedula='" + folio + "'")) 
                        {
                             conBD.desenchufar();
                            %>
                            <script>
                             alertify.success("Subido correctamente");
                             setTimeout("location.href='datosPersonales.jsp?folio=<%=folio%>'", 2000);
                             </script>
                             <%
                        }
                       else
                       {
                            %>
                            <script>
                             alertify.error("Error al subir foto");
                             setTimeout("location.href='seleccionFoto.jsp?folio=<%=folio%>'", 2000);
                             </script>
                             <%
                       }
                }
            }
            else
            {
                %>
                <script>
                 alertify.error("Archivo .<%=ext[1]%> no permitido");
                 setTimeout("location.href='seleccionFoto.jsp?folio=<%=folio%>'", 2000);
                 </script>
                 <%
            }
        }
    
    }
    catch(Exception ex)
    {
        out.println("Error: "+ex.toString());
    }
%>
            
<jsp:include page="piePagina.jsp"/>