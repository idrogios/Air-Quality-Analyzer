<?php

    require '../../db/db.php';

    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET');

    $schools = $database->select('schools', [
        'sch_id',
        'sch_name',
        'sch_lat',
        'sch_long'
    ], $_GET);

    foreach ($schools as &$school) {
        $school['metrics'] = $database->select('metrics', [
            'm_id',
            'pm2_5',
            'pm10',
            'temp',
            'humidity',
            'date'
        ], [
            'sch_id' => $school['sch_id']
        ]);
    }

    print json_encode($schools);

?>