  $('.upcol').hide();
  $('.upcolc').hide();
  $('.upcolp').hide();
  $('.upcolf').hide();
  $('.upcolr').hide();

    function openNav() {
      document.getElementById("mySidenav").style.width = "250px";
      document.getElementById("main").style.marginLeft = "250px";
      document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
    }

    function closeNav() {
      document.getElementById("mySidenav").style.width = "0";
      document.getElementById("main").style.marginLeft = "0";
      document.body.style.backgroundColor = "white";
    }

    /Fatura/
    function openCol(){
      $('.colls').slideDown();
      $('.downcol').hide();
      $('.upcol').show();
    }

    function closeCol(){
      $('.colls').slideUp();
      $('.downcol').show();
      $('.upcol').hide();
    }

    /Consulta/
    function openColc(){
      $('.colls-c').slideDown();
      $('.downcolc').hide();
      $('.upcolc').show();
    }

    function closeColc(){
      $('.colls-c').slideUp();
      $('.downcolc').show();
      $('.upcolc').hide();
    }

    /Paciente/
    function openColp(){
      $('.colls-p').slideDown();
      $('.downcolp').hide();
      $('.upcolp').show();
    }

    function closeColp(){
      $('.colls-p').slideUp();
      $('.downcolp').show();
      $('.upcolp').hide();
    }

    /Pagamento/
    function openColf(){
      $('.colls-f').slideDown();
      $('.downcolf').hide();
      $('.upcolf').show();
    }

    function closeColf(){
      $('.colls-f').slideUp();
      $('.downcolf').show();
      $('.upcolf').hide();
    }

    /Relatórios/
    function openColr(){
      $('.colls-r').slideDown();
      $('.downcolr').hide();
      $('.upcolr').show();
    }

    function closeColr(){
      $('.colls-r').slideUp();
      $('.downcolr').show();
      $('.upcolr').hide();
    }

  $("#dropp").click(function(){
    var drop = document.querySelector(".drop-menup").style.display;
      if (drop != 'block'){
        if (document.querySelector(".drop-menuc").style.display == 'block' || document.querySelector(".drop-menupr").style.display == 'block'){
          $('.drop-menuc').slideUp();
          $('.drop-menupr').slideUp();
        }
        $('.drop-menup').slideDown();
      }
      else{
        $('.drop-menup').slideUp();
      }
  });


  $("#dropc").click(function(){
    var dropc = document.querySelector(".drop-menuc").style.display;
      if (dropc != 'block'){
        if (document.querySelector(".drop-menup").style.display == 'block' || document.querySelector(".drop-menupr").style.display == 'block'){
          $('.drop-menup').slideUp();
          $('.drop-menupr').slideUp();
        }
        $('.drop-menuc').slideDown();
      }
      else{
        $('.drop-menuc').slideUp();
      }
  });

  $("#dropr").click(function(){
    var dropr = document.querySelector(".drop-menupr").style.display;
      if (dropr != 'block'){
        if (document.querySelector(".drop-menup").style.display == 'block' || document.querySelector(".drop-menuc").style.display == 'block'){
          $('.drop-menup').slideUp();
          $('.drop-menuc').slideUp();
        }
        $('.drop-menupr').slideDown();
      }
      else{
        $('.drop-menupr').slideUp();
      }
  });

    $(document).ready(function(){
        $('.loader').fadeOut();
      document.body.style.opacity ="1";
    });

  //  if (document.querySelector("#notice").innerHTML != '') {
  //    document.querySelector(".alert-s").style.display = "block";
    //  setTimeout(function() {
    //      $('.alert-s').fadeOut(2000);
    //  }, 4000);
  //  }

  setTimeout(function() {
    $('.alert-e').fadeOut(2000);
}, 4000);

if(screen.width < 600 && screen.height < 800){
  $( "table" ).addClass( "table-responsive" );

}
$(document).scroll(function() {
  $( "nav" ).addClass( "mysticky" );
});

if(screen.width>660){
$('input[type="time"]').clockpicker({
  donetext:'Escolher'
}
);
}

 if(screen.width>660){
   $('input[type="date"]').bootstrapMaterialDatePicker({
     time: false ,
     lang : 'pt-br',
     nowButton : true,
     year: true,
     okText:'',
     cancelText:'',
   });
 }
