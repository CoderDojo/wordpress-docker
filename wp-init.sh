echo "Extend wp-config"

wp config set AUTH_KEY "$WP_AUTH_KEY" --type=constant --allow-root
wp config set SECURE_AUTH_KEY "$WP_SECURE_AUTH_KEY" --type=constant --allow-root
wp config set LOGGED_IN_KEY "$WP_LOGGED_IN_KEY" --type=constant --allow-root
wp config set NONCE_KEY "$WP_NONCE_KEY" --type=constant --allow-root
wp config set AUTH_SALT "$WP_AUTH_SALT" --type=constant --allow-root
wp config set SECURE_AUTH_SALT "$WP_SECURE_AUTH_SALT" --type=constant --allow-root
wp config set LOGGED_IN_SALT "$WP_LOGGED_IN_SALT" --type=constant --allow-root
wp config set NONCE_SALT "$WP_NONCE_SALT" --type=constant --allow-root
echo "Salts and keys set"

wp config set S3_UPLOADS_BUCKET "$WP_S3_BUCKET" --type=constant --allow-root
wp config set S3_UPLOADS_KEY "${WP_S3_KEY-}" --type=constant --allow-root --quiet
wp config set S3_UPLOADS_SECRET "${WP_S3_SECRET-}" --type=constant --allow-root --quiet
wp config set S3_UPLOADS_REGION "$WP_S3_REGION" --type=constant --allow-root
wp config set S3_UPLOADS_BUCKET_URL "$WP_S3_URL" --type=constant --allow-root
echo "Extend with s3-upload conf"
# TODO : EFS to share the logs between instances of WP
wp config set SUCURI_DATA_STORAGE "/var/log/sucuri" --type=constant --allow-root
wp config set DISALLOW_FILE_EDIT true --type=constant --raw --allow-root
echo "Extended with Sucuri defaults"
wp config set WP_STRIPE_KEY "${WP_STRIPE_KEY-}" --type=constant --allow-root
echo "Extended with Stripe creds"

wp core install --url="http://localhost:8000/" --title="Your Blog Title" --admin_user="wordpress" --admin_password="wordpress" --admin_email="wpadmin@example.com"  --allow-root

wp option update permalink_structure '/%year%/%monthnum%/%day%/%postname%/' --allow-root

wp plugin is-installed hello --allow-root
if [ $? -eq 0 ]
then
  wp plugin delete hello --allow-root
fi

wp plugin is-installed akismet --allow-root
if [ $? -eq 0 ]
then
  wp plugin delete akismet --allow-root
fi

wp plugin activate antispam-bee --allow-root
wp plugin activate caldera-forms --allow-root
wp plugin activate wp-fastest-cache --allow-root
wp plugin activate google-captcha --allow-root
wp plugin activate google-sitemap-generator --allow-root
wp plugin activate pods --allow-root
wp plugin activate redirection --allow-root
wp plugin activate tablepress --allow-root
wp plugin activate timber-library --allow-root
wp plugin activate wordpress-seo --allow-root
wp plugin activate wp-mail-smtp --allow-root
wp plugin activate sassy-social-share --allow-root
wp plugin activate sucuri-scanner --allow-root
# Recommended plugins for dev 
# wp plugin install cron-view --activate --allow-root
# wp plugin install user-role-editor --activate --allow-root

chown -R "www-data:www-data" /var/log/sucuri
chmod -R 755 /var/log/sucuri
# Retrigger starting hooks by de-activating our plugin
wp plugin deactivate activator --allow-root
wp plugin activate activator --allow-root

if [[ -n "${WP_S3_SECRET-}" ]]
then
  wp plugin activate S3-Uploads --allow-root
  wp s3-uploads verify --allow-root
  wp s3-uploads enable --allow-root
fi

wp theme activate cd-theme --allow-root
chown -R "www-data:www-data" /var/www/html/wp-content
# Avoid overwrite by plugins of .htaccess
chmod 555 .htaccess
exec "$@"
