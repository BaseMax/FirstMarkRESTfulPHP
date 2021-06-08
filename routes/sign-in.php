<?php
!defined("MIRESEH") ? exit() : null;

use Workerman\Protocols\Http\Response;

$api->post('/v2/sign-in[/]', function ($request) {
	// global
	global $database;
	global $serviceHeaders;

	// headers
	// $headers = parseHeaders($request);
	// $res = checkHeadersNeed($headers);
	// if($res !== null) return $res;

	// params
	$params = parseParams($request->rawBody());
	$res = checkParams($params, ["phoneNumber"]);
	if($res !== null) return $res;

	// service
	$result = [];

	$authID=generateRandomString();
	$verifyCode = rand(1000, 9999);

	$account = $database->get("account", ["id"], ["phoneNumber"=>$params["phoneNumber"]]);

	if(is_null($account)) {
		$values = [
			"phoneNumber"=>$params["phoneNumber"],
			"datetimeRegister"=>time(),
			"status"=>2, // 1=active, 2=without verification
		];
		$database->insert("account", $values);
		$accountID = $database->id();
	} else {
		$accountID = $account["id"];
	}

	if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
		$platform = 1;
	} else {
		$platform = 2;
	}

	$values = [
		"accountID"=>$accountID,
		"authID"=>$authID,
		"verifyCode"=>$verifyCode,
		"versionCode"=>1,
		"platform"=>$platform, // 1=web, 2=android, 3=ios
		"status"=>1,   // 0=banned, 1=only session, 2=normal id	
		"datetime"=>time(),
	];
	$database->insert("session", $values);

	$reqs=$database->count("session", [
		"accountID"=>$accountID,
		"status[!]"=>-1,
		"datetime[<>]"=> [time()-(86400*7), time()], // 86400s = 24h = 1 day, https://www.epochconverter.com/
	]);

	if($reqs > 10) {
		$data = createBody(1, createAlert(1, "ورود به سامانه", "به علت ورود بیش از حد در این هفته نمی توانید با این شماره تلفن وارد شوید.", 0), []);
	} else {
		$result["authID"] = $authID;
		$result["verifyCode"] = $verifyCode;
		$data = createBody(1, createAlert(1, "فعال سازی حساب", "کد فعال سازی برای شماره موبایل شما ارسال می شود.", 1), $result);
	}

	// return
	return new Response(200, $serviceHeaders, encode($data));
});

