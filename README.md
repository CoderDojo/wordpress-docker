# wordpress-docker
Image to setup wordpress in production with versioned plugins

## User
wordpress:wordpress

## Refreshin plugin confs
 - WP-super-cache : 
    Copy content of the wp-content/wp-cache-config
    Verify the .htaccess-es
    Verify the answer is cached
    Verify the crons are running
 - sucuri:
    Verify if confs/sucuri-settings changed
    Verify the .htaccess-es
 - CDF role (blacklist of capabilities):  
    Add to the blacklist and deploy or
    Remove from the blacklist, deploy and update in admin-panel
