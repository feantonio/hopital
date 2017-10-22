
<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<jsp:include page="encabezado.jsp"/>
<%
    String folio = request.getParameter("folio");
    conexionBD conBD = new conexionBD();
   
    ResultSet resultadoBusqueda;

    if (conBD.enchufar()) 
    {
        resultadoBusqueda = conBD.buscar("Select *from doctores where cedula= '" + folio + "'");
        if (resultadoBusqueda.next()) 
        {
            conBD.desenchufar();
            %>
    
<body class="homepage">
    <div id="page-wrapper">
        <nav id="nav">
            <ul>
                <li><a href="menuDoctor.jsp?folio=<%=folio%>">Inicio</a></li>
                <li><a href="datosPersonales.jsp?folio=<%=folio%>">Datos personales</a></li>
                <li><a href="citasMedicas.jsp?folio=<%=folio%>">Citas m�dicas</a></li>
                <li><a href="../login.jsp?cerrar='true'">Cerrar sesi�n</a></li>
            </ul>
        </nav>
        <center>               
            <div id="main-wrapper">

                <div id="main-wrapper">
                    <br><br>
                    <div>
                        <div>
                            <div class="9u 12u(mobile) important(mobile)">
                                <div class="content content-right">
                                    <article class="box page-content">
                                        <header>
                                            <p>BIENVENIDO AL SISTEMA DEL HOSPITAL GENERAL</p>
                                        </header>

                                        <section>
                                            <span class="image featured"><img src="../img/doctor.jpg" alt="" /></span>
                                            <p>
                                                Los procesos que se pueden realizar son limitados al sistema debido
                                                a que se ha iniciado sesion como doctor
                                            </p>
                                        </section>
                                    </article>

                                </div>
                            </div>
                        </div>

                    </div>
                    <br><br>
                </div>

                <jsp:include page="piePagina.jsp"/>
<%
    }
 else
        {
            %>
               <script>
                alertify.error("No se encontraron sus datos verifica con el administrador");
                 setTimeout("location.href='../login.jsp?cerrar=true'", 2000);
            </script>
            <%
        }
    } 
    else
    {
            %>
            <script>
                alertify.error("Error al conectarse");
            </script>    
            <%
    }
%>
