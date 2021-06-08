<?php
!defined("MIRESEH") ? exit() : null;

use Workerman\Protocols\Http\Response;

$api->post('/v2/guest[/]', function ($request) {
	// global
	global $database;
	global $serviceHeaders;

	// headers
	// $headers = parseHeaders($request);
	// $res = checkHeadersNeed($headers);
	// if($res !== null) return $res;

	// params
	$params = parseParams($request->rawBody());
	$res = checkParamsEmpty($params);
	if($res !== null) return $res;

	// service
	$result = [];

	$authID=generateRandomString();
	$sessionID=generateRandomString();

	$values = [
		"authID"=>$sessionID,
		"sessionID"=>$sessionID,
		"datetimeRegister"=>time(),
		"datetimeLastUse"=>time(),
	];

	$database->insert("guest", $values);
	$result = $values;
	$data = createBody(1, createAlert(1, "میرسه", "مهمان گرامی خوش آمدید.", 1), $result);

	// return
	return new Response(200, $serviceHeaders, encode($data));
});

