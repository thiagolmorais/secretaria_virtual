$(document).ready(function() {
    $('#inputLGEx').keyup(function() {
        buscaPaciente($(this).val());
    });

    function buscaPaciente(value) {
        $('.buscar').each(function() {
            var found = 'false';
            $(this).each(function() {
                if ($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0)
                    {
                    found = 'true';
                    }
            });
            if (found === 'true')
            {
                $(this.parentNode).show();
            } else
            {
                $(this.parentNode).hide();
            }
        });
    }

});
