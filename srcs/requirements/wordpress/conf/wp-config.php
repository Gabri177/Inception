<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('MYSQL_DATABASE') );

/** Database username */
define( 'DB_USER', getenv('MYSQL_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('MYSQL_PASSWORD') );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '|!Tqiy$ZB/vES-S0,X(QcguT?1<(/KjUa|A]Qa6lH% x/CR?;rwf2cfn8YCyc|H1');
define('SECURE_AUTH_KEY',  '+o5?|(*&[i4WW}}3yN*%f?Kip.Vqa-2W-3 w9u)uQrE4,o*H5Gb|3H|s%^ek&cIY');
define('LOGGED_IN_KEY',    'QCME%O)vPA7bOk^L%94%Ap9@gB<LztrJ%l]8?#7--0j_0 IYGUu|GS+K8E9F5DcB');
define('NONCE_KEY',        '$U+`0bF}V9DDCT:pvl]dO5(`M|UKS{~4Q<DfguX=Jak>&*kUl76q1hMe`y@?w7+ ');
define('AUTH_SALT',        'fuu~k7%y]?%&jX2z^!R?%sR+e<l h[(Aq3VI-|xeA1-k|htRL:Gw}B=ERRs?YxA?');
define('SECURE_AUTH_SALT', 'sZ2!=r(xnTo9oSXLI)fofqK;f[jt`;bYWO8szU}&_!N:-}Aa`-lK7^Re4g[=?^7_');
define('LOGGED_IN_SALT',   '-gO@KR_olt0[x^hFJMU~X7 (O?JAU?xFxp,eFeOL]|YRpT8zt%d(wJUc;sN=+_ys');
define('NONCE_SALT',       '$`sR .Y`enm8><2~&R]9@oY<T+?-dmMEJ(E6Luo!8BBL;2c9mluIN7SHQezr.*MB');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true ); // 将错误记录到 wp-content/debug.log 文件中
define( 'WP_DEBUG_DISPLAY', false ); // 禁止将错误直接显示在页面上

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
