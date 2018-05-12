
  console.log('full calendar index');

  $('#calendar').each(function  (){
    console.log($(this))
    console.log($('#calendar'))
    console.log($(this) === $('#calendar'));
  var calendar = $('#calendar');
    calendar.fullCalendar({
   //    if $(window).width() < 514){
   //   defaultView: 'basicDay'
   // },

      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listWeek'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      events : 'consultas.json',

      select: function(start, end) {

        window.location.href = "consultas/new";

        calendar.fullCalendar('unselect');
      },

      eventDrop: function(event, delta, revertFunc) {
        event_data = {
          event: {
            id: event.id,
            start: event.start.format(),
            end: event.end.format()
          }
        };
        $.ajax({
            url: event.update_url,
            data: event_data,
            type: 'PATCH'
        });
      },

      eventClick: function(event, jsEvent, view) {
        window.location.href = event.edit_url;
       }
    });
});
