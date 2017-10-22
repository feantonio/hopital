package pdf;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import modelo.conexionBD;

@WebServlet(name = "comprobante_cita", urlPatterns = {"/comprobante_cita"})
public class comprobante_cita extends HttpServlet 
{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
         response.setContentType("application/pdf");
        OutputStream salida = response.getOutputStream();
        try
        {
            try 
            {
                Document documentoPDF = new Document();
                PdfWriter.getInstance(documentoPDF, salida);
                documentoPDF.open();
                
                Image edologo = Image.getInstance("C:\\Users\\Felipe\\Documents\\NetBeansProjects\\hospital\\web\\img\\logo_edo.png");
                edologo.scaleAbsolute(70f, 70f);

                edologo.setAlignment(Element.ALIGN_LEFT);
                documentoPDF.add(edologo);
                
                Image logo = Image.getInstance("C:\\Users\\Felipe\\Documents\\NetBeansProjects\\hospital\\web\\img\\logo.jpg");
                logo.scaleAbsolute(90f, 90f);
                logo.setAlignment(Element.ALIGN_RIGHT);
                logo.setAbsolutePosition(460, 730);
                documentoPDF.add(logo);
                
                Font fuenteTitulo = new Font(Font.FontFamily.TIMES_ROMAN,20,Font.BOLD,BaseColor.RED);
                Font leyenda = new Font(Font.FontFamily.COURIER,10,Font.NORMAL,BaseColor.BLACK);
                Font fuenteFecha = new Font(Font.FontFamily.HELVETICA,10,Font.NORMAL,BaseColor.GREEN);
                
                Paragraph encabezado = new Paragraph();
                encabezado.add(new Phrase("2017. Año del Centenario de las Constituciones Mexicana y Mexiquense de 1917", leyenda));
                encabezado.setAlignment(Element.ALIGN_CENTER);
                documentoPDF.add(encabezado);
                
                Paragraph saltoDeLinea = new Paragraph("                                      ");
                 documentoPDF.add(saltoDeLinea);
                
                Paragraph lineaEscribir = new Paragraph();
                lineaEscribir.add(new Phrase("Reporte de sesiones", fuenteTitulo));
                lineaEscribir.setAlignment(Element.ALIGN_CENTER);
                documentoPDF.add(lineaEscribir);
                
                conexionBD bd = new conexionBD();
                bd.enchufar();
                String fecha = request.getParameter("fecha");
                ResultSet resultado = bd.sesionFecha(fecha);
                
                Paragraph etiquetaFecha = new Paragraph();
                etiquetaFecha.add(new Phrase("Reporte de usuarios que iniciaron sesión el "+ fecha, fuenteFecha));
                etiquetaFecha.setAlignment(Element.ALIGN_CENTER);
                documentoPDF.add(etiquetaFecha);
                
                documentoPDF.add(saltoDeLinea);
                                
                PdfPTable table = new PdfPTable(4);
                Object[] fila = new Object[4];

                PdfPCell cell1 = new PdfPCell(new Paragraph("ID"));
                PdfPCell cell2 = new PdfPCell(new Paragraph("FECHA DE SESION"));
                PdfPCell cell3 = new PdfPCell(new Paragraph("HORA DE SESION"));
                PdfPCell cell4 = new PdfPCell(new Paragraph("ID USUARIO"));
                
                table.addCell(cell1);
                table.addCell(cell2);
                table.addCell(cell3);
                table.addCell(cell4);

                if (resultado != null) 
                {
                    while (resultado.next()) 
                    {                        
                        fila[0] = resultado.getInt("idSesion");
                        fila[1] = resultado.getString("fechaSesion");
                        fila[2] = resultado.getString("horaSesion");
                        fila[3] = resultado.getString("idUsuario");

                        table.addCell(""+fila[0]);
                        table.addCell(""+fila[1]);
                        table.addCell(""+fila[2]);
                        table.addCell(""+fila[3]);
                        
                    }
                    documentoPDF.add(table);
                }
               bd.desenchufar();
                documentoPDF.close();
            } 
            catch (Exception e) 
            {
                
            }
        }
        finally
        {
            salida.close();
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
