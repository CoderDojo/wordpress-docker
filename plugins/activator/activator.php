<?php

/**
 * The plugin bootstrap file
 *
 * This file is read by WordPress to generate the plugin information in the plugin
 * admin area. This file also includes all of the dependencies used by the plugin,
 * registers the activation and deactivation functions, and defines a function
 * that starts the plugin.
 *
 * @link              http://example.com
 * @since             1.0.0
 * @package           Plugin_Name
 *
 * @wordpress-plugin
 * Plugin Name:       WordPress Plugin Boilerplate
 * Plugin URI:        http://example.com/plugin-name-uri/
 * Description:       This is a short description of what the plugin does. It's displayed in the WordPress admin area.
 * Version:           1.0.0
 * Author:            Your Name or Your Company
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

/**
 * The code that runs during plugin activation.
 * This action is documented in includes/class-plugin-name-activator.php
 */
function activate_activator() {
  	global $cache_scheduled_time, $cache_schedule_interval;
    if ( false == wp_next_scheduled('wp_cache_gc') ) {
      wp_schedule_single_event( time() + $cache_time_interval, 'wp_cache_gc' );
    }
    if ( false == wp_next_scheduled( 'wp_cache_gc_watcher' ) ) {
      wp_schedule_event( time()+600, 'hourly', 'wp_cache_gc_watcher' );
    }
    wp_schedule_single_event( time(), 'wp_cache_full_preload_hook' );
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

