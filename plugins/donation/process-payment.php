<!DOCTYPE html>
<html>
<head>
	<link rel="shortcut icon" href="https://coderdojo.com/wp-content/themes/cd-theme/static/img/coderdojo/favicon.ico" />
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Lato:200,300,400" type="text/css">
	<link rel="stylesheet" href="https://coderdojo.com/wp-content/themes/cd-theme/static/css/style.min.css" type="text/css">
	<link rel="stylesheet" href="https://coderdojo.com/wp-content/themes/cd-theme/static/css/cd-common.min.css" type="text/css">
	<title>CoderDojo - Redirecting to our payment provider&hellip;</title>
</head>
<body class="page-template-default page">
	<h1 style="text-align: center;">Redirecting to our payment provider&hellip;</h1>

	<script src="https://js.stripe.com/v3/"></script>

	<script>
		var stripe = Stripe('pk_live_hmWhECrTqVomfEeabgcjfjS3');

		stripe.redirectToCheckout({
		  sessionId: '<?php echo $_GET['stripe_session_id']; ?>'
		});
	</script>
</body>
</html>