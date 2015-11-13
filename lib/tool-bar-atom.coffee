module.exports =
  deactivate: ->
    @toolBar?.removeItems()

  consumeToolBar: (toolBar) ->
    @toolBar = toolBar 'tool-bar-atom'

    @toolBar.addButton
      icon: 'document-text'
      callback: 'application:open-file'
      tooltip: 'Open File'
      iconset: 'ion'

    @toolBar.addButton
      'icon': 'folder'
      'callback': 'application:open-folder'
      'tooltip': 'Open Folder'
      'iconset': 'ion'

    @toolBar.addButton
      'icon': 'archive'
      'callback': 'core:save'
      'tooltip': 'Save File'
      'iconset': 'ion'

    if atom.packages.loadedPackages['project-manager']
      @toolBar.addButton
        'icon': 'file-submodule'
        'tooltip': 'List projects'
        'callback': 'project-manager:list-projects'

    @toolBar.addSpacer()

    @toolBar.addButton
      'icon': 'columns'
      'iconset': 'fa'
      'tooltip': 'Split screen - Horizontally'
      'callback': 'pane:split-right'

    @toolBar.addButton
      'icon': 'columns fa-rotate-270'
      'iconset': 'fa'
      'tooltip': 'Split screen - Vertically'
      'callback': 'pane:split-down'

    @toolBar.addSpacer()

    @toolBar.addButton
      'iconset': 'fa'
      'icon': 'arrows-alt'
      'tooltip': 'Toggle Fullscreen'
      'callback': 'window:toggle-full-screen'

    @toolBar.addButton
      'icon': 'sitemap'
      'callback': 'tree-view:toggle'
      'tooltip': 'Toggle Sidebar'
      'iconset': 'fa'

    @toolBar.addSpacer()

    @toolBar.addButton
      'icon': 'indent'
      'callback': 'editor:auto-indent'
      'tooltip': 'Auto indent (selection)'
      'iconset': 'fa'

    @toolBar.addButton
      'icon': 'level-up'
      'callback': 'editor:fold-all'
      'tooltip': 'Fold all'
      'iconset': 'fa'

    @toolBar.addButton
      'icon': 'level-down'
      'callback': 'editor:unfold-all'
      'tooltip': 'Unfold all'
      'iconset': 'fa'

    @toolBar.addSpacer()

    if atom.packages.loadedPackages['term3']
      @toolBar.addButton
        'icon': 'terminal'
        'callback': 'term3:open-split-down'
        'tooltip': 'Term3 Split Down'
    else if atom.packages.loadedPackages['term2']
      @toolBar.addButton
        'icon': 'terminal'
        'callback': 'term2:open-split-down'
        'tooltip': 'Term2 Split Down'

    if atom.inDevMode()

      @toolBar.addSpacer()

      @toolBar.addButton
        'icon': 'refresh'
        'callback': 'window:reload'
        'tooltip': 'Reload Window'
        'iconset': 'ion'

      @toolBar.addButton
        'icon': 'bug'
        'callback': 'window:toggle-dev-tools'
        'tooltip': 'Toggle Developer Tools'

    @toolBar.addSpacer()

    if atom.packages.loadedPackages['git-plus']
      @toolBar.addButton
        'icon' : 'git-plain'
        'callback' : 'git-plus:menu'
        'tooltip' : 'Git plus'
        'iconset' : 'devicon'

    @toolBar.addButton
      'icon': 'gear-a'
      'callback': 'settings-view:open'
      'tooltip': 'Open Settings View'
      'iconset': 'ion'
