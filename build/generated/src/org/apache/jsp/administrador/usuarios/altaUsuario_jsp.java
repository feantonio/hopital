package org.apache.jsp.administrador.usuarios;

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
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../encabezado.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("  <div class=\"form\">\n");
      out.write("      \n");
      out.write("      <div class=\"tab-content\">\n");
      out.write("        <div id=\"signup\">   \n");
      out.write("          <h1>Sign Up for Free</h1>\n");
      out.write("          \n");
      out.write("          <form action=\"/\" method=\"post\">\n");
      out.write("          \n");
      out.write("          <div class=\"top-row\">\n");
      out.write("            <div class=\"field-wrap\">\n");
      out.write("              <label>\n");
      out.write("                First Name<span class=\"req\">*</span>\n");
      out.write("              </label>\n");
      out.write("              <input type=\"text\" required autocomplete=\"off\" />\n");
      out.write("            </div>\n");
      out.write("        \n");
      out.write("            <div class=\"field-wrap\">\n");
      out.write("              <label>\n");
      out.write("                Last Name<span class=\"req\">*</span>\n");
      out.write("              </label>\n");
      out.write("              <input type=\"text\"required autocomplete=\"off\"/>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("\n");
      out.write("          <div class=\"field-wrap\">\n");
      out.write("            <label>\n");
      out.write("              Email Address<span class=\"req\">*</span>\n");
      out.write("            </label>\n");
      out.write("            <input type=\"email\"required autocomplete=\"off\"/>\n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("          <div class=\"field-wrap\">\n");
      out.write("            <label>\n");
      out.write("              Set A Password<span class=\"req\">*</span>\n");
      out.write("            </label>\n");
      out.write("            <input type=\"password\"required autocomplete=\"off\"/>\n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("          <button type=\"submit\" class=\"button button-block\"/>Registrar</button>      \n");
      out.write("          </form>\n");
      out.write("        </div>\n");
      out.write("      </div>   \n");
      out.write("</div>\n");
      out.write("\n");
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
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../piePagina.jsp", out, false);
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
