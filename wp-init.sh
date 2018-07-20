echo "Extend wp-config"

wp config set S3_UPLOADS_BUCKET "$WP_S3_BUCKET" --type=constant --allow-root
wp config set S3_UPLOADS_KEY "${WP_S3_KEY-}" --type=constant --allow-root --quiet
wp config set S3_UPLOADS_SECRET "${WP_S3_SECRET-}" --type=constant --allow-root --quiet
wp config set S3_UPLOADS_REGION "$WP_S3_REGION" --type=constant --allow-root
wp config set S3_UPLOADS_BUCKET_URL "$WP_S3_URL" --type=constant --allow-root
echo "Extend with s3-upload conf"
# TODO : EFS to share the logs between instances of WP
wp config set SUCURI_DATA_STORAGE "/var/log/sucuri" --type=constant --allow-root
wp config set DISALLOW_FILE_EDIT "true" --type=constant --allow-root;
echo "Extended with Sucuri defaults"
wp config set WP_CACHE "true" --type=constant --allow-root
wp config set WPCACHEHOME "/var/www/html/wp-content/plugins/wp-super-cache/" --type=constant --allow-root
echo "Extended with wp-super-cache defaults"

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

wp plugin activate wp-super-cache --allow-root
wp plugin activate antispam-bee --allow-root
wp plugin activate caldera-forms --allow-root
wp option update _caldera_forms_forms '{"CF57d7e56b49ac6":"CF57d7e56b49ac6"}' --format=json --allow-root
wp plugin activate contact-form-7 --allow-root
wp plugin activate custom-share-buttons-with-floating-sidebar --allow-root
wp plugin activate google-captcha --allow-root
wp plugin activate google-sitemap-generator --allow-root
wp plugin activate pods --allow-root
wp plugin activate redirection --allow-root
wp plugin activate tablepress --allow-root
wp plugin activate timber-library --allow-root
wp plugin activate wonderm00ns-simple-facebook-open-graph-tags --allow-root
wp plugin activate wp-mail-smtp --allow-root
wp plugin activate sucuri-scanner --allow-root
# Recommended plugin to check if the wp-super-cache cron are running
# wp plugin install cron-view --activate --allow-root

chown -R "www-data:www-data" /var/log/sucuri
chmod -R 755 /var/log/sucuri
wp plugin activate activator --allow-root

if [[ -n "${WP_S3_SECRET-}" ]]
then
  wp plugin activate S3-Uploads --allow-root
  wp s3-uploads verify --allow-root
  wp s3-uploads enable --allow-root
fi

wp theme activate cd-theme --allow-root
chown -R "www-data:www-data" /var/www/html/wp-content
exec "$@"
