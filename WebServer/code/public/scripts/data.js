let schools = (async () => {
    let response = await fetch('http://lessons.idrogios.com/Air-Quality-Analyzer/Air-Quality-Analyzer/rest/get.php');
    return await response.json();
})();

export async function getSchools() {
    return await schools;
}
export async function getSchoolLabels() {
    let xs = {};
    let labels = [];
    (await schools).forEach(school => {
        let xAxis = `sch_${school.sch_id}`;
        let timestamps = school.metrics.map(
            metric => {
                let timestamp = metric.date;
                let filteredTimestamp = timestamp.replace(/-/g, '').replace(/ /g, '').replace(/:/g, '').substring(0,10);
                let timestampNumber = parseInt(filteredTimestamp) / 100;
                return timestampNumber;
            }
        );
        xs[school.sch_name] = xAxis;
        labels.push([xAxis, ...timestamps]);
    });
    return { xs, labels };
}
export async function getSchoolMetrics(datatype) {
    return (await schools).map(school => {
        let name = school.sch_name;
        let metrics = school.metrics.map(
            metric => parseInt(metric[datatype])
        );
        return [name, ...metrics];
    });
}
