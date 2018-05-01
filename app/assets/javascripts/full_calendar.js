console.log('full calendar index');


$('#calendar').each(function(){
  var calendar = $(this);
    calendar.fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      eventSources : [{
          url: '/consulta/new'
      }],
      //events: '/events.json',
      events: [
    {
      title: 'Evento1',
      start: '2018-04-30',
      end: '2018-05-01',
      description: 'This is a cool event'
    },
    {
      title: 'Evento2',
      start: '2018-04-30',
      end: '2018-05-01',
      description: 'This is a cool event'
    },
    {
      title: 'Evento3',
      start: '2018-05-01',
      end: '2018-05-01',
      description: 'This is a cool event'
    },
  ],


      select: function(start, end) {
        //alert('clicou');
        window.location.href = "consultas/new";

        //$.getScript('/consultas/new', function() {});

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
        alert('clicou evento');
        // $.getScript(event.edit_url, function() {});
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
