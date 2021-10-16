<?php

  require '../../db/db.php';

  // Fix cors error - allow api to be used in javascript
  header('Access-Control-Allow-Origin: *');
  header('Access-Control-Allow-Methods: POST');

  // If authentication not included error
  if (!isset($_SERVER['PHP_AUTH_USER'])) {
    header('WWW-Authenticate: Basic realm="My Realm"');
    header('HTTP/1.0 401 Unauthorized');
    die('Error: Authentication header not included');
  }

  // Select schools with sch_id
  $sch_id = $_SERVER['PHP_AUTH_USER'];
  $schools = $database->select('schools', [
    'password'
  ], [
    'sch_id' => $sch_id
  ]);

  // Store password
  $password = $_SERVER['PHP_AUTH_PW'];
  $hashed_pass = $schools[0]['password'];
  if (!password_verify($password, $hashed_pass)) {
    // If password incorrect error
    header('HTTP/1.0 403 Forbidden');
    die('Incorrect password');
  } else {
    // Else insert metrics
    $json = file_get_contents('php://input');
    $metrics = json_decode($json, true);
    foreach ($metrics as $metric) {
      if ($metric["sch_id"] == $sch_id) $database->insert('metrics', $metric);
    }
  }

?>
