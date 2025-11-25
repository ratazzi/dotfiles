macos_dock do
  apps [
    '/System/Applications/Apps.app/',
    '/System/Applications/System Settings.app/',
    '/System/Applications/Mail.app/',
    '/System/Applications/Calendar.app/',
    '/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app/',
    '/Applications/Firefox.app/',
    '/Applications/Firefox Developer Edition.app/',
    '/Applications/Google Chrome.app/',
    '/Applications/ChatGPT Atlas.app/',
    '/Applications/Dia.app/',
    '/Users/ratazzi/Applications/Dash.app/',
    '/Applications/Sublime Merge.app/',
    '/Applications/Kaleidoscope.app/',
    '/Applications/Visual Studio Code - Insiders.app/',
    '/Applications/Zed Preview.app/',
    '/Applications/Zed.app/',
    '/Applications/Cursor.app/',
    '/Applications/Ghostty.app/',
    '/Applications/kitty.app/',
    '/Applications/Warp.app/',
    '/System/Applications/Preview.app/',
  ]
  orientation :bottom
  autohide false
  magnification true
  tilesize 50
  largesize 40
end

# macOS Defaults
# defaults write NSGlobalDomain AppleICUForce24HourTime -bool true
macos_defaults 'force 24 hour time' do
  global true
  key 'AppleICUForce24HourTime'
  value true
end

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
# defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
macos_defaults 'full keyboard access' do
  global true
  key 'AppleKeyboardUIMode'
  value 3
end

macos_defaults 'keyboard repeat rate' do
  global true
  key 'KeyRepeat'
  value 1
end

macos_defaults 'initial key repeat delay' do
  global true
  key 'InitialKeyRepeat'
  value 15
end

# Press Ctrl+Cmd to drag windows from anywhere
macos_defaults 'window drag on gesture' do
  global true
  key 'NSWindowShouldDragOnGesture'
  value true
end

macos_defaults 'show all file extensions' do
  domain 'com.apple.finder'
  key 'AppleShowAllExtensions'
  value true
end

macos_defaults 'Finder default search scope (current folder)' do
  domain 'com.apple.finder'
  key 'FXDefaultSearchScope'
  value 'SCcf'
end

macos_defaults 'Finder preferred file view style (list view)' do
  domain 'com.apple.finder'
  key 'FXPreferredViewStyle'
  value 'Nlsv'
end

execute "show_library_folder" do
  command " chflags nohidden ~/Library"
end
