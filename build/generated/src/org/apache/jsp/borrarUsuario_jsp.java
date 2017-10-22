package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.conexionBD;

public final class borrarUsuario_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "encabezado.jsp", out, false);
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "menuAdmin.jsp", out, false);
      out.write('\n');

    try 
    {
        if(request.getParameter("id") != null)
        {
            int id = Integer.parseInt(request.getParameter("id"));
            conexionBD bd = new conexionBD();
            if (bd.enchufar()) 
            {
             if (bd.ejecutarSentencia("Delete from usuarios where idUsuario='" + id +"'")) 
             {
               
      out.write("\n");
      out.write("                    <script>\n");
      out.write("                        alertify.success(\"Registro borrado: \" + ");
      out.print(id);
      out.write(");\n");
      out.write("                        setTimeout(\"location.href='verUsuarios.jsp'\", 1000);\n");
      out.write("                    </script>\n");
      out.write("               ");

             }
       
            }
        }
                
    } catch (Exception e) 
    {
        
      out.write("\n");
      out.write("        <script>location.href=\"verUsuarios.jsp\";</script>\n");
      out.write("        ");

    }
    

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
