package org.apache.jsp.administrador.pacientes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.pacientesBD;

public final class alta_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("        \n");
      out.write("\t\t  <div class=\"modal-body\">\n");
      out.write("                      <form class=\"form-horizontal\" action=\"#\">\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("\t\t\t\t<label class=\"col-sm-2 control-label\">Nombre</label>\n");
      out.write("\t\t\t\t<div class=\"col-sm-10\">\n");
      out.write("                                    <input type=\"text\" class=\"form-control\" name=\"nombre\" placeholder=\"Nombre del paciente\" onkeypress=\"return validarLetras(event)\" required>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t </div>\n");
      out.write("                         <div class=\"form-group\">\n");
      out.write("                             <label class=\"col-sm-2 control-label\">CURP</label>\n");
      out.write("                             <div class=\"col-sm-10\">\n");
      out.write("                                 <input type=\"text\" class=\"form-control\" name=\"curp\" placeholder=\"Clave Única de Registro\" required>\n");
      out.write("                             </div>\n");
      out.write("                       </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                             <label class=\"col-sm-2 control-label\">Foto</label>\n");
      out.write("                             <div class=\"col-sm-10\">\n");
      out.write("                               <input type=\"file\" class=\"form-control\" name=\"foto\" required>\n");
      out.write("                             </div>\n");
      out.write("                       </div>\n");
      out.write("\t\t\t<div>  \n");
      out.write("\t\t\t\t  <div class=\"col-md-6\">\n");
      out.write("                                      <label>Fecha de nacimiento</label>\n");
      out.write("                                      <input type=\"date\" class=\"form-control input-sm\" data-format=\"yyyy-mm-dd\" name=\"fecha\" placeholder=\"aaaa-mm-dd\" required>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("                                <div class=\"col-md-6\">\n");
      out.write("                                    <label>Sexo</label>\n");
      out.write("                                    <select class=\"form-control\" name=\"sexo\" required>\n");
      out.write("\t\t\t\t\t<option value=\"\">-- Selecciona un género --</option>\n");
      out.write("\t\t\t\t\t<option value=\"H\">Hombre</option>\n");
      out.write("\t\t\t\t\t<option value=\"M\">Mujer</option>\n");
      out.write("                                        <option value=\"O\">Otro</option>\n");
      out.write("\t\t\t\t  </select>\n");
      out.write("                                </div>\n");
      out.write("\t\t\t</div>\n");
      out.write("                       <div>  \n");
      out.write("\t\t\t\t  <div class=\"col-md-6\">\n");
      out.write("                                      <label>Calle</label>\n");
      out.write("                                    <input type=\"text\" class=\"form-control input-sm\" name=\"calle\" placeholder=\"Calle\" required>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("                                <div class=\"col-md-6\">\n");
      out.write("                                    <label>No. Exterior</label>\n");
      out.write("                                    <input type=\"text\" class=\"form-control input-sm\" name=\"num\" placeholder=\"Num. exterior\" required>\n");
      out.write("                                </div>\n");
      out.write("\t\t\t</div>\t \n");
      out.write("                          <div>  \n");
      out.write("\t\t\t\t  <div class=\"col-md-6\">\n");
      out.write("                                      <label>Colonia</label>\n");
      out.write("                                    <input type=\"text\" class=\"form-control input-sm\" name=\"colonia\" placeholder=\"Colonia\" required>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("                                <div class=\"col-md-6\">\n");
      out.write("                                    <label>Municipio</label>\n");
      out.write("                                    <input type=\"text\" class=\"form-control input-sm\" name=\"municipio\" placeholder=\"Municipio\" onkeypress=\"return validarLetras(event)\" required>\n");
      out.write("                                </div>\n");
      out.write("\t\t\t</div>\n");
      out.write("                        <div>  \n");
      out.write("\t\t\t\t  <div class=\"col-md-6\">\n");
      out.write("                                      <label>Estado</label>\n");
      out.write("                                      <input type=\"text\" class=\"form-control input-sm\" name=\"estado\" placeholder=\"Estado\" onkeypress=\"return validarLetras(event)\" required>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("                                <div class=\"col-md-6\">\n");
      out.write("                                    <label>Pais</label>\n");
      out.write("                                    <input type=\"text\" class=\"form-control input-sm\" name=\"pais\" placeholder=\"País de procedencia\" onkeypress=\"return validarLetras(event)\"required>\n");
      out.write("                                </div>\n");
      out.write("\t\t\t</div>\n");
      out.write("                          <br><br><br><br><br><br><br><br><br><br><br><br><br><br> \n");
      out.write("                          <div class=\"form-group\">\n");
      out.write("\t\t\t\t<label class=\"col-sm-2 control-label\">Teléfono</label>\n");
      out.write("\t\t\t\t<div class=\"col-sm-10\">\n");
      out.write("                                    <input type=\"text\" class=\"form-control\" name=\"telefono\" placeholder=\"Teléfono fijo\" onkeypress=\"return validarNumeros(event)\" required>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t </div>\n");
      out.write("                       \n");
      out.write("\t\t  \n");
      out.write("\t\t  <div class=\"btn-group pull-right\">\n");
      out.write("                      <button type=\"reset\" >Limpiar</button>\n");
      out.write("                      <button type=\"submit\" >Guardar datos</button>\n");
      out.write("\t\t  </div>\n");
      out.write("\t\t  </form>\n");
      out.write("                </div>\n");
      out.write(" ");

    if (request.getParameter("nombre")!= null) 
    {
       pacientesBD conBD = new pacientesBD();

            if(conBD.enchufar())
            {
                if(conBD.registrarpPaciente(request.getParameter("nombre"), request.getParameter("foto"), request.getParameter("fecha"), 
                        request.getParameter("sexo"), request.getParameter("curp"), request.getParameter("calle"), 
                        request.getParameter("num"), request.getParameter("colonia"), request.getParameter("telefono"), 
                        request.getParameter("municipio"), request.getParameter("estado"), request.getParameter("pais")))
                {
                     
      out.write("\n");
      out.write("                     <script>\n");
      out.write("                         alertify.success(\"Registro exitoso\");\n");
      out.write("                         setTimeout(\"location.href='registros.jsp'\", 2000);\n");
      out.write("                     </script>    \n");
      out.write("                     ");

                  conBD.desenchufar();
                 }
                 else
                 {
                      
      out.write("\n");
      out.write("                     <script>\n");
      out.write("                         alertify.error(\"Error al registrar\");\n");
      out.write("                     </script>    \n");
      out.write("                     ");

                 }
            }
             else
             {
                   
      out.write("\n");
      out.write("              <script>\n");
      out.write("                  alertify.error(\"Error al conectarse\");\n");
      out.write("              </script>    \n");
      out.write("              ");

             }
    }


      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
