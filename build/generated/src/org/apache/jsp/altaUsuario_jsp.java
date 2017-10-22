package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.conexionBD;

public final class altaUsuario_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML>\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "encabezado.jsp", out, false);
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "menuAdmin.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<form class=\"formoid-flat-green\" action=\"#\" style=\"background-color:#FFFFFF;font-size:14px;font-family:'Lato',sans-serif;color:#666666;max-width:480px;min-width:150px\">\n");
      out.write("    <div class=\"title\"><h2>Nuevo Usuario</h2></div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">Usuario<span class=\"required\">*</span></label>\n");
      out.write("        <input class=\"large\" type=\"text\" name=\"usuario\" required=\"required\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"element-password\"><label class=\"title\">Contraseña<span class=\"required\">*</span></label>\n");
      out.write("        <input class=\"large\" type=\"password\" name=\"pass\" value=\"\" required=\"required\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"element-password\"><label class=\"title\">Repite contraseña<span class=\"required\">*</span></label>\n");
      out.write("        <input class=\"large\" type=\"password\" name=\"pass2\" value=\"\" required=\"required\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"element-select\"><label class=\"title\">Tipo usaurio</label>\n");
      out.write("        <div class=\"large\"><span>\n");
      out.write("                <select name=\"tipo\" >\n");
      out.write("                    <option value=\"1\">Administrador</option>\n");
      out.write("                    <option value=\"2\">Doctor</option>\n");
      out.write("                    <option value=\"3\">Paciente</option>\n");
      out.write("                </select></span>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"submit\"><input type=\"submit\" value=\"Guardar\"/></div></form>\n");
      out.write(" ");

    if (request.getParameter("usuario")!= null) 
    {
       conexionBD conBD = new conexionBD();
   
       String pass1 = request.getParameter("pass");
       String pass2 = request.getParameter("pass2");
       if (pass1.equals(pass2))
       {
            if(conBD.enchufar())
            {
                if(conBD.registrarUsuario(request.getParameter("usuario"), pass1, Integer.parseInt(request.getParameter("tipo"))))
                {
                     
      out.write("\n");
      out.write("                     <script>\n");
      out.write("                         alertify.success(\"Registro exitoso\");\n");
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
        else
        {
            
      out.write("\n");
      out.write("           <script>\n");
      out.write("               alertify.error(\"Contraseñas no coinciden\");\n");
      out.write("           </script>    \n");
      out.write("           ");

        }
    }


      out.write('\n');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "piePagina.jsp", out, false);
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
