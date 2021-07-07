if [ "$(uname)" != "Darwin" ] ; then
    echo 'Not macOS!'
    exit 1
fi

__dock_item() {
    printf '%s%s%s%s%s' \
            '<dict><key>tile-data</key><dict><key>file-data</key><dict>' \
            '<key>_CFURLString</key><string>' \
            "$1" \
            '</string><key>_CFURLStringType</key><integer>0</integer>' \
            '</dict></dict></dict>'
}

# Dock Icon Size
defaults write com.apple.dock tilesize -int 50

# Dock Larger
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 64

# Title Bar Double Click
defaults write -g AppleActionOnDoubleClick -string "None"

# AutoHide
defaults write com.apple.dock autohide -bool true

# Animation Time
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -int 1

# Disable Show Recent Apps
defaults write com.apple.dock show-recents -boolean false

# Wipe All Apps from the Dock
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock \
                persistent-apps -array "$(__dock_item /System/Applications/Launchpad.app)" \
                                        "$(__dock_item /Applications/Safari.app)" \
                                        "$(__dock_item /Applications/Vivaldi.app)" \
                                        "$(__dock_item "/Applications/Visual Studio Code.app")" \
                                        "$(__dock_item "/Applications/IntelliJ IDEA.app")" \
                                        "$(__dock_item /Applications/PyCharm.app)" \
                                        "$(__dock_item /Applications/VLC.app)" \
                                        "$(__dock_item /System/Applications/Notes.app)" \
                                        "$(__dock_item /Applications/LINE.app)" \
                                        "$(__dock_item /System/Applications/Music.app)" \
                                        "$(__dock_item "/System/Applications/App Store.app")" \
                                        "$(__dock_item /Applications/iTerm.app)" \
                                        "$(__dock_item "/System/Applications/Utilities/Activity Monitor.app")" \
                                        "$(__dock_item "/System/Applications/System Preferences.app")"
killall Dock

# Disable Siri
defaults write com.apple.assistant.support "Assistant Enabled" -bool false
defaults write com.apple.Siri StatusMenuVisible -bool false

# Ask for password after 1 minutes
defaults write com.apple.screensaver askForPasswordDelay -int 60

# Key initial time
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15

# Touch Bar Appearance
defaults write com.apple.touchbar.agent PresentationModeGlobal -string fullControlStrip
defaults write com.apple.touchbar.agent PresentationModeFnModes -string functionKeys

## TrackPad
# Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Map bottom right Trackpad corner to right-click

# Speed
defaults write -g com.apple.trackpad.scaling -float 10

## Mouse
# Speed
defaults write "Apple Global Domain" com.apple.mouse.scaling 5

# Scroll Speed
defaults write .GlobalPreferences com.apple.scrollwheel.scaling 5


## Energy
# Battery Percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Battery
sudo pmset -b displaysleep 1
sudo pmset -b sleep 10

# AC Adaptor
sudo pmset -c displaysleep 10
sudo pmset -c sleep 0

## Time
# Appearance
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"

# Time Server
systemsetup -setnetworktimeserver ntp.nict.jp


## Screen Capture
# Prefix capture
defaults write com.apple.screencapture name "SS_"

## Finder
# Show Status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show Path bar
defaults write com.apple.finder ShowPathbar -bool true

# Show the hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# Show the ~/Library directory
chflags nohidden ~/Library

# Show /Volumes
sudo chflags nohidden /Volumes

# Show extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Do not make DS_Store network and USB
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# disable mikakunin app warning
defaults write com.apple.LaunchServices LSQuarantine -bool false


## Safari
# Disable AutoOpen downloads
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

