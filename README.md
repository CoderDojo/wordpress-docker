# This repo is now archived -- wordpress-docker
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
Currently living on ECS:
 - Under "Task Definitions" create a new revision of the task called "wordpress-fargate" (`Task Definitions > wordpress-fargate > xx`) once the Docker image is published to DockerHub (this should bump up the auto-incrementing revision number eg. `wordpress-fargate:xx`)
 - Edit the service in the Cluster "wordpress-single-cluster" (open the service, hit "Update" top right)
 - Change the revision number to the latest task revision
 - Next until the end
 - The service (Clusters ->  wordpress-single-cluster -> Tasks) should show a new task having been started / provisioned (with the task definition showing the appopriate revision number at the end).

 If it doesn't:
 - Edit the service and go to the Autoscaling tab, hit "Update" and then skip ahead to "Service Auto Scaling (optional)"
 - Change Minimum no. of tasks and Desired no. of tasks to `2`
 - Head back to the "Tasks" tab of the cluster, and now the new task should appear (as above).
 - Once provisioned / running, scale the cluster back down to `1`, head back to the "Tasks" tab and stop the task with the outdated task definition
 
## Refreshin plugin confs
 - sucuri:
    Verify if confs/sucuri-settings changed
    Verify the .htaccess-es
 - CDF role (blacklist of capabilities):  
    Add to the blacklist and deploy or
    Remove from the blacklist, deploy and update in admin-panel
