package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Calendar;
import java.sql.ResultSet;
import modelo.conexionBD;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html >\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>Inicio de Sesión</title>  \n");
      out.write("\n");
      out.write("        <link href=\"css/login/reset.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/login/styles.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("\n");
      out.write("        <link href=\"css/alertas/alertify.core.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/alertas/alertify.default.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    </head>\n");
      out.write("    <script src=\"js/alertas/jquery.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"js/alertas/alertify.js\" type=\"text/javascript\"></script>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"login\">\n");
      out.write("            <header class=\"login-header\"><span class=\"text\">INICIAR</span><span class=\"loader\"></span></header>\n");
      out.write("            <form class=\"login-form\" action=\"#\">\n");
      out.write("                <input type=\"text\" placeholder=\"Usuario\" class=\"login-input\" name=\"usuario\" required=\"\"/>\n");
      out.write("                <input type=\"password\" placeholder=\"Password\" class=\"login-input\" name=\"password\" required=\"\"/>\n");
      out.write("                <button type=\"submit\" class=\"login-btn\">Entrar</button>\t\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("    \n");
      out.write("    ");

    if(request.getParameter("usuario") != null)
    {
        String usuario, password, fecha, hora;
        int id, mesTem;
        usuario = request.getParameter("usuario");
        password = request.getParameter("password");
        Calendar c = Calendar.getInstance(); //
        String dia, mes, annio, hrs, min, seg;
      
        conexionBD bd = new conexionBD();
        HttpSession sesion = request.getSession();
        ResultSet busqueda;
        
        if(bd.enchufar())
        {
            int tipo=bd.buscaUsuario(usuario, password);
            switch (tipo) 
            {
                    case 1:
                        busqueda = bd.buscar("Select *from usuarios where usuario='"+ usuario +"'");
                        busqueda.next();
                        id = busqueda.getInt("idUsuario");
                        
                        sesion.setAttribute("user", usuario);
                        sesion.setAttribute("pass", password);
                        sesion.setAttribute("tipo", "1");
                        
                        mesTem = c.get(Calendar.MONTH);
                        mesTem = mesTem + 1;
                        dia = Integer.toString(c.get(Calendar.DATE));
                        mes = Integer.toString(mesTem);
                        annio = Integer.toString(c.get(Calendar.YEAR));
                        fecha = ""+dia+"-"+mes+"-"+annio;
                        
                        hrs = Integer.toString(c.get(Calendar.HOUR_OF_DAY));
                        min = Integer.toString(c.get(Calendar.MINUTE));
                        seg = Integer.toString(c.get(Calendar.SECOND));
                        hora = ""+hrs+":"+min+":"+seg;
                        
                        bd.registrarSesion(fecha, hora, id);
                        bd.desenchufar();;
                        response.sendRedirect("administrador/menuAdministrador.jsp");  
                        
                         break;
                    case 2:
                        busqueda = bd.buscar("Select *from usuarios where usuario='"+ usuario +"'");
                        busqueda.next();
                        id = busqueda.getInt("idUsuario");
                        
                        sesion.setAttribute("user", usuario);
                        sesion.setAttribute("pass", password);
                        sesion.setAttribute("tipo", "2");
                        
                        mesTem = c.get(Calendar.MONTH);
                        mesTem = mesTem + 1;
                        dia = Integer.toString(c.get(Calendar.DATE));
                        mes = Integer.toString(mesTem);
                        annio = Integer.toString(c.get(Calendar.YEAR));
                        fecha = ""+dia+"-"+mes+"-"+annio;
                        
                        hrs = Integer.toString(c.get(Calendar.HOUR_OF_DAY));
                        min = Integer.toString(c.get(Calendar.MINUTE));
                        seg = Integer.toString(c.get(Calendar.SECOND));
                        hora = ""+hrs+":"+min+":"+seg;
                        
                        bd.registrarSesion(fecha, hora, id);
                        bd.desenchufar();;
                        response.sendRedirect("doctores/menuDoctor.jsp");  
                        
                         break;
                    case 3:
                        busqueda = bd.buscar("Select *from usuarios where usuario='"+ usuario +"'");
                        busqueda.next();
                        id = busqueda.getInt("idUsuario");
                        
                        sesion.setAttribute("user", usuario);
                        sesion.setAttribute("pass", password);
                        sesion.setAttribute("tipo", "3");
                        
                        mesTem = c.get(Calendar.MONTH);
                        mesTem = mesTem + 1;
                        dia = Integer.toString(c.get(Calendar.DATE));
                        mes = Integer.toString(mesTem);
                        annio = Integer.toString(c.get(Calendar.YEAR));
                        fecha = ""+dia+"-"+mes+"-"+annio;
                        
                        hrs = Integer.toString(c.get(Calendar.HOUR_OF_DAY));
                        min = Integer.toString(c.get(Calendar.MINUTE));
                        seg = Integer.toString(c.get(Calendar.SECOND));
                        hora = ""+hrs+":"+min+":"+seg;
                        
                        bd.registrarSesion(fecha, hora, id);
                        bd.desenchufar();
                        response.sendRedirect("pacientes/menuPaciente.jsp?folio=" +usuario);  
                        
                         break;
                    case -1:
                        
      out.write("\n");
      out.write("                        <script>\n");
      out.write("                            alertify.error(\"Usuario o contraseña incorrecto\");\n");
      out.write("                        </script> \n");
      out.write("                        ");

                        break;
            }
        }
        else
        {
        
      out.write("\n");
      out.write("        <script>\n");
      out.write("            alertify.error(\"Error al conectarse\");\n");
      out.write("        </script> \n");
      out.write("        ");

        }
    }

    if(request.getParameter("cerrar") != null)
    {
        session.invalidate();
    }


      out.write("\n");
      out.write("</html>");
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
