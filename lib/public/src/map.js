var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('mapContainer'), {
    center: {lat: 40, lng: -104},
    zoom: 8
  });
}
