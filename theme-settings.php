<?php

include_once('template.php');

/**
 * Implements hook_form_system_theme_settings_alter().
 */
function ocelot_form_system_theme_settings_alter(&$form, $form_state) {
  $form['libraries'] = array(
    '#type' => 'fieldset',
    '#title' => t('Libraries'),
    '#description' => t('An overview of all the libraries defined inside this
    theme.'),
  );
  $form['libraries']['list'] = array(
    '#type' => 'item',
    '#markup' => ocelot_libraries_table(),
  );
  $form['libraries']['minified'] = array(
    '#type' => 'checkbox',
    '#title' => t('Use minified libraries'),
    '#default_value' => theme_get_setting('minified'),
    '#description'   => t('Use the minfied versions <strong>*min.js</strong> of libraries.'),
  );
}

function ocelot_libraries_table() {
  $libraries = ocelot_library();
  $header = array(
    array('data' => 'title'),
    array('data' => 'version'),
    array('data' => 'website'),
    array('data' => 'dependencies'),
  );
  $rows = array();
  $dependencies = array();

  foreach ($libraries as $library_name => $library) {
    if (isset($library['dependencies'])) {
      $dependencies = array_map(function($item) {
        return $item[1] . ' (<strong>' . $item[0] . '</strong>)';
      }, $library['dependencies']);
    }
    $rows[] = array(
      $library['title'],
      $library['version'],
      l($library['website'], $library['website']),
      theme('item_list' , array('items' => $dependencies)),
    );
  }

  $table = array(
    'header' => $header,
    'rows' => $rows,
  );

  return theme('table', $table);
}
