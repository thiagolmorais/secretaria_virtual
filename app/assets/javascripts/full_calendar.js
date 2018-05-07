console.log('full calendar index');


$('#calendar').each(function  (){
  var calendar = $(this);
    calendar.fullCalendar({
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
        //alert(event.edit_url)
        window.location.href = event.edit_url;
         //$.getScript(event.edit_url, function() {});
       }
    });
});

/*  $("#calendar").fullCalendar({
      eventSources : [{
          url: '/consulta/new'
      }],
      eventLimit: true,
      eventRender: function(event, element) {
          if (element && event.description) {
          element.qtip({
              content: event.description,
              hide: {
                  fixed: true,
                  delay: 500
              }
          });
      }
      },
      eventClick: function(calEvent, jsEvent, view) {
          // Open in new window
          url = window.location.href;
          window.open(url + "/" + calEvent.id);
      },
      eventMouseover: function(event, jsEvent, view) {
          // Todo
      },
      eventMouseout: function(event, jsEvent, view) {
          // Todo
      },
  });*/
console.log($('#calendar'));
