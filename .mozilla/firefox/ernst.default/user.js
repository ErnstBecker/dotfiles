// UI
// Vertical Tabs
//user_pref("sidebar.verticalTabs", true);
user_pref("sidebar.verticalTabs", false);
user_pref("sidebar.revamp.defaultLauncherVisible", false);
user_pref("sidebar.main.tools", "");


// Theme
// Enable userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Dark Theme
user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");
user_pref("ui.systemUsesDarkTheme", 1);
user_pref("layout.css.prefers-color-scheme.content-override", 0);


// Address Bar
user_pref("browser.urlbar.suggest.bookmark", true);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
user_pref("browser.urlbar.suggest.recentsearches", false);
user_pref("browser.urlbar.recentsearches.enabled", false);
user_pref("browser.urlbar.suggest.recentsearches", false);
user_pref("browser.urlbar.quickactions.enabled", false);
user_pref("browser.urlbar.groupLabels.enabled", false);
user_pref("browser.urlbar.trending.enabled", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.suggest.trending", false);
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.engines", false);


// Bookmarks
user_pref("browser.toolbars.bookmarks.visibility", "never");
user_pref("browser.bookmarks.restore_default_bookmarks", false);
user_pref("browser.places.importBookmarksHTML", false);
user_pref("browser.bookmarks.added_static_root", true);


// Extensions
// Disable extensions/themes recommendations
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false)
user_pref("extensions.recommendations.themeRecommendationUrl", false);
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.getAddons.discovery.api_url", "");


// Bloatware
// Disable Tab manager
user_pref("browser.tabs.tabmanager.enabled", false);

// Disable Pocket
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.pocket.api", "");
user_pref("extensions.pocket.oAuthConsumerKey", "");
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
