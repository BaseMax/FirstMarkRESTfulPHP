<?php
define("MIRESEH", true);

$serviceHeaders = [
    "Content-Type" => "application/json; charset=utf-8",
    "Access-Control-Allow-Origin"=> "*",
    "Access-Control-Allow-Methods"=>"GET, POST, OPTIONS, PUT, DELETE",
    "Allow"=>"GET, POST, OPTIONS, PUT, DELETE",
    "Access-Control-Allow-Headers: sessionID, authID, Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method",
];

require 'vendor/autoload.php';

use Mark\App;
use Workerman\Protocols\Http\Response;

use Medoo\Medoo;

use Jchook\Uuid;
 
$database = new Medoo([
    "type" => "mysql",
    "host" => "localhost",
    "database" => "mireseh",
    "username" => "root",
    "password" => "01",
    // "prefix" => ""
]);


require "utiles/number.php";
require "utiles/money.php";
require "utiles/body.php";

$api = new App('http://0.0.0.0:3003');

$api->count = 4; // process count

$api->any('/', function ($request) {
    return 'Hello world!';
});

$api->get('/hello/{name}[/]', function ($request, $name) {
    // https://github.com/walkor/Workerman/blob/master/Protocols/Http.php
    print_r($request->uri());
    print_r($request->path());
    print_r($request->queryString());
    print_r($request->session());
    print_r($request->cookie());
    print_r($request->file("name"));
    print_r($request->rawHead());
    print_r($request->rawBody());

    $data = [
        "name"=>"Hello $name!",
    ];
    return new Response(200, ["Content-Type" => "application/json; charset=utf-8"], encode($data));
});

$api->post('/user/create', function ($request) {
    return encode(['code'=>0 ,'message' => 'ok']);
});

require "routes/sign-in.php";
require "routes/verification.php";
require "routes/guest.php";

$api->start();
