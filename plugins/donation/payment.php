<?php

require_once('stripe-php-6.3.0/init.php');
require_once('wp-config.php');

// Set your secret key: remember to change this to your live secret key in production
// See your keys here: https://dashboard.stripe.com/account/apikeys
\Stripe\Stripe::setApiKey(WP_STRIPE_KEY);

// Token is created using Checkout or Elements!
// Get the payment token ID submitted by the form:
$token = $_POST['stripeToken'];
$email = $_POST['email'];
$amount = $_POST['amount'];

// Charge the user's card:
try {
  $charge = \Stripe\Charge::create(array(
    "amount" => $amount,
    "currency" => "eur",
    "description" => $email,
    "source" => $token,
  ));
} catch(Stripe_CardError $e) {
  // The card has been declined
}

