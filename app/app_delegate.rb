class AppDelegate
  attr_accessor :status_menu

  def applicationDidFinishLaunching(notification)
    @app_name = NSBundle.mainBundle.infoDictionary['CFBundleDisplayName']

    @status_menu = NSMenu.new

    @status_item = NSStatusBar.systemStatusBar.statusItemWithLength(NSVariableStatusItemLength).init
    @status_item.setMenu(@status_menu)
    @status_item.setHighlightMode(true)
    # @status_item.setTitle(@app_name)

    @status_item.setImage(NSImage.imageNamed("eye-dot_20x20x32.png"))

    @status_menu.addItem createMenuItem("About #{@app_name}", 'orderFrontStandardAboutPanel:')
    @status_menu.addItem createMenuItem("Hide Invisibles", 'hideInvisibles')
    @status_menu.addItem createMenuItem("Show Invisibles", 'showInvisibles')
    @status_menu.addItem createMenuItem("Quit", 'terminate:')
  end

  def createMenuItem(name, action)
    NSMenuItem.alloc.initWithTitle(name, action: action, keyEquivalent: '')
  end

  def alert(message_text,button_title)
    alert = NSAlert.alloc.init
    alert.setMessageText message_text
    alert.addButtonWithTitle button_title
    alert.runModal
  end

  def hideInvisibles
    `defaults write com.apple.finder AppleShowAllFiles FALSE`
    `killall Finder`
    alert "Invisible files are now hidden", "OK"
  end

  def showInvisibles
    `defaults write com.apple.finder AppleShowAllFiles TRUE`
    `killall Finder`
    alert "Invisible files are now shown", "OK"
  end
end
