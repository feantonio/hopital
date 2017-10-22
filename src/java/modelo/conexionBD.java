package modelo;
import java.sql.*;
import org.apache.commons.codec.digest.DigestUtils;

public class conexionBD 
{
     private ResultSet resultadoBusqueda, resultadoVer;
    private Connection variableConexion;
    private String servidorBD,userBD,passwordBD;
    private boolean conectado,registrado;
    private int tipoUsuario;
    
    public boolean enchufar()
    {
        try 
        {
           Class.forName("org.gjt.mm.mysql.Driver");
            try 
            {
                servidorBD="jdbc:mysql://localhost/hospital";
                userBD="root";
                passwordBD="";
                variableConexion=DriverManager.getConnection(servidorBD, userBD, passwordBD);
                conectado=true;
            } 
            catch (Exception e) 
            {
                variableConexion=null;
                conectado=false;
            }
        }
        catch (ClassNotFoundException e) 
        {
            variableConexion=null;
            conectado=false;
        }
        return conectado;
    }
    public void desenchufar()
    {
        try 
        {
          if(variableConexion!=null)
              variableConexion.close();
        } 
        catch (Exception e) 
        {
            
        }
    }
    
       public int buscaUsuario(String user, String password)
    {
        try 
        {
            String sqlBuscar = "Select *from usuarios where usuario='"+user+"' and contrasena='"+password+"'";
            Statement buscar = variableConexion.createStatement();
            ResultSet resultado = buscar.executeQuery(sqlBuscar);
            int totalUsuarios = 0;
            if(resultado != null)
            {
                while (resultado.next()) 
                {                    
                    totalUsuarios++;
                    tipoUsuario=resultado.getInt("tipo");
                }
                if(totalUsuarios !=1)
                {
                    tipoUsuario = -1;
                }
            }
        } 
        catch (Exception e)
        {
            tipoUsuario = -1;
        }
        return tipoUsuario;
    }
        public ResultSet buscar(String busqueda)
    {
        try 
        {
            Statement objStaVerEspecialidad=variableConexion.createStatement();
            resultadoBusqueda = objStaVerEspecialidad.executeQuery(busqueda);
            
        } 
        catch (Exception e) 
        {
            resultadoBusqueda=null;
        }
        return resultadoBusqueda;
    }
    public boolean registrarSesion (String fecha, String hora, int id)
    {
        try 
        {
            String sqlSesion="insert into sesiones values (?,?,?,?)";
            PreparedStatement sesion=variableConexion.prepareStatement(sqlSesion);
            sesion.setInt(1,0);
            sesion.setString(2, fecha);
            sesion.setString(3, hora);
            sesion.setInt(4, id);

            sesion.executeUpdate();
            registrado = true;
        } 
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
    }
    public boolean registrarUsuario(String usario, String password, int tipo)
    {
        try 
        {
            String sqlUsuario="insert into usuarios values (?,?,?,?)";
            PreparedStatement user=variableConexion.prepareStatement(sqlUsuario);
            user.setInt(1,0);
            user.setString(2, usario);
            user.setString(3, password);
            user.setInt(4, tipo);

            user.executeUpdate();
            registrado = true;
        } 
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
    }
     public ResultSet ver(String tabla)
    {
        try 
        {
            String sqlVer="select *from " + tabla;
            Statement verTabla=variableConexion.createStatement();
            resultadoVer=verTabla.executeQuery(sqlVer);
            
        } 
        catch (Exception e) 
        {
            resultadoVer=null;
        }
        return resultadoVer;
    }
         public boolean ejecutarSentencia(String sql)
    {
        try 
        {
           Statement stEjecutar=variableConexion.createStatement();
           stEjecutar.executeUpdate(sql);
           registrado = true;
        }
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
    }
    public ResultSet sesionFecha(String fecha)
    {
        try 
        {
            String sqlfecha="select *from sesiones where fechaSesion='"+ fecha +"'";
            Statement verTabla=variableConexion.createStatement();
            resultadoVer=verTabla.executeQuery(sqlfecha);
            
        } 
        catch (Exception e) 
        {
            resultadoVer=null;
        }
        return resultadoVer;
    }
     public ResultSet usuario(int idUser)
    {
        try 
        {
            String sqlfecha="select *from usuarios where idUsuario="+ idUser;
            Statement verTabla=variableConexion.createStatement();
            resultadoVer=verTabla.executeQuery(sqlfecha);
            
        } 
        catch (Exception e) 
        {
            resultadoVer=null;
        }
        return resultadoVer;
    }
    public boolean registrarPaciente(String nombre, String foto, 
                 String fecha, String sexo, String curp, String calle,
                 String num, String colonia, String telefono,
                 String municipio, String estado, String pais)
    {
        try 
        {
            String sql="insert into pacientes values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement dato = variableConexion.prepareStatement(sql);
            dato.setInt(1,0);
            dato.setString(2, nombre.toUpperCase());
            dato.setString(3, foto);
            dato.setString(4, fecha);
            dato.setString(5, sexo);
            dato.setString(6, curp.toUpperCase());
            dato.setString(7, calle.toUpperCase());
            dato.setString(8, num);
            dato.setString(9, colonia.toUpperCase());
            dato.setString(10, telefono);
            dato.setString(11, municipio.toUpperCase());
            dato.setString(12, estado.toUpperCase());
            dato.setString(13, pais.toUpperCase());

            dato.executeUpdate();
            registrado = true;
        } 
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
    }
    
