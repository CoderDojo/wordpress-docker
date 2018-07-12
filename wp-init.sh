#!/bin/bash
echo "Installed wordpress. Will now copy over cd-theme..."
# copy cd-theme
cp -R ~/tmp/cd-theme /var/www/html/wp-content/themes/cd-theme
echo "Copied cd-theme"

echo "Installing plugins"
#ensure plugins work

echo "login as wordpress user (su - wordpress command)"
su - wordpress
wp --info
# wp plugin install https://github.com/humanmade/S3-Uploads/archive/master.zip
# wp core install —url=http://localhost:8000/ —title=Your_Blog_Title —admin_user=username —admin_password=password —admin_email=your_email.com

# execute apache
exec "apache2-foreground"