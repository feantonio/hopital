package org.apache.jsp.administrador.pacientes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.conexionBD;

public final class altaPaciente_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<form class=\"formoid-flat-green\" action=\"#\" style=\"background-color:#FFFFFF;font-size:14px;font-family:'Lato',sans-serif;color:#666666;max-width:480px;min-width:150px\">\n");
      out.write("    <div class=\"title\"><h2>Nuevo de usuario</h2></div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("\n");
      out.write("        <label class=\"title\">Nombre del paciente<span class=\"required\">*</span></label>\n");
      out.write("        <input class=\"large\" type=\"text\" name=\"usuario\" required=\"required\"/>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    <div class=\"element-file\">\n");
      out.write("        <label class=\"title\">Foto del paciente</label>\n");
      out.write("        <label class=\"large\" >\n");
      out.write("            <div class=\"button\">Buscar foto en el equipo</div>\n");
      out.write("            <input type=\"file\" class=\"file_input\" name=\"file\" />\n");
      out.write("            <div class=\"file_text\">No file selected</div>\n");
      out.write("        </label>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    <div class=\"element-date\">\n");
      out.write("            <label class=\"title\">Fecha de nacimiento:</label>\n");
      out.write("            <input class=\"large\" data-format=\"yyyy-mm-dd\" type=\"date\" name=\"fecha\" placeholder=\"aaaa-mm-dd\"/>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    <div class=\"element-select\"><label class=\"title\">Sexo:</label>\n");
      out.write("        <div class=\"large\"><span>\n");
      out.write("                <select name=\"sexo\" >\n");
      out.write("                    <option value=\"H\">Hombre</option>\n");
      out.write("                    <option value=\"M\">Mujer</option>\n");
      out.write("                    <option value=\"O\">Otro</option>\n");
      out.write("                </select></span>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    <div id=\"datosDomicilio\">\n");
      out.write("            <div class=\"element-separator\">\n");
      out.write("                    <hr><h3 class=\"section-break-title\">Datos domiciliarios</h3>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"element-address\">\n");
      out.write("                <label class=\"title\">Address</label>\n");
      out.write("                <span class=\"addr1\">\n");
      out.write("                    <input  type=\"text\" name=\"address[addr1]\" />\n");
      out.write("                    <label class=\"subtitle\">Street Address</label>\n");
      out.write("                </span>\n");
      out.write("                <span class=\"addr2\">\n");
      out.write("                    <input  type=\"text\" name=\"address[addr2]\" />\n");
      out.write("                    <label class=\"subtitle\">Address Line 2</label>\n");
      out.write("                </span>\n");
      out.write("                <span class=\"city\">\n");
      out.write("                    <input  type=\"text\" name=\"address[city]\" />\n");
      out.write("                    <label class=\"subtitle\">City</label>\n");
      out.write("                </span>\n");
      out.write("                <span class=\"state\">\n");
      out.write("                    <input  type=\"text\" name=\"address[state]\" />\n");
      out.write("                    <label class=\"subtitle\">State / Province / Region</label>\n");
      out.write("                </span>\n");
      out.write("                <span class=\"zip\">\n");
      out.write("                    <input  type=\"text\" maxlength=\"15\" name=\"address[zip]\" />\n");
      out.write("                    <label class=\"subtitle\">Postal / Zip Code</label>\n");
      out.write("                </span>\n");
      out.write("                <div class=\"country\">\n");
      out.write("                    <select name=\"address[country]\" >\n");
      out.write("                        <option selected=\"selected\" value=\"\" disabled=\"disabled\">--- Select a country ---</option>\n");
      out.write("                        <option value=\"United States\">United States</option>\n");
      out.write("                        <option value=\"United Kingdom\">United Kingdom</option>\n");
      out.write("                        <option value=\"Australia\">Australia</option>\n");
      out.write("                        <option value=\"Canada\">Canada</option>\n");
      out.write("                        <option value=\"France\">France</option>\n");
      out.write("                        <option value=\"New Zealand\">New Zealand</option>\n");
      out.write("                        <option value=\"India\">India</option>\n");
      out.write("                        <option value=\"Brazil\">Brazil</option>\n");
      out.write("                        <option value=\"----\" disabled=\"disabled\">----</option>\n");
      out.write("                        <option value=\"Afghanistan\">Afghanistan</option>\n");
      out.write("                        <option value=\"Aland Islands\">Aland Islands</option>\n");
      out.write("                        <option value=\"Albania\">Albania</option>\n");
      out.write("                        <option value=\"Algeria\">Algeria</option>\n");
      out.write("                        <option value=\"American Samoa\">American Samoa</option>\n");
      out.write("                        <option value=\"Andorra\">Andorra</option>\n");
      out.write("                        <option value=\"Angola\">Angola</option>\n");
      out.write("                        <option value=\"Anguilla\">Anguilla</option>\n");
      out.write("                        <option value=\"Antarctica\">Antarctica</option>\n");
      out.write("                        <option value=\"Antigua and Barbuda\">Antigua and Barbuda</option>\n");
      out.write("                        <option value=\"Argentina\">Argentina</option>\n");
      out.write("                        <option value=\"Armenia\">Armenia</option>\n");
      out.write("                        <option value=\"Aruba\">Aruba</option>\n");
      out.write("                        <option value=\"Austria\">Austria</option>\n");
      out.write("                        <option value=\"Azerbaijan\">Azerbaijan</option>\n");
      out.write("                        <option value=\"Bahamas\">Bahamas</option>\n");
      out.write("                        <option value=\"Bahrain\">Bahrain</option>\n");
      out.write("                        <option value=\"Bangladesh\">Bangladesh</option>\n");
      out.write("                        <option value=\"Barbados\">Barbados</option>\n");
      out.write("                        <option value=\"Belarus\">Belarus</option>\n");
      out.write("                        <option value=\"Belgium\">Belgium</option>\n");
      out.write("                        <option value=\"Belize\">Belize</option>\n");
      out.write("                        <option value=\"Benin\">Benin</option>\n");
      out.write("                        <option value=\"Bermuda\">Bermuda</option>\n");
      out.write("                        <option value=\"Bhutan\">Bhutan</option>\n");
      out.write("                        <option value=\"Bolivia\">Bolivia</option>\n");
      out.write("                        <option value=\"Bosnia and Herzegovina\">Bosnia and Herzegovina</option>\n");
      out.write("                        <option value=\"Botswana\">Botswana</option>\n");
      out.write("                        <option value=\"British Indian Ocean Territory\">British Indian Ocean Territory</option>\n");
      out.write("                        <option value=\"Brunei Darussalam\">Brunei Darussalam</option>\n");
      out.write("                        <option value=\"Bulgaria\">Bulgaria</option>\n");
      out.write("                        <option value=\"Burkina Faso\">Burkina Faso</option>\n");
      out.write("                        <option value=\"Burundi\">Burundi</option>\n");
      out.write("                        <option value=\"Cambodia\">Cambodia</option>\n");
      out.write("                        <option value=\"Cameroon\">Cameroon</option>\n");
      out.write("                        <option value=\"Cape Verde\">Cape Verde</option>\n");
      out.write("                        <option value=\"Cayman Islands\">Cayman Islands</option>\n");
      out.write("                        <option value=\"Central African Republic\">Central African Republic</option>\n");
      out.write("                        <option value=\"Chad\">Chad</option>\n");
      out.write("                        <option value=\"Chile\">Chile</option>\n");
      out.write("                        <option value=\"China\">China</option>\n");
      out.write("                        <option value=\"Colombia\">Colombia</option>\n");
      out.write("                        <option value=\"Comoros\">Comoros</option>\n");
      out.write("                        <option value=\"Democratic Republic of the Congo\">Democratic Republic of the Congo</option>\n");
      out.write("                        <option value=\"Republic of the Congo\">Republic of the Congo</option>\n");
      out.write("                        <option value=\"Cook Islands\">Cook Islands</option>\n");
      out.write("                        <option value=\"Costa Rica\">Costa Rica</option>\n");
      out.write("                        <option value=\"Cote d'Ivoire\">Cote d'Ivoire</option>\n");
      out.write("                        <option value=\"Croatia\">Croatia</option>\n");
      out.write("                        <option value=\"Cuba\">Cuba</option>\n");
      out.write("                        <option value=\"Cyprus\">Cyprus</option>\n");
      out.write("                        <option value=\"Czech Republic\">Czech Republic</option>\n");
      out.write("                        <option value=\"Denmark\">Denmark</option>\n");
      out.write("                        <option value=\"Djibouti\">Djibouti</option>\n");
      out.write("                        <option value=\"Dominica\">Dominica</option>\n");
      out.write("                        <option value=\"Dominican Republic\">Dominican Republic</option>\n");
      out.write("                        <option value=\"East Timor\">East Timor</option>\n");
      out.write("                        <option value=\"Ecuador\">Ecuador</option>\n");
      out.write("                        <option value=\"Egypt\">Egypt</option>\n");
      out.write("                        <option value=\"El Salvador\">El Salvador</option>\n");
      out.write("                        <option value=\"Equatorial Guinea\">Equatorial Guinea</option>\n");
      out.write("                        <option value=\"Eritrea\">Eritrea</option>\n");
      out.write("                        <option value=\"Estonia\">Estonia</option>\n");
      out.write("                        <option value=\"Ethiopia\">Ethiopia</option>\n");
      out.write("                        <option value=\"Faroe Islands\">Faroe Islands</option>\n");
      out.write("                        <option value=\"Fiji\">Fiji</option>\n");
      out.write("                        <option value=\"Finland\">Finland</option>\n");
      out.write("                        <option value=\"Gabon\">Gabon</option>\n");
      out.write("                        <option value=\"Gambia\">Gambia</option>\n");
      out.write("                        <option value=\"Georgia\">Georgia</option>\n");
      out.write("                        <option value=\"Germany\">Germany</option>\n");
      out.write("                        <option value=\"Ghana\">Ghana</option>\n");
      out.write("                        <option value=\"Gibraltar\">Gibraltar</option>\n");
      out.write("                        <option value=\"Greece\">Greece</option>\n");
      out.write("                        <option value=\"Grenada\">Grenada</option>\n");
      out.write("                        <option value=\"Guatemala\">Guatemala</option>\n");
      out.write("                        <option value=\"Guinea\">Guinea</option>\n");
      out.write("                        <option value=\"Guinea-Bissau\">Guinea-Bissau</option>\n");
      out.write("                        <option value=\"Guyana\">Guyana</option>\n");
      out.write("                        <option value=\"Haiti\">Haiti</option>\n");
      out.write("                        </select><i></i>\n");
      out.write("                        <label class=\"subtitle\">Country</label></div></div>\n");
      out.write("\t\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    <div class=\"submit\"><input type=\"submit\" value=\"Registrar\"/></div></form>\n");
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
