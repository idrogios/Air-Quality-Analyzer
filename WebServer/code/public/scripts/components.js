import { getSchools, getSchoolLabels, getSchoolMetrics } from './data.js';
import { onEvent, transmitEvent } from './events.js';

function renderMarkers(map, schools) {
    schools.forEach(school => {
      let marker = L.marker([school.sch_lat, school.sch_long]);
      marker.on('click', () => transmitEvent('toggleSchool', school));
      marker.addTo(map);
    });
}
async function renderMap(i, container) {
    let centerCoords = [40.59688, 22.9645578];
    let zoom = 13;
    let map = L.map(container);
    map.setView(centerCoords, zoom);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    renderMarkers(map, await getSchools());
}
async function renderChart(i, container) {
    let { xs, labels } = await getSchoolLabels();
    let data = await getSchoolMetrics(container.id)
    let chart = c3.generate({
      bindto: container,
      data: {
        xs: await xs,
        columns: [
            ...await labels,
            ...await data
        ]
      }
    });
    let shownSchools = (await getSchools()).map(() => true);
    onEvent('toggleSchool', school => {
      shownSchools[school.sch_id - 1] = !shownSchools[school.sch_id - 1];
      if (shownSchools[school.sch_id - 1]) chart.show([school.sch_name]);
      else chart.hide([school.sch_name]);
    });
}

$('.map').each(renderMap);
$('.chart').each(renderChart);
