<?php

define( 'DB_NAME', 'wp_database' );
define( 'DB_USER', 'user' );
define( 'DB_PASSWORD', 'pass' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',         'Y^NrWeHf@A(cdl>2@*H.@Eg]1w3I1eV}|RO;j7R.#R%g8[1ua=>y.pY6qTG4;av+');
define( 'SECURE_AUTH_KEY',  '/_G2SG1nQkl3&_q=pN:grE1A5(amec-[lOY#h1onWzf9a#LZ2Q2s[~1=-<h;1<bj');
define( 'LOGGED_IN_KEY',    'D7Cq(5Cx@-X,-9mCax^T7~~sG&7R*u sN-uYDvtDmnl Vt|`XP@ud*cOCW(_*Bi1');
define( 'NONCE_KEY',        'dp`E.~SQOtkU]cqeD+YzqQ~tV%qwbA!x4sjk4*8V4F+;_{of<;Pqh|m,P.>-FJFr');
define( 'AUTH_SALT',        's:DaRIvV>K{N/1jwg;|J,Y;cKErT&_] R?[m;kuH9epp`cv+2czAd,_McYFz;?-X');
define( 'SECURE_AUTH_SALT', 'ne{KMofg5OS6iSU7kV+()]R?c+qa,p]ur.H[]5M|/kKFi>{H|C<~7[R#}-8 36^L');
define( 'LOGGED_IN_SALT',   'q-X~7]C,UlZyrm#Np` H^[6I}+THt|iLf/FVB&#mn/q9-dwZ0^`aml!*[7D,Y{-M');
define( 'NONCE_SALT',       'i!ckOV8zDs5y[w[o$ZUw2$3gE#adpk):eAGqVpOCQd> d:2efi![jj*_)jO#jD4f');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';