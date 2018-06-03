$(document).ready(function() {

//RENDER GRAFICO HOME
    var ordersSplineChart = new CanvasJS.Chart("orders-spline-chart", {
      animationEnabled: true,
      backgroundColor: "transparent",
      theme: "theme2",
      toolTip: {
        borderThickness: 0,
        cornerRadius: 0
      },
      axisX: {
        labelFontSize: 14,
        maximum: new Date("31 Dec 2018"),
        valueFormatString: "MMM YYYY"
      },
      axisY: {
        gridThickness: 0,
        labelFontSize: 14,
        lineThickness: 2
      },
      data: [
        {
          type: "spline",
          dataPoints: [
            {
              x: new Date("1 Jan 2018"),
              y: 2000
            }, {
              x: new Date("1 Feb 2018"),
              y: 3000
            }, {
              x: new Date("1 Mar 2018"),
              y: 3300
            }, {
              x: new Date("1 Apr 2018"),
              y: 1000
            }, {
              x: new Date("1 May 2018"),
              y: 500
            }, {
              x: new Date("1 Jun 2018"),
              y: 4000
            }
          ]
        }
      ]
    });

    ordersSplineChart.render();

  });
