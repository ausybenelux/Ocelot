<div id="page-wrapper">
  <div id="page">
    <div id="header">
      <div class="section clearfix">
        <?php if ($logo): ?>
          <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>" rel="home" id="logo">
            <img src="<?php print $logo; ?>" alt="<?php print t('Home'); ?>" />
          </a>
        <?php endif; ?>

        <?php if ($site_name || $site_slogan): ?>
          <div id="name-and-slogan">
            <?php if ($site_name): ?>
              <?php if ($title): ?>
                <div id="site-name">
                  <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>" rel="home">
                    <span><?php print $site_name; ?></span>
                  </a>
                </div>

              <?php else: ?>
                <h1 id="site-name">
                  <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>" rel="home">
                    <span><?php print $site_name; ?></span>
                  </a>
                </h1>
              <?php endif; ?>
            <?php endif; ?>

            <?php if ($site_slogan): ?>
              <div id="site-slogan">
                <?php print $site_slogan; ?>
              </div>
            <?php endif; ?>
          </div>
        <?php endif; ?>

        <?php print render($page['header']); ?>
      </div>
    </div>

    <?php if ($main_menu || $secondary_menu): ?>
      <div id="navigation">
        <div class="section">
          <?php print theme('links__system_main_menu', array('links' => $main_menu, 'attributes' => array('id' => 'main-menu', 'class' => array('links', 'inline', 'clearfix')), 'heading' => t('Main menu'))); ?>
          <?php print theme('links__system_secondary_menu', array('links' => $secondary_menu, 'attributes' => array('id' => 'secondary-menu', 'class' => array('links', 'inline', 'clearfix')), 'heading' => t('Secondary menu'))); ?>
        </div>
      </div>
    <?php endif; ?>

    <?php if ($breadcrumb): ?>
      <div id="breadcrumb">
        <?php print $breadcrumb; ?>
      </div>
    <?php endif; ?>

    <?php print $messages; ?>
    <div id="main-wrapper">
      <div id="main" class="clearfix">
        <div id="content" class="column">
          <div class="section">
            <?php if (isset($page['highlighted'])): ?>
              <div id="highlighted">
                <?php print render($page['highlighted']); ?>
              </div>
            <?php endif; ?>

            <a id="main-content"></a>

            <?php print render($title_prefix); ?>
            <?php if ($title): ?>
              <h1 class="title" id="page-title">
                <?php print $title; ?>
              </h1>
            <?php endif; ?>
            <?php print render($title_suffix); ?>

            <?php if ($tabs): ?>
              <div class="tabs">
                <?php print render($tabs); ?>
              </div>
            <?php endif; ?>

            <?php print render($page['help']); ?>

            <?php if ($action_links): ?>
              <ul class="action-links">
                <?php print render($action_links); ?>
              </ul>
            <?php endif; ?>

            <?php print render($page['content']); ?>
            <?php print $feed_icons; ?>
          </div>
        </div>

        <?php if ($page['sidebar_first']): ?>
          <div id="sidebar-first" class="column sidebar">
            <div class="section">
              <?php print render($page['sidebar_first']); ?>
            </div>
          </div>
        <?php endif; ?>

        <?php if (isset($page['sidebar_second'])): ?>
          <div id="sidebar-second" class="column sidebar">
            <div class="section">
              <?php print render($page['sidebar_second']); ?>
            </div>
          </div>
        <?php endif; ?>

      </div>
    </div>

    <div id="footer">
      <div class="section">
        <?php print render($page['footer']); ?>
      </div>
    </div>
  </div>
</div>