    public boolean registrarDoctor(int cedula, String nombre, String curp, 
                 String foto, String sexo, String fecha, String nacion, String calle,
                 String num, String colonia, String telefono,
                 String municipio, String estado, String pais, int especialidad)
    {
        try 
        {
            String sql="insert into doctores values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement dato = variableConexion.prepareStatement(sql);
            dato.setInt(1,0);
            dato.setInt(2, cedula);
            dato.setString(3, nombre.toUpperCase());
            dato.setString(4, curp.toUpperCase());
            dato.setString(5, foto);
            dato.setString(6, sexo);
            dato.setString(7, fecha);
            dato.setString(8, nacion.toUpperCase());
             dato.setString(9, calle.toUpperCase());
            dato.setString(10, num);
            dato.setString(11, colonia.toUpperCase());
            dato.setString(12, telefono);
            dato.setString(13, municipio.toUpperCase());
            dato.setString(14, estado.toUpperCase());
            dato.setString(15, pais.toUpperCase());
            dato.setInt(16, especialidad);

            dato.executeUpdate();
            registrado = true;
        } 
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
    }
    public boolean registrarEspecialidad(String especialidad, double costo)
    {
        try 
        {
            String sql="insert into especialidades values (?,?,?)";
            PreparedStatement dato=variableConexion.prepareStatement(sql);
            dato.setInt(1,0);
            dato.setString(2, especialidad);
            dato.setDouble(3, costo);

            dato.executeUpdate();
            registrado = true;
        } 
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
    }
    
    public boolean registrarCita(String fecha, String hora, int estado, int folio, int idDoctor)
    {
        try 
        {
            String sql="insert into citas values (?,?,?,?,?,?)";
            PreparedStatement dato = variableConexion.prepareStatement(sql);
            dato.setInt(1,0);
            dato.setString(2, fecha);
            dato.setString(3, hora);
            dato.setInt(4, estado);
            dato.setInt(5, folio);
            dato.setInt(6, idDoctor);

            dato.executeUpdate();
            registrado = true;
        } 
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
    }
    
    public boolean registrarExpediente(String fecha, double peso, double talla, double temperatura,
                                       String sangre, int folio, int idCita)
    {
        try 
        {
            String sql="insert into expediente values (?,?,?,?,?,?,?,?)";
            PreparedStatement dato = variableConexion.prepareStatement(sql);
            dato.setInt(1,0);
            dato.setString(2, fecha);
            dato.setDouble(3, peso);
            dato.setDouble(4, talla);
            dato.setDouble(5, temperatura);
            dato.setString(6, sangre);
            dato.setInt(7, folio);
            dato.setInt(8, idCita);

            dato.executeUpdate();
            registrado = true;
        } 
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
    }
     public boolean registrarSintomas(String nombre, String descripcion, String diagnostico, int idExpediente)
    {
        try 
        {
            String sql="insert into sintomaspac values (?,?,?,?,?)";
            PreparedStatement dato = variableConexion.prepareStatement(sql);
            dato.setInt(1,0);
            dato.setString(2, nombre.toUpperCase());
            dato.setString(3, descripcion.toUpperCase());
            dato.setString(4, diagnostico.toUpperCase());
            dato.setInt(5, idExpediente);

            dato.executeUpdate();
            registrado = true;
        } 
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
    }
     
    public boolean registrarAlergias(String nombre, String descripcion, int folio)
    {
        try 
        {
            String sql="insert into alergias values (?,?,?,?)";
            PreparedStatement dato = variableConexion.prepareStatement(sql);
            dato.setInt(1,0);
            dato.setString(2, nombre.toUpperCase());
            dato.setString(3, descripcion.toUpperCase());
            dato.setInt(4, folio);

            dato.executeUpdate();
            registrado = true;
        } 
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
    }
     public boolean registrarTratamiento(String medicina, String dosis, String duracion, int idExpediente)
    {
        try 
        {
            String sql="insert into tratamientos values (?,?,?,?,?)";
            PreparedStatement dato = variableConexion.prepareStatement(sql);
            dato.setInt(1,0);
            dato.setString(2, medicina.toUpperCase());
            dato.setString(3, dosis.toUpperCase());
            dato.setString(4, duracion.toUpperCase());
            dato.setInt(5, idExpediente);

            dato.executeUpdate();
            registrado = true;
        } 
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
    } 
    public boolean registrarHospitalizar(int cama, String entrada, String salida, int idExpediente)
    {
        try 
        {
            String sql="insert into hospitalizacion values (?,?,?,?,?)";
            PreparedStatement dato = variableConexion.prepareStatement(sql);
            dato.setInt(1,0);
            dato.setInt(2, cama);
            dato.setString(3, entrada);
            dato.setString(4, salida);
            dato.setInt(5, idExpediente);

            dato.executeUpdate();
            registrado = true;
        } 
        catch (Exception e) 
        {
            registrado = false;
        }
        return registrado;
    } 
}
