package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE HTML>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width\" />\n");
      out.write("        <title>Hospital</title>\n");
      out.write("        <link href=\"css/index/components.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/index/responsee.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/index/owl.carousel.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/index/owl.theme.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/index/template-style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/index/fonts.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("           \n");
      out.write("        <script src=\"js/index/jquery-1.8.3.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/index/jquery-ui.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/index/modernizr.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/index/responsee.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body class=\"size-1140\">\n");
      out.write("        <!-- TOP NAV WITH LOGO -->  \n");
      out.write("        <header>\n");
      out.write("            <nav>\n");
      out.write("                <div class=\"line\">\n");
      out.write("                    <div class=\"top-nav\">              \n");
      out.write("                        <div class=\"logo hide-l\">\n");
      out.write("                            <a href=\"../design/\">SISTEMA<br /><strong>HOSPITAL</strong></a>\n");
      out.write("                        </div>                  \n");
      out.write("                        <p class=\"nav-text\">Navegacion</p>\n");
      out.write("                        <div class=\"top-nav s-12 l-5\">\n");
      out.write("                            <ul class=\"right top-ul chevron\">\n");
      out.write("                                <li><a href=\"#second-block\">Misión</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li><a href=\"#third-block\">Visión</a>\n");
      out.write("                                </li>\n");
      out.write("\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                        <ul class=\"s-12 l-2\">\n");
      out.write("                            <li class=\"logo hide-s hide-m\">\n");
      out.write("                                <a href=\"index.jsp\">SISTEMA<br /><strong>HOSPITAL</strong></a>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                        <div class=\"top-nav s-12 l-5\">\n");
      out.write("                            <ul class=\"top-ul chevron\">\n");
      out.write("                                <li><a href=\"#fourth-block\">Valores</a>\n");
      out.write("                                </li>\n");
      out.write("\n");
      out.write("                                <li><a href=\"login.jsp\">Iniciar sesión</a>\n");
      out.write("                                </li>\n");
      out.write("                            </ul> \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("        </header>\n");
      out.write("\n");
      out.write("        <section>\n");
      out.write("            <!-- CAROUSEL -->  \t\n");
      out.write("            <div id=\"carousel\">\n");
      out.write("                <div id=\"owl-demo\" class=\"owl-carousel owl-theme\">\n");
      out.write("                    <div class=\"item\">\n");
      out.write("                        <img src=\"img/doctor2.jpg\" alt=\"\">  \n");
      out.write("                        <div class=\"carousel-text\">\n");
      out.write("                            <div class=\"line\">\n");
      out.write("                                <div class=\"s-12 l-9\">\n");
      out.write("                                    <h2>La salud no lo es todo pero sin ella, todo lo demás es nada</h2>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"s-12 l-9\">\n");
      out.write("                                    <p>Calidad en servicio y eficiencia\n");
      out.write("                                    </p>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>    \n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"item\">\n");
      out.write("                        <img src=\"img/doctor3.jpg\" alt=\"\">\n");
      out.write("                        <div class=\"carousel-text\">\n");
      out.write("                            <div class=\"line\">\n");
      out.write("                                <div class=\"s-12 l-9\">\n");
      out.write("                                    <h2>La salud no lo es todo pero sin ella, todo lo demás es nada</h2>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"s-12 l-9\">\n");
      out.write("                                    <p>Calidad en servicio y eficiencia\n");
      out.write("                                    </p>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div> \n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"item\">\n");
      out.write("                        <img src=\"img/medical1.jpeg\" alt=\"\">\n");
      out.write("                        <div class=\"carousel-text\">\n");
      out.write("                            <div class=\"line\">\n");
      out.write("                                <div class=\"s-12 l-9\">\n");
      out.write("                                    <h2>La salud no lo es todo pero sin ella, todo lo demás es nada</h2>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"s-12 l-9\">\n");
      out.write("                                    <p>Calidad en servicio y eficiencia\n");
      out.write("                                    </p>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div> \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div id=\"second-block\">\n");
      out.write("                <div class=\"line\">\n");
      out.write("                    <div class=\"margin-bottom\">\n");
      out.write("                        <div class=\"margin\">\n");
      out.write("                            <article class=\"s-12 l-8 center\">\n");
      out.write("                                <h1>Misión</h1>\n");
      out.write("                                <p class=\"margin-bottom\">Proporcionar servicios de salud de alta especialidad con gran calidad y calidez, en las especialidades médicas, quirúrgicas y de apoyo al diagnóstico y tratamiento, por lo que tiene el reconocimiento de la sociedad mexicana. Hospital formador de recursos humanos de excelencia para la salud del país y a nivel internacional. Realiza investigación de alto nivel cuyos resultados se difunden en publicaciones científicas de impacto internacional, se preocupa por sus recursos humanos capacitándolos formando equipos como una necesidad de las actividades humanas.\n");
      out.write("                                </p>\n");
      out.write("                                <a class=\"button s-12 l-4 center\" href=\"#carousel\">Inicio</a>  \t\t\t\n");
      out.write("                            </article>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div id=\"third-block\" style=\"background-color: black\">\n");
      out.write("                <div class=\"line\">\n");
      out.write("                    <div class=\"margin-bottom\">\n");
      out.write("                        <div class=\"margin\">\n");
      out.write("                            <article class=\"s-12 l-8 center\">\n");
      out.write("                                <h1>Visión</h1>\n");
      out.write("                                <p class=\"margin-bottom\">Ser un centro hospitalario con reconocimiento nacional y de referencia internacional, generador de modelos de atención en las especialidades médicas, en la enseñanza de la medicina y en proyectos de investigación con alto rigor científico. Participante en las políticas sectoriales, principalmente en el Seguro Popular y del Fondo Directo de Gastos Catastróficos en Salud y apoyando la formación de recursos humanos de alta calidad y de modelos de atención a la salud, que impacte en los indicadores básicos de salud, con aportaciones para la disminución de los problemas relacionados con el rezago social y que propicie el ataque oportuno a los factores casuales de los problemas emergentes, debiéndose mantener a la vanguardia\n");
      out.write("                                </p>\n");
      out.write("                                <a class=\"button s-12 l-4 center\" href=\"#carousel\">Inicio</a>  \t\t\t\n");
      out.write("                            </article>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div id=\"fourth-block\">\n");
      out.write("                <div class=\"line\">\n");
      out.write("                    <div id=\"owl-demo2\" class=\"owl-carousel owl-theme\">\n");
      out.write("                        <div class=\"item\">\n");
      out.write("                            <h2>Calidad</h2>\n");
      out.write("                            <p class=\"s-12 m-12 l-8 center\">Por la atención brindada a los pacientes, tanto en los servicios médicos como administrativos.\n");
      out.write("                            </p>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"item\">\n");
      out.write("                            <h2>Ética</h2>\n");
      out.write("                            <p class=\"s-12 m-12 l-8 center\">Apego a los códigos, normas y principios del actuar del equipo de salud.\n");
      out.write("                            </p>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"item\">\n");
      out.write("                            <h2>Profesionalismo</h2>\n");
      out.write("                            <p class=\"s-12 m-12 l-8 center\">Al aplicar los conocimientos adquiridos para apoyar los servicios que presta la Institución.\n");
      out.write("                            </p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        <!-- FOOTER -->   \n");
      out.write("        <footer>\n");
      out.write("            <div class=\"line\">\n");
      out.write("                <div class=\"s-12 l-6\">\n");
      out.write("                    <p>Sistema para hospital.TESSFP 2017\n");
      out.write("                    </p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"s-12 l-6\">\n");
      out.write("                    <p class=\"right\">\n");
      out.write("                        <a class=\"right\" href=\"#\" title=\"Responsee - lightweight responsive framework\">Felipe Antonio Sanchez</a>\n");
      out.write("                    </p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </footer>\n");
      out.write(" \n");
      out.write("        <script src=\"js/index/owl.carousel.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            jQuery(document).ready(function ($) {\n");
      out.write("                $(\"#owl-demo\").owlCarousel({\n");
      out.write("                    slideSpeed: 300,\n");
      out.write("                    autoPlay: true,\n");
      out.write("                    navigation: false,\n");
      out.write("                    pagination: false,\n");
      out.write("                    singleItem: true\n");
      out.write("                });\n");
      out.write("                $(\"#owl-demo2\").owlCarousel({\n");
      out.write("                    slideSpeed: 300,\n");
      out.write("                    autoPlay: true,\n");
      out.write("                    navigation: false,\n");
      out.write("                    pagination: true,\n");
      out.write("                    singleItem: true\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("\n");
      out.write("        </script> \n");
      out.write("    </body>\n");
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
