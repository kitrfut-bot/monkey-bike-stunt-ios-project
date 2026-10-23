#!/usr/bin/env bash
# Run on a Mac with Xcode + Node 20+ installed:   bash setup.sh
# (CI mode: bash setup.sh --ci  -> skips opening Xcode)
set -euo pipefail
npm install
[ -d ios ] || npx cap add ios
npx capacitor-assets generate --ios --iconBackgroundColor '#0E1535' --splashBackgroundColor '#0E1535'

# Landscape only, full screen, no status bar (matches the game)
PLIST=ios/App/App/Info.plist
set_orient() {  # $1 = key
  /usr/libexec/PlistBuddy -c "Delete :$1" "$PLIST" 2>/dev/null || true
  /usr/libexec/PlistBuddy -c "Add :$1 array" "$PLIST"
  /usr/libexec/PlistBuddy -c "Add :$1:0 string UIInterfaceOrientationLandscapeLeft" "$PLIST"
  /usr/libexec/PlistBuddy -c "Add :$1:1 string UIInterfaceOrientationLandscapeRight" "$PLIST"
}
set_orient UISupportedInterfaceOrientations
set_orient "UISupportedInterfaceOrientations~ipad"
for kv in "UIStatusBarHidden bool true" "UIViewControllerBasedStatusBarAppearance bool false" "UIRequiresFullScreen bool true"; do
  set -- $kv
  /usr/libexec/PlistBuddy -c "Delete :$1" "$PLIST" 2>/dev/null || true
  /usr/libexec/PlistBuddy -c "Add :$1 $2 $3" "$PLIST"
done

npx cap sync ios
[ "${1:-}" = "--ci" ] || npx cap open ios
