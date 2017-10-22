<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.conexionBD"%>
<jsp:include page="encabezado.jsp"/>
<jsp:include page="funcionesCalendario.jsp"/>
<%int folio = Integer.parseInt(request.getParameter("folio"));
int especialTem = -1;%>
<body class="homepage">
    <div id="page-wrapper">
        <nav id="nav">
            <ul>
               <li><a href="menuPaciente.jsp?folio=<%=folio%>">Inicio</a></li>
                <li><a href="datosPersonales.jsp?folio=<%=folio%>">Datos personales</a></li>
                <li><a href="#">Expediente médico</a></li>
                <li><a href="#">Citas médicas</a>
                    <ul>
                        <li><a href="calendarioCita.jsp?folio=<%=folio%>">Generar cita</a></li>
                        <li><a href="agendaCitas.jsp?folio=<%=folio%>">Agenda de citas</a></li>
                    </ul>
                </li>
                <li><a href="../login.jsp?cerrar='true'">Cerrar sesión</a></li>
            </ul>
        </nav>
                
              <br><br>
        <center>
             <div id="main-wrapper">

    <div id="tabs">
        <div id="tabs-2">
            <div id="example" style="margin: auto; width:80%;">
                <br>
                <div class="shadow" style="border: 1px solid #aaaaaa; padding: 3px;">
                    <b>
                       Has click sobre alguna fecha para agregar cita
                        <br>
                       Recuerda que es necesario presentarse en la fecha indicada o de otra forma cancelar tu cita previemente en el sistema
                    </b>
                </div>
                <br><br>
                <div id="toolbar" class="ui-widget-header ui-corner-all" style="padding:3px; vertical-align: middle; white-space:nowrap; overflow: hidden;">
                    <button id="BtnPreviousMonth">Anterior</button>
                    <button id="BtnNextMonth">Siguiente</button>
                    &nbsp;&nbsp;&nbsp;
                    Fecha: <input type="text" id="dateSelect" size="20"/>
                    &nbsp;&nbsp;&nbsp;
                    <button id="BtnDeleteAll">Borrar todas mis citas</button> 
                </div><br>
                <div id="mycal"></div>
            </div>
            <div id="calDebug"></div>


           
            <div id="add-event-form" title="¿Generar cita en esta fecha?">
                <form name="envia" action="generarCita.jsp">
                    <input type="text" id="startDate" name="fecha" readonly="true" style="text-align:center">
                    <input type="hidden" name="folio" value="<%=folio%>">
                    <input type="hidden" name="especialidad" value="<%=especialTem%>">
                    <input type="hidden" name="doctor" value="">
                    <br>
                    <center><button type="submit" >OK</button></center>
                </form>
               
            </div>
            
        </div>
    </div>

                 <jsp:include page="piePagina.jsp"/>

