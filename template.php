<?php

//ALTER HEAD TAG
function ocelot_default_html_head_alter( &$head_elements ) {
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
