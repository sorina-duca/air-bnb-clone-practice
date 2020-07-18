import mapboxgl from 'mapbox-gl';

// problem with loading the zoom on map once the page has been rendered - needs hard refresh

const fitMapToMarkersInShow = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([ markers.lng, markers.lat ]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 1500 });
};

const fitMapToMarkersInIndex = (map, markers) => {
  console.log("functio called")
  const boundsIndex = new mapboxgl.LngLatBounds();
  markers.forEach(marker => boundsIndex.extend([ marker.lng, marker.lat ]));
  map.fitBounds(boundsIndex, { padding: 70, maxZoom: 15, duration: 1500 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map-show');

  if (mapElement) { // only build a map if there's a div#map-show to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map-show',
      style: 'mapbox://styles/mapbox/streets-v10',
      zoom: 8
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    new mapboxgl.Marker()
      .setLngLat([ markers.lng, markers.lat ])
      .addTo(map);

    fitMapToMarkersInShow(map, markers);
  }
};

const initMapIndex = () => {
  const mapIndex = document.getElementById('map-index');

  if (mapIndex) {
    mapboxgl.accessToken = mapIndex.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map-index',
      style: 'mapbox://styles/mapbox/streets-v10',
      zoom: 8
    });

  const markers = JSON.parse(mapIndex.dataset.markers);
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  })

    fitMapToMarkersInIndex(map, markers);
  }
};

export { initMapbox };
export { initMapIndex } ;
