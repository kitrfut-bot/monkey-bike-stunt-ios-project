# Monkey Bike Stunt – iOS (.ipa) project

The game (`www/index.html`) runs inside a native iOS WKWebView via Capacitor. Landscape, full screen, offline (everything is bundled).
Before you start, change `appId` in `capacitor.config.json` to your own reverse-domain id, e.g. `com.rahul.monkeybikestunt`.

## Option A – you have a Mac
1. Install Xcode and Node 20+.
2. `bash setup.sh`  (installs Capacitor, makes icons + splash, locks landscape, opens Xcode)
3. In Xcode: App target > Signing & Capabilities > pick your Team.
4. Run on your iPhone, or Product > Archive > Distribute App (Ad Hoc / App Store Connect) to export the signed `.ipa`.

## Option B – no Mac (GitHub Actions)
1. Push this folder to a new GitHub repo, open the Actions tab and run "Build unsigned IPA".
2. Download the `MonkeyBikeStunt.ipa` artifact.
3. Install it with Sideloadly or AltStore using a free Apple ID (re-sign needed every 7 days), or re-sign it with a paid developer account.

## Notes
- Publishing on the App Store needs a paid Apple Developer account (US$99/year).
- To update the game, replace `www/index.html` and run `npx cap sync ios`.
