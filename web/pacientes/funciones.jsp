<script type="text/javascript">
    function validarLetras(e) { // 1
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla == 8)
            return true; // backspace
        if (tecla == 32)
            return true; // espacio
        if (e.ctrlKey && tecla == 86) {
            return true;
        } //Ctrl v
        if (e.ctrlKey && tecla == 67) {
            return true;
        } //Ctrl c
        if (e.ctrlKey && tecla == 88) {
            return true;
        } //Ctrl x

        patron = /[a-zA-Z]/; //patron

        te = String.fromCharCode(tecla);
        return patron.test(te); // prueba de patron
    }
</script>

<script type="text/javascript">
    function validarNumeros(e) { // 1
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla == 8)
            return true; // backspace
        if (tecla == 32)
            return false; // espacio
        if (e.ctrlKey && tecla == 86) {
            return true;
        } //Ctrl v
        if (e.ctrlKey && tecla == 67) {
            return true;
        } //Ctrl c
        if (e.ctrlKey && tecla == 88) {
            return true;
        } //Ctrl x

        patron = /[0-9]/; //patron

        te = String.fromCharCode(tecla);
        return patron.test(te); // prueba de patron
    }
</script>
<script type="text/javascript">
    function validarPrecios(e) { // 1
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla == 8)
            return true; // backspace
        if (tecla == 32)
            return false; // espacio
        if (e.ctrlKey && tecla == 86) {
            return true;
        } //Ctrl v
        if (e.ctrlKey && tecla == 67) {
            return true;
        } //Ctrl c
        if (e.ctrlKey && tecla == 88) {
            return true;
        } //Ctrl x

        patron = /[0-9 .]/; //patron

        te = String.fromCharCode(tecla);
        return patron.test(te); // prueba de patron
    }
</script>

<script type="text/javascript">
        function eliminaCita(id, folio)
        {
            alertify.confirm("¿Seguro de cancelar cita?", function (respuesta)
            {
                if (respuesta)
                {
                    location.href = "eliminarCita.jsp?id=" + id"&&folio="+folio;
                }
            });
        }
</script>

