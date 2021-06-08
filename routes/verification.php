<?php
!defined("MIRESEH") ? exit() : null;

use Workerman\Protocols\Http\Response;

$api->post('/v2/verification[/]', function ($request) {
	// global
	global $database;
	global $serviceHeaders;

	// headers
	// $headers = parseHeaders($request);
	// $res = checkHeadersNeed($headers);
	// if($res !== null) return $res;

	// params
	$params = parseParams($request->rawBody());
	$res = checkParams($params, ["verifyCode", "authID"]);
	if($res !== null) return $res;

	// service
	$result = [];

	$authID=generateRandomString();
	$verifyCode = rand(1000, 9999);

	$session = $database->get("session", ["verifyCode", "verifyCodeAttemp"], [
		"authID"=>$params["authID"]
	]);
	$session["verifyCodeAttemp"] = (int) $session["verifyCodeAttemp"];

	if(is_null($session)) {
		$data = createBody(0, createAlert(1, "خطای سرور", "مقادیر ارسال شده معتبر نیستند.", 1), []);
	} else {
		if($session["verifyCodeAttemp"] > 10) {
			$database->update("session", [
				"status"=>0, // 0=banned, 1=only session, 2=normal id
				"verifyCodeAttemp[+]"=>1
			], [
				"authID"=>$params["authID"],
				"verifyCode"=>$params["verifyCode"]
			]);

			$data = createBody(0, createAlert(1, "خطای سرور", "شما تعداد زیادی کد اشتباه وارد کردید و این نشست باطل شد لطفا خارج شوید و مجدد تلاش کنید!", 0), []);
		} else {
			if($session["verifyCode"] === $params["verifyCode"]) {
				$sessionID=generateRandomString();
				$result["sesionID"] = $sessionID;

				$database->update("session", [
					"status"=>2, // 0=banned, 1=only session, 2=normal id
					"sessionID"=>$sessionID,
					"verifyCodeAttemp[+]"=>1
				], [
					"authID"=>$params["authID"],
					"verifyCode"=>$params["verifyCode"]
				]);

				$data = createBody(1, createAlert(1, "", "به میرسه خوش آمدید.", 1), $result);
			} else { // user verifyCode is not correct!
				$database->update("session", ["verifyCodeAttemp[+]"=>1], [
					"authID"=>$params["authID"],
				]);

				$data = createBody(0, createAlert(1, "فعال سازی حساب", "کد وارد شده معتبر نیست.", 1), []);
			}
		}
	}

	// return
	return new Response(200, $serviceHeaders, encode($data));
});

