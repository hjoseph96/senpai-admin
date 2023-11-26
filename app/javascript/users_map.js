$( document ).on('turbo:load', function() {s
    const container = document.getElementById('map')
    if (container) {
        let map = L.map('map').setView([40.720430, -73.744070], 13);

        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);


        axios.get('http://localhost:3001/v1/admin/users/all_users').then((response) => {
            response.data.forEach((u) => {
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
                    `<div><img src='${u.cover_photo_url}' /></div>`
                );
            })
        })
    }

});



