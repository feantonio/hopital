package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import modelo.conexionBD;

public final class historialSesiones_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML>\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "encabezado.jsp", out, false);
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "menuAdmin.jsp", out, false);
      out.write("\n");
      out.write("<table class=\"bordered-table zebra-striped\" id=\"registro\">\n");
      out.write("    <thead>\n");
      out.write("    <th>ID</th>\n");
      out.write("    <th>Fecha de sesión</th>\n");
      out.write("    <th>Hora de sesión</th>\n");
      out.write("    <th>Clave de usuario</th>\n");
      out.write("    <th>Acciones</th>\n");
      out.write("\n");
      out.write("</thead>\n");
      out.write("<tbody>\n");
      out.write("    ");

        conexionBD bd = new conexionBD();
        String tabla = "sesiones";
        Object[] fila = new Object[4];
        ResultSet respuesta;
        if (bd.enchufar()) 
        {
            if (bd.ver(tabla) != null)
            {
                respuesta = bd.ver(tabla);
                while (respuesta.next()) 
                {
                    fila[0] = respuesta.getInt("idSesion");
                    fila[1] = respuesta.getString("fechaSesion");
                    fila[2] = respuesta.getString("horaSesion");
                    fila[3] = respuesta.getString("idUsuario");
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print(fila[0]);
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(fila[1]);
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(fila[2]);
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(fila[3]);
      out.write("</td>\n");
      out.write("\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            <form action=\"/hospital/sesiones\">\n");
      out.write("                                 <input type=\"submit\" value=\"Generar Reporte\" /> \n");
      out.write("                                 <input type=\"hidden\" name=\"fecha\" value=\"");
      out.print(fila[1]);
      out.write("\">\n");
      out.write("                            </form> \n");
      out.write("                        </td>\n");
      out.write("\n");
      out.write("                    </tr>\n");
      out.write("                    ");

                }
            }
        }
    
      out.write("\n");
      out.write("</tbody>\n");
      out.write("</table>\n");
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
