// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"

import "controllers"
import "chartkick"
import "Chart.bundle"

$( document ).on('turbo:load', function() {
    const usersDatatable = document.getElementById('users-datatable')
    if (usersDatatable)
        $("#users-datatable ").DataTable();

    const reportsDatatable = document.getElementById('reports-datatable')
    if (reportsDatatable)
        $("#reports-datatable ").DataTable();


    const container = document.getElementById('map')
    if (container) {
        let map = L.map('map').setView([40.720430, -73.744070], 13);

        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);


        axios.get('https://api.senpaiapp.com/v1/admin/users/all_users').then((response) => {
            response.data.forEach((u) => {
                if (u.latlong.lat === null)
                    return;

                let iconUrl = ''

                if (u.gender === 'female') {
                    iconUrl = 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-red.png'
                } else {
                    iconUrl = 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-blue.png'
                }

                var icon = new L.Icon({
                    iconUrl: iconUrl,
                    shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
                    iconSize: [25, 41],
                    iconAnchor: [12, 41],
                    popupAnchor: [1, -34],
                    shadowSize: [41, 41]
                });

                L.marker([u.latlong.lat, u.latlong.long], { icon: icon }).
                    addTo(map).
                    bindPopup(
                        `<h3>${u.first_name}</h3>` +
                        `<div><a href="/users/${u.id}"><img src='${u.cover_photo_url}' /></a></div>`
                    )
                ;
            })
        })
    }

    let gallery = document.getElementById('image-carousel');
    if (gallery)
        new Splide( '#image-carousel').mount();

    gallery = document.getElementById('verify-carousel');
    if (gallery)
        new Splide( '#verify-carousel', {  perPage: 3, arrows: true, loop: true }).mount();

});



