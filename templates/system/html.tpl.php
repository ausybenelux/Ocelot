<!DOCTYPE html>
<html <?php print $rdf_namespaces; ?> class="no-js" lang="<?php print $language->language; ?>">
  <head>
    <?php print $head; ?>

    <title><?php print $head_title; ?></title>

    <?php print $favicons; ?>

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
