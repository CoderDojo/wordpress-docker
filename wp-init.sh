wp core install --url="http://localhost:8000/"  --title="Your Blog Title" --admin_user="wordpress" --admin_password="wordpress" --admin_email="wpadmin@example.com"  --allow-root

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
wp plugin activate wp-super-cache --allow-root
wp plugin activate sucuri-scanner --allow-root
wp plugin activate S3-Uploads --allow-root

wp theme activate cd-theme --allow-root
exec "$@"