// ZEN BROWSER
// Layout
user_pref("zen.tabs.vertical.right-side", true);
user_pref("zen.urlbar.behavior", "float");
user_pref("zen.view.experimental-no-window-controls", true);
user_pref("zen.tabs.show-newtab-vertical", false);
// Theme
user_pref("zen.theme.accent-color", "#000");
user_pref("zen.theme.content-element-separation", 0);
user_pref("zen.view.grey-out-inactive-windows", false);
// Pinned tabs
user_pref("zen.pinned-tab-manager.restore-pinned-tabs-to-pinned-url", true);


// UI AND THEME
// Theme
user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");
user_pref("ui.systemUsesDarkTheme", 1);
user_pref("layout.css.prefers-color-scheme.content-override", 0);
// Custom CSS (userChrome.css / userContent.css)
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
// Window and toolbar
user_pref("browser.tabs.inTitlebar", 1);
user_pref("browser.tabs.allow_transparent_browser", true);
user_pref("browser.download.autohideButton", true);
user_pref("browser.toolbars.bookmarks.visibility", "never");
// Scrolling
user_pref("apz.overscroll.enabled", false);


// TABS AND BOOKMARKS
user_pref("browser.ctrlTab.sortByRecentlyUsed", true);
user_pref("browser.bookmarks.restore_default_bookmarks", false);


// ADDRESS BAR AND SEARCH
// Search engine
user_pref("browser.search.region", "US");
user_pref("browser.search.separatePrivateDefault", false);
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.search.suggest.enabled.private", false);
// Address bar suggestions (only bookmarks)
user_pref("browser.urlbar.suggest.bookmark", true);
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.suggest.recentsearches", false);
user_pref("browser.urlbar.suggest.trending", false);
user_pref("browser.urlbar.suggest.engines", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
// Address bar UI
user_pref("browser.urlbar.quickactions.enabled", false);
user_pref("browser.urlbar.groupLabels.enabled", false);


// PERFORMANCE
// Hardware acceleration
user_pref("gfx.webrender.all", true);
user_pref("gfx.webrender.compositor", true);
user_pref("layers.acceleration.force-enabled", true);
user_pref("media.hardware-video-decoding.force-enabled", true);
// Cache
user_pref("browser.cache.disk.enable", true);
user_pref("browser.cache.memory.enable", true);
user_pref("browser.cache.memory.capacity", 524288);
// Disable prefetching
user_pref("network.dns.disablePrefetch", true);
user_pref("network.prefetch-next", false);
user_pref("network.http.speculative-parallel-limit", 0);


// SECURITY
user_pref("dom.security.https_only_mode", true);
user_pref("permissions.default.desktop-notification", 2);


// PRIVACY
// Cookies and containers
user_pref("network.cookie.cookieBehavior", 1);
user_pref("permissions.isolateBy.userContext", true);
// Geolocation
user_pref("geo.enabled", false);
user_pref("geo.provider.network.url", "data:application/json,{\"error\": \"Geolocation disabled by user preference\"}");
// Clear cache on shutdown (keep cookies, logins and history)
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("privacy.clearOnShutdown_v2.cache", true);
user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", false);
user_pref("privacy.clearOnShutdown_v2.browsingHistoryAndDownloads", false);
user_pref("privacy.clearOnShutdown_v2.formdata", false);
user_pref("privacy.clearOnShutdown_v2.siteSettings", false);


// TELEMETRY
user_pref("toolkit.telemetry.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.usage.uploadEnabled", false);
// Crash reports
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
// Studies and experiments
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("browser.preferences.experimental.hidden", true);


// EXTENSIONS
// Disable extensions/themes recommendations
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
user_pref("extensions.recommendations.themeRecommendationUrl", "");
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.getAddons.discovery.api_url", "");


// REMOVE FIREFOX BLOATWARE
// Disable Firefox View
user_pref("browser.firefox-view.feature-tour", "");
// Disable AI chatbot
user_pref("browser.ml.chat.enabled", false);
// Disable promos
user_pref("browser.promo.pin.enabled", false);


// DEVTOOLS
user_pref("devtools.chrome.enabled", true);
user_pref("devtools.debugger.remote-enabled", true);
user_pref("browser.aboutConfig.showWarning", false);
