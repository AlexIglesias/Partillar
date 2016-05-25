var map;
var ajaxWrapper;
var markers = [];
var marker;
var lastOpenedInfoWindow;

function initMap() {
	var customMapType = new google.maps.StyledMapType([
    {
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#444444"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
            {
                "color": "#f2f2f2"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "labels.text",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "hue": "#ff0000"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "saturation": -100
            },
            {
                "lightness": 45
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#10ade4"
            },
            {
                "visibility": "on"
            }
        ]
    }
], {
      name: 'Custom Style'
});
var customMapTypeId = 'custom_style';

map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 42.836500, lng: -7.9833007},
  zoom: 8,
  disableDefaultUI: true,
  mapTypeControlOptions: {
      mapTypeIds: [google.maps.MapTypeId.ROADMAP, customMapTypeId]
    }
  });
  map.mapTypes.set(customMapTypeId, customMapType);
  map.setMapTypeId(customMapTypeId);
}



function createMarker(){
  var marker = new google.maps.Marker({
    position: position,
    map: map
    });
};

ajaxWrapper = function(undefined) {

    _searchTitle = function () {
        var data = document.getElementsByClassName('js-search-title');
        var query = '/search?infocard[title]=' + data[0].value;
        return _proxy('GET', query);
    };
    _proxy = function(method, url) {
        return new Promise(function(resolve, reject) {
            var xhr = new XMLHttpRequest();

            xhr.open(method, url);
            xhr.responseType = 'json';

            xhr.onload = function() {
                if (xhr.status === 200){
                    resolve(xhr.response);
                    console.log("Erroraco");
                } else {
                    reject(xhr.statusText);
                }
            };
            xhr.onerror = function() {
                reject('Error');
            }
            xhr.send();
        });
    };
    return {
        searchTitle    : _searchTitle
    }
}();

document.addEventListener('DOMContentLoaded', function() {

    document.getElementsByClassName('js-search-form')[0].addEventListener("submit", function(event){
        event.preventDefault();
        if (markers.length > 0) {
            deleteMarkers();
        }
        ajaxWrapper.searchTitle().then(function(response){
            response.infocards.forEach(function(infocard){
                console.log(infocard.location.name, infocard.location.latitude, infocard.location.longitude);
                createMarker({lat: infocard.location.latitude, lng: infocard.location.longitude}, infocard);
            });
        });
    });
});


function createMarker(position, infocard) {
    console.log(infocard)
    var icon = {
        url: "images/map-marker.png"
    }
    marker = new google.maps.Marker({
    position: position,
    animation: google.maps.Animation.DROP,
    map: map,
    icon: icon
    });
    markers.push(marker);
    var contentInfoCard = '<div id="iw-container iw-bottom-gradient" class="">' +
                         '<h3 class="iw-title uk-text-center">' + infocard.title + '</h3>' +
                            '<hr>' +
                            '<ul class="">' +
                            '<li>' + 'Localización: ' + infocard.location.name + '</li>' +
                            '<li>' + 'Fuente: ' + infocard.source + '</li>' +
                            '<li>' + '<a href="/infocards/' + infocard.id + '" class="infowindow_link uk-icon-hover uk-icon-plus-square-o uk-icon-small" data-remote="true">' + ' Ver más' + '</a>'  + '</li>' 
                        '</ul>' +
                        '</div>'


    var infowindow = new google.maps.InfoWindow({
        content: contentInfoCard
    });
    marker.addListener('click', function() {
        closeLastOpenedInfoWindow();
        infowindow.open(map, this);
        lastOpenedInfoWindow = infowindow;
        var iwOuter = $('.gm-style-iw');
        var iwBackground = iwOuter.prev();
        iwBackground.children(':nth-child(2)').css({'display' : 'none'});
        iwBackground.children(':nth-child(4)').css({'display' : 'none'});
        iwBackground.children(':nth-child(1)').attr('style', function(i,s){ return s + 'left: 76px !important;'});
        iwBackground.children(':nth-child(3)').attr('style', function(i,s){ return s + 'left: 76px !important;'});
        iwBackground.children(':nth-child(3)').find('div').children().css({'box-shadow': 'rgba(72, 181, 233, 0.6) 0px 1px 6px', 'z-index' : '1'});
        var iwCloseBtn = iwOuter.next();
        iwCloseBtn.css({
          opacity: '1', 
          right: '14px', top: '5px',
          border: '4px solid #48b5e9', 
          'border-radius': '20px', 
          'box-shadow': '0 0 3px #3990B9' 
        });
        iwCloseBtn.mouseout(function(){
          $(this).css({opacity: '1'});
        });
    });
}
function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}
function clearMarkers() {
  setMapOnAll(null);
}
function deleteMarkers() {
  clearMarkers();
  markers = [];
}
function closeLastOpenedInfoWindow() {
    if (lastOpenedInfoWindow) {
        lastOpenedInfoWindow.close();
    }
}



