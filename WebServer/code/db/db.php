<?php

    require '../../vendor/autoload.php';
    use Medoo\Medoo;

    $database = new Medoo([
        'database_type' => 'mysql',
        'database_name' => 'lessons_air-quality',
        'server' => 'localhost',
        'username' => '',
        'password' => ''
    ]);

?>
