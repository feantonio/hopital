<%
    HttpSession sesion = request.getSession();
    String usuario, tipo;

    if (sesion.getAttribute("user") != null && sesion.getAttribute("pass") != null && sesion.getAttribute("tipo") != null) {
        usuario = sesion.getAttribute("user").toString();
        tipo = sesion.getAttribute("tipo").toString();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<html>
    <head>
        <title>Hospital</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="../css/template/main.css" />
        <link href="../css/template/ie8.css" rel="stylesheet" type="text/css"/>
        <link href="../css/alertas/alertify.core.css" rel="stylesheet" type="text/css"/>
        <link href="../css/alertas/alertify.default.css" rel="stylesheet" type="text/css"/>

        <link href="../css/query/bootstrapventana.css" rel="stylesheet" type="text/css"/>
        <link href="../css/query/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="../css/query/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <script src="../js/template/jquery.min.js"></script>
    <script src="../js/template/jquery.dropotron.min.js"></script>
    <script src="../js/template/skel.min.js"></script>
    <script src="../js/template/skel-viewport.min.js"></script>
    <script src="../js/template/util.js"></script>
    <script src="../js/template/main.js"></script>
    <script src="../js/alertas/alertify.js" type="text/javascript"></script>
    <script src="../js/query/jquery-1.12.4.js" type="text/javascript"></script>
    <script src="../js/query/jquery-ui.js" type="text/javascript"></script>
    
    <link href="../css/calendario/jquery-frontier-cal-1.3.2.css" rel="stylesheet" type="text/css"/>
    <link href="../css/calendario/jquery-ui-1.8.1.custom.css" rel="stylesheet" type="text/css"/>
    <script src="../js/calendario/jquery-1.4.2-ie-fix.min.js" type="text/javascript"></script>
    <script src="../js/calendario/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
    <script src="../js/calendario/jquery.qtip-1.0.js" type="text/javascript"></script>
    <script src="../js/calendario/jshashtable-2.1.js" type="text/javascript"></script>
    <script src="../js/calendario/jquery-frontier-cal-1.3.2.min.js" type="text/javascript"></script>
            
    <jsp:include page="funciones.jsp"/>
    <%} else {
    %>
    <script>
        location.replace("../login.jsp");
    </script> 
    <%
        }
    %>


