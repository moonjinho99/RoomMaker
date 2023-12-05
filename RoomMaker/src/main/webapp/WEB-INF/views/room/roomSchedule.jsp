<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <link href='../resources/fullcalendar-5.11.5/lib/main.css' rel='stylesheet' />
    <script src='../resources/fullcalendar-5.11.5/lib/main.js'></script>
    <script
      src="https://code.jquery.com/jquery-3.4.1.min.js"
      integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
      crossorigin="anonymous"></script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
  
  <script>
    var calendarEl = document.getElementById('calendar');
    var request = $.ajax({
      url: "/calendar/event",
      method: "GET",
    });
    request.done(function(data){
      var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        events: data
      });
      calendar.render();		
    });
  </script>
</html>