# wordpress-docker
Image to setup wordpress in production with versioned plugins

## User
wordpress:wordpress

## Updating plugins
Checking the plugins : 
 - Go to the admin interface and note down the versions of each new plugin
 - Update them
 - Run `docker-compose up` 
 - Check if everything works
 - if it does, update the DockerFile (https://github.com/CoderDojo/wordpress-docker/blob/master/Dockerfile)
 - When merged, the image will be published

Both instances lives on ECS. ECS requires at least 50% health, you need 2 instances at startup. However, plugins run their own migrations, on a shared DB.
 - scale down to 1 instance
 - do the plugins update on the live instance (db migrations)
 - wait for the new image to be published
 - deploy on ECS

## Deployment
Currently living on ECS.
 - create a new version of the task called "wordpress-fargate" once the image is published
 - Edit the service in the Cluster "wordpress-single-cluster"
 - Change the revision number to the latest task version
 - Next until the end
 
## Refreshin plugin confs
 - sucuri:
    Verify if confs/sucuri-settings changed
    Verify the .htaccess-es
 - CDF role (blacklist of capabilities):  
    Add to the blacklist and deploy or
    Remove from the blacklist, deploy and update in admin-panel
