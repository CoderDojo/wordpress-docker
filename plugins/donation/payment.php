<?php

require_once('stripe-php-7.0.2/init.php');
require_once('wp-config.php');

\Stripe\Stripe::setApiKey(WP_STRIPE_KEY);

$amount = $_POST['amount'];

// Create a session and redirect:
$session = \Stripe\Checkout\Session::create([
	'payment_method_types' => ['card'],
	'line_items' => [[
		'name' => 'CoderDojo Donation',
		'description' => 'CoderDojo Donation',
		'amount' => $amount,
		'currency' => 'eur',
		'quantity' => 1,
	]],
	'success_url' => 'https://coderdojo.com/donate/success/',
	'cancel_url' => 'https://coderdojo.com/donate/',
]);

header("Location: /process-payment.php?stripe_session_id=" . $session['id']);
die();
