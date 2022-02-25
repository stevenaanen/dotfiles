#!/bin/sh
set -e

defaults write -g com.apple.trackpad.scaling 2      # Trackpadd scaling speed
defaults write -g com.apple.mouse.scaling 2.5
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadScroll -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2
defaults write -g InitialKeyRepeat -int 12
defaults write -g KeyRepeat -int 1
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false # Disable auto-correct

defaults write NSGlobalDomain AppleShowAllExtensions -bool true     # Show filename extensions
defaults write com.apple.Finder AppleShowAllFiles -bool true    # Show hidden files
defaults write com.apple.finder AppleShowAllFiles TRUE      # Show dotfiles
defaults write com.apple.finder FXPreferredViewStyle Clmv       # Column view default in Finder
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock mru-spaces -bool false        # Don't auto-arrange spaces

defaults write NSGlobalDomain AppleKeyboardUIMode -int 3        # Use keyboard navigation to move focus between controls
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true    # Automatically quit printer app once the print jobs complete
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false     # Save to disk instead of iCloud by default

defaults write com.apple.screencapture location -string "~/Downloads" # Save screenshots to Downloads

defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true     # Don't auto offer disks for time machine

# defaults write com.apple.screencapture location -string "$HOME/Desktop"

defaults write com.apple.Safari IncludeDevelopMenu -bool true

defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false     # Contains search in Safari


killall Finder        # Restart Finder after setting this
