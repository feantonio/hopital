package org.apache.jsp.administrador;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.conexionBD;
import java.sql.ResultSet;

public final class encabezado_jsp extends org.apache.jasper.runtime.HttpJspBase
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


    HttpSession sesion = request.getSession();
    String usuario, tipo;

    if (sesion.getAttribute("user") != null && sesion.getAttribute("pass") != null && sesion.getAttribute("tipo") != null) {
        usuario = sesion.getAttribute("user").toString();
        tipo = sesion.getAttribute("tipo").toString();

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Hospital</title>\n");
      out.write("        <meta charset=\"utf-8\" />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/template/main.css\" />\n");
      out.write("        <link href=\"../css/alertas/alertify.core.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"../css/alertas/alertify.default.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("\n");
      out.write("        <link href=\"../css/query/bootstrapventana.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"../css/query/jquery-ui.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"../css/query/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    </head>\n");
      out.write("    <script src=\"../js/template/jquery.min.js\"></script>\n");
      out.write("    <script src=\"../js/template/jquery.dropotron.min.js\"></script>\n");
      out.write("    <script src=\"../js/template/skel.min.js\"></script>\n");
      out.write("    <script src=\"../js/template/skel-viewport.min.js\"></script>\n");
      out.write("    <script src=\"../js/template/util.js\"></script>\n");
      out.write("    <script src=\"../js/template/main.js\"></script>\n");
      out.write("    <script src=\"../js/alertas/alertify.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"../js/query/jquery-1.12.4.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"../js/query/jquery-ui.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "usuarios/funcionesUsuarios.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("    ");
} else {
    
      out.write("\n");
      out.write("    <script>\n");
      out.write("        location.replace(\"../login.jsp\");\n");
      out.write("    </script> \n");
      out.write("    ");

        }
    
      out.write("\n");
      out.write("\n");
      out.write("    <body class=\"homepage\">\n");
      out.write("        <div id=\"page-wrapper\">\n");
      out.write("            <nav id=\"nav\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"menuAdministrador.jsp\">Inicio</a></li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"#\">Usuarios</a>\n");
      out.write("                        <ul>\n");
      out.write("                            <li><a href=\"#\">Agregar</a></li>\n");
      out.write("                            <li><a href=\"#\">Registro</a></li>\n");
      out.write("                            <li><a href=\"#\">Historial</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"#\">Registros</a>\n");
      out.write("                        <ul>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"#\">Usuarios</a>\n");
      out.write("                                <ul>\n");
      out.write("                                    <li><a href=\"javascript:usuarios();\">Registro de usuarios</a></li>\n");
      out.write("                                    <li><a href=\"javascript:sesiones();\">Historial de sesiones</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </li>\n");
      out.write("                            <li><a href=\"#\"></a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </li>\n");
      out.write("                    <li><a href=\"../login.jsp?cerrar='true'\">Cerrar sesión</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </nav>\n");
      out.write("            <br><br>\n");
      out.write("            <center>               \n");
      out.write("                <div>\n");
      out.write("\n");
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
