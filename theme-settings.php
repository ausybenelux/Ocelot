<?php

/**
 * Implements hook_form_system_theme_settings_alter().
 */
function ocelot_form_system_theme_settings_alter(&$form, $form_state) {
  $form['styleguide'] = array(
    '#type' => 'fieldset',
    '#title' => t('Styleguide'),
    '#description' => t('A style guide is a reference point that sets standards.
    The focus of the style guide is not usually a matter of correct or incorrect
    grammar or style but, rather, it provides guidance for instances when many
    possibilities exist.'),
  );
  $form['styleguide']['list'] = array(
    '#type' => 'item',
    '#markup' => l('View the styleguide', drupal_get_path('theme', 'ocelot') . '/styleguide/index.html'),
  );
}
