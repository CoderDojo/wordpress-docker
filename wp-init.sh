echo "Installed wordpress. Will now copy over cd-theme..."
cp -R ~/tmp/cd-theme /var/www/html/wp-content/themes/cd-theme
echo "Copied cd-theme"

echo "Extend wp-config"
wp config set S3_UPLOADS_BUCKET "$WP_S3_BUCKET" --type=constant --allow-root
wp config set S3_UPLOADS_KEY "$WP_S3_KEY" --type=constant --allow-root
wp config set S3_UPLOADS_SECRET "$WP_S3_SECRET" --type=constant --allow-root
wp config set S3_UPLOADS_REGION "$WP_S3_REGION" --type=constant --allow-root
wp config set S3_UPLOADS_BUCKET_URL "$WP_S3_URL" --type=constant --allow-root
echo "Extend with s3-upload conf"

wp core install --url="http://localhost:8000/" --title="Your Blog Title" --admin_user="wordpress" --admin_password="wordpress" --admin_email="wpadmin@example.com"  --allow-root

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

wp plugin install timber-library --version=1.3.3 --activate --allow-root
wp plugin install pods --version=2.6.11 --activate --allow-root
wp plugin install antispam-bee --version=2.7.1 --activate --allow-root
wp plugin install caldera-forms --version=1.5.2.1 --activate --allow-root
wp plugin install contact-form-7 --version=4.8 --activate --allow-root
wp plugin install custom-share-buttons-with-floating-sidebar --version=3.3 --activate --allow-root
wp plugin install google-captcha --version=1.33 --activate --allow-root
wp plugin install google-sitemap-generator --version=4.0.9 --activate --allow-root
wp plugin install wonderm00ns-simple-facebook-open-graph-tags --version=2.2.4.1 --activate --allow-root
wp plugin install redirection --version=2.8 --activate --allow-root
wp plugin install tablepress --version=1.8.1 --activate --allow-root
wp plugin install wp-mail-smtp --version=0.10.1 --activate --allow-root
wp plugin install wp-super-cache --version=1.6.2 --activate --allow-root
wp plugin install sucuri-scanner --version=1.8.11 --activate --allow-root
wp plugin install https://github.com/humanmade/S3-Uploads/archive/f9f09b1ead9e07032ee1eb406a237b1273fe55ed.zip --activate --allow-root

wp theme activate cd-theme --allow-root
exec "$@"
