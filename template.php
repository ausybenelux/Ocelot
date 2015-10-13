<?php

/**
 * Implements hook_html_head_alter().
 */
function ocelot_html_head_alter(&$head_elements) {
  if(array_key_exists( "system_meta_content_type", $head_elements )) {
    unset($head_elements["system_meta_content_type"]["#attributes"]["http-equiv"]);
    unset($head_elements["system_meta_content_type"]["#attributes"]["content"]);
    $head_elements["system_meta_content_type"]["#attributes"]["charset"] = "utf-8";
  }

  $head_elements["chrome_frame"] = array(
    "#type" => "html_tag",
    "#tag" => "meta",
    "#attributes" => array(
      "http-equiv" => "X-UA-Compatible",
      "content" => "IE=edge"
    )
  );

  $head_elements["viewport"] = array(
    "#type" => "html_tag",
    "#tag" => "meta",
    "#attributes" => array(
      "http-name" => "viewport",
      "content" => "width=device-width, initial-scale=1"
    )
  );
}

function ocelot_preprocess_html(&$variables) {
  $variables['favicons'] = '';

  $theme_path = drupal_get_path('theme', variable_get('theme_default', NULL));
  if (file_exists($theme_path . '/templates/misc/favicons.tpl.php')) {
    $variables['favicons'] .= "<!-- Favicons -->";
    $favicon_url_prefix = url($theme_path, array("absolute" => true));

    ob_start();
    include_once($theme_path . '/templates/misc/favicons.tpl.php');
    $favicons = ob_get_clean();

    $new_favicons = str_replace('./', $favicon_url_prefix . '/', $favicons);
    $variables['favicons'] .= $new_favicons;

    $variables['favicons'] .= "<!-- /Favicons -->";
  }
  else {
   $variables['favicons'] .= "<!-- Favicons file missing -->";
  }
}


/**
 * Implements hook_preprocess_page().
 */
function ocelot_preprocess_page(&$variables) {
  // Add Ocelot base library.
  drupal_add_library('ocelot', 'ocelot_base');
}

/**
 * Implements hook_library().
 */
function ocelot_library() {
  $libraries = array();

  // Check if we need to include the minified files.
  $minifed = theme_get_setting('minified');
  if ($minifed) {
    $min_extension = '.min.js';
  }
  else {
    $min_extension = '.js';
  }

  $libraries['modernizr'] = array(
    'title' => 'Modernizr',
    'website' => 'http://modernizr.com/',
    'version' => '2.7.1',
    'js' => array(
      drupal_get_path('theme', 'ocelot') . "/assets/js/vendor/modernizr$min_extension" => array(),
    ),
  );

  $libraries['underscore'] = array(
    'title' => 'Underscore',
    'website' => 'http://underscorejs.org/',
    'version' => '1.5.2',
    'js' => array(
      drupal_get_path('theme', 'ocelot') . "/assets/js/vendor/underscore$min_extension" => array(),
    ),
  );

  $libraries['respond'] = array(
    'title' => 'Respond',
    'website' => 'https://github.com/scottjehl/Respond',
    'version' => '1.4.2',
    'js' => array(
      drupal_get_path('theme', 'ocelot') . "/assets/js/vendor/respond$min_extension" => array(),
    ),
  );

  $libraries['ocelot_base'] = array(
    'title' => 'Ocelot Base',
    'website' => 'https://github.com/Crosscheck/Ocelot',
    'version' => '0.1.3',
    'js' => array(
      drupal_get_path('theme', 'ocelot') . "/assets/js/base$min_extension" => array(),
    ),
    'dependencies' => array(
      array('system', 'jquery'),
      array('ocelot', 'modernizr'),
      array('ocelot', 'underscore'),
    ),
  );

  return $libraries;
}
