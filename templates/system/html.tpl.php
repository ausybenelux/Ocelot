<!DOCTYPE html>
<html <?php print $rdf_namespaces; ?> class="no-js" lang="<?php print $language->language; ?>">
  <head>
    <?php print $head; ?>

    <title><?php print $head_title; ?></title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/favicon.ico"/>

    <!-- Apple -->
    <link rel="apple-touch-icon" sizes="57x57" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/apple-touch-icon-180x180.png">

    <!-- Icon -->
    <link rel="icon" type="image/png" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/favicon-194x194.png" sizes="194x194">
    <link rel="icon" type="image/png" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/favicon-96x96.png" sizes="96x96">
    <link rel="icon" type="image/png" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/android-chrome-192x192.png" sizes="192x192">
    <link rel="icon" type="image/png" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/favicon-16x16.png" sizes="16x16">
    <link rel="manifest" href="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/manifest.json">

    <!-- Windows -->
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="<?php echo url(drupal_get_path('theme', variable_get('theme_default', NULL)), array("absolute" => true)); ?>/assets/img/icon/mstile-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <!-- Styles -->
    <?php print $styles; ?>

    <!-- Styles -->
    <?php print $scripts; ?>
  </head>

  <body class="<?php print $classes; ?>" <?php print $attributes;?>>
    <?php print $page_top; ?>
    <?php print $page; ?>
    <?php print $page_bottom; ?>
  </body>
</html>
