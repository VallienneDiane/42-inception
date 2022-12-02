<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'mariadb' );

/** Database username */
define( 'DB_USER', 'tintin' );

/** Database password */
define( 'DB_PASSWORD', 'milou' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

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
define( 'AUTH_KEY',          'WXn/?ifyvN[Jhb=4Rf@,GyLI)p>&Fn0WdCbgpscTLD{3*aAV.W< jP$2zWv6KP>o' );
define( 'SECURE_AUTH_KEY',   '6crc9-w}L!r#?2g02xY__ jxKkrAXe.QUvurWELr?O]49!-j8UC,M6a{IETCEcg)' );
define( 'LOGGED_IN_KEY',     'HFwpGw%{X[RVwjGfVyAVBsyS{Vf}KVh<LYqj<Ea8&v q{r[ua^o>jQl>L1@}Bsak' );
define( 'NONCE_KEY',         'N?1c~IoTk}xdM2aHnLv2?wCM<:v[|(B*Lp*0EfnYfV4qct~,0a:.8]D$T^E*:P:J' );
define( 'AUTH_SALT',         '!vLaAOJW0#l27}Y#4G6t8Ck%K)-6dg]b{{Luhv:U:F7mI?u]:eOI`U+EIUA2G:0}' );
define( 'SECURE_AUTH_SALT',  'q^@/9gD.f?sBI&cf,JXleGcUT/kSCutraoh-5$&r DZN7m`oz&^EL|%G8;61L2A{' );
define( 'LOGGED_IN_SALT',    '9{>3Kp))u+.7RCNchG-F?,|tOd(6nRK3H]wwh<AVUpHJV3@j3k2qcea`sz?9q#xv' );
define( 'NONCE_SALT',        'c2u4)?3I%U~pcS94H5.JB =y^>08l}bKU(3Sx&A{wL^*indoZ*~`PC@_{#t>3GF$' );
define( 'WP_CACHE_KEY_SALT', 'Hy{PXeg7ATSr3ro121H3+6iedc*=JZL|Ot9PeE9[U.b&ja0H0S oS?J.DV#{QNga' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
