// UI
user_pref("zen.tabs.vertical.right-side", true);
user_pref("zen.urlbar.behavior", "float");
user_pref("zen.view.grey-out-inactive-windows", false);
user_pref("browser.tabs.allow_transparent_browser", true);
user_pref("zen.theme.content-element-separation", 0);
user_pref("zen.view.experimental-no-window-controls", true);
user_pref("apz.overscroll.enabled", false);
user_pref("browser.tabs.inTitlebar", 0);

// Tabs
user_pref("zen.tabs.show-newtab-vertical", false);
user_pref("zen.pinned-tab-manager.restore-pinned-tabs-to-pinned-url", true);
user_pref("browser.ctrlTab.sortByRecentlyUsed", true);


// Theme
// Enable userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Dark Theme
user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");
user_pref("layout.css.prefers-color-scheme.content-override", 0);
user_pref("ui.systemUsesDarkTheme", 1);


// Address Bar
user_pref("browser.urlbar.suggest.bookmark", true);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
user_pref("browser.urlbar.suggest.recentsearches", false);
user_pref("browser.urlbar.quickactions.enabled", false);
user_pref("browser.urlbar.groupLabels.enabled", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.suggest.trending", false);
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.engines", false);

// Search
user_pref("browser.search.defaultenginename", "SearXNG")
user_pref("browser.search.separatePrivateDefault", false)

// Bookmarks
user_pref("browser.toolbars.bookmarks.visibility", "never");
user_pref("browser.bookmarks.restore_default_bookmarks", false);


// Security
user_pref("permissions.default.desktop-notification", 2);
user_pref("dom.security.https_only_mode", true)


// Enable DevTools
user_pref("devtools.chrome.enabled", true)
user_pref("devtools.debugger.remote-enabled", true);


// Bloatware
// Disable Pocket
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.pocket.api", "");
user_pref("extensions.pocket.oAuthConsumerKey", "");
user_pref("extensions.pocket.oAuthConsumerKeyBff", "");
user_pref("extensions.pocket.site", "");
// Disable Firefox View
user_pref("browser.tabs.firefox-view", false);
user_pref("browser.firefox-view.feature-tour", "");
user_pref("browser.firefox-view.view-count", 0);
// Disable Solo AI
user_pref("browser.ml.chat.provider", false);
user_pref("browser.ml.chat.enabled", false);
// Disable Promos
user_pref("browser.promo.focus.enabled", false);
user_pref("browser.promo.pin.enabled", false);
// Disable Third-party Cookies
user_pref("network.cookie.cookieBehavior", 1);
// Disable Experimental Features
user_pref("browser.preferences.experimental", false);
user_pref("browser.preferences.experimental.hidden", true);

// Extensions
// Disable extensions/themes recommendations
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false)
user_pref("extensions.recommendations.themeRecommendationUrl", false);
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.getAddons.discovery.api_url", "");
