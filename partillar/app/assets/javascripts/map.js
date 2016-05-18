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

var map = new google.maps.Map(document.getElementById('map'), {
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




// function initMap() {
//   var customMapType = new google.maps.StyledMapType([
//       {
//         stylers: [
//           {hue: '#890000'},
//           {visibility: 'simplified'},
//           {gamma: 0.5},
//           {weight: 0.5}
//         ]
//       },
//       {
//         elementType: 'labels',
//         stylers: [{visibility: 'off'}]
//       },
//       {
//         featureType: 'water',
//         stylers: [{color: '#890000'}]
//       }
//     ], {
//       name: 'Custom Style'
//   });
//   var customMapTypeId = 'custom_style';

//   var map = new google.maps.Map(document.getElementById('map'), {
//     zoom: 12,
//     center: {lat: 40.674, lng: -73.946},  // Brooklyn.
//     mapTypeControlOptions: {
//       mapTypeIds: [google.maps.MapTypeId.ROADMAP, customMapTypeId]
//     }
//   });

//   map.mapTypes.set(customMapTypeId, customMapType);
//   map.setMapTypeId(customMapTypeId);
// }