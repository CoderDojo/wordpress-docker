<?php

/**
 * The plugin bootstrap file
 *
 * This file is read by WordPress to generate the plugin information in the plugin
 * admin area. This file also includes all of the dependencies used by the plugin,
 * registers the activation and deactivation functions, and defines a function
 * that starts the plugin.
 *
 * @link              https://github.com/CoderDojo/wordpress-docker
 * @since             1.0.0
 * @package           CD_Activator
 *
 * @wordpress-plugin
 * Plugin Name:       cd_activator
 * Plugin URI:        https://github.com/CoderDojo/wordpress-docker
 * Description:       Manual startup of plugins
 * Version:           1.0.0
 * Author:            Wardormeur
 * Author URI:        http://example.com/
 * License:           GPL-2.0+
 * License URI:       http://www.gnu.org/licenses/gpl-2.0.txt
 * Text Domain:       plugin-name
 * Domain Path:       /languages
 */

// If this file is called directly, abort.
if ( ! defined( 'WPINC' ) ) {
	die;
}

/**
 * Currently plugin version.
 * Start at version 1.0.0 and use SemVer - https://semver.org
 * Rename this for your plugin and update it as you release new versions.
 */
define( 'activator', '1.0.0' );

function set_cdf_role() {
  global $wp_roles;
  $adm = $wp_roles->get_role('administrator');
  add_role('CDF', 'Admin without plugin management', $adm->capabilities);
  $cdf = $wp_roles->get_role('CDF');
  if ($cdf) {
    $caps = array(
      // Plugins
      'activate_plugins',
      'delete_plugins',
      'edit_plugins',
      'install_plugins',
      'update_plugins',
      'upload_plugins',
      // Pods
      'pods',
      'pods_content',
      // General
      'manage_links',
      'export',
      'import',
      'manage_links',
      'manage_options',
      'update_core',
      'edit_files',
      // Themes
      'delete_themes',
      'edit_theme_options',
      'edit_themes',
      'install_themes',
      'switch_themes',
      'update_themes',
      'upload_themes',
      // Users
      'promote_users',
      'create_users',
      'remove_users',
      'delete_users',
      // Super-admin
      'create_sites',
      'delete_sites',
      'manage_network',
      'manage_sites',
      'manage_network_users',
      'manage_network_plugins',
      'manage_network_themes',
      'manage_network_options',
      'upgrade_network',
      'setup_network',
    );

    foreach ( $caps as $cap ) {
      // Remove the capability.
      $cdf->remove_cap( $cap );
    }
  }
}

/**
 * The code that runs during plugin activation.
 * This action is documented in includes/class-plugin-name-activator.php
 */
function activate_activator() {
  set_cdf_role();
}

/**
 * The code that runs during plugin deactivation.
 * This action is documented in includes/class-plugin-name-deactivator.php
 */
function deactivate_activator() {
  // Eh. That hsould be done by the real plugin, not me.
}

register_activation_hook( __FILE__, 'activate_activator' );
register_deactivation_hook( __FILE__, 'deactivate_activator' );

