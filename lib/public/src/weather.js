$(document).ready(function(){

  $(".getWeather").click(function(){
    showCity();
   weatherInfo();
  });

  function showCity(){
    var city = $("#city").val();
    $(".city").text(city);
  };

  function showWeather(info) {
      $(".weather").text(info.list[0].weather[0].description)
  };

  function showTemp(info) {
    $("#cityTemp").text(Math.round(info.list[0].temp.day) + "°C");
  }
  function weatherInfo() {
    var city = $("#city").val();
    $.getJSON("http://api.openweathermap.org/data/2.5/forecast/daily?q="+city+"&mode=json&units=metric&cnt=10",function(result){
            showWeather(result);
            showTemp(result);
            });
        };


});
