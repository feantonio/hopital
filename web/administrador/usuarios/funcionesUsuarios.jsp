     <script>
        function eliminaUsuario(id)
        {
            alertify.confirm("�Seguro de borrar la clave " + id + "?", function (respuesta)
            {
                if (respuesta)
                {
                    location.href = "borrarUsuario.jsp?id=" + id;
                }
            });
        }
    </script>
        <script>
        $(function () {
            $("#alta").dialog({
                autoOpen: false,
                show: {
                    effect: "drop",
                    duration: 1000
                },
                hide: {
                    effect: "explode",
                    duration: 1000
                }
            });
            $("#nuevoUsuario").on("click", function () {
                $("#alta").dialog("open");
            });
        });

    </script>

    <!--<script>
        function usuarios() {
            div = document.getElementById('registroUsuarios');
            div.style.display = '';
            
            div = document.getElementById('historial');
            div.style.display = 'none';
        }
        function sesiones() {
            div = document.getElementById('historial');
            div.style.display = '';
            
            div = document.getElementById('registroUsuarios');
            div.style.display = 'none';
        }
    </script>  <a href="javascript:usuarios();">--!>