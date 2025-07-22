let
  search = {
    default = "ddg";
    force = true;
  };

  settings = {
    "browser.aboutConfig.showWarning" = false;
    "browser.newtabpage.activity-stream.showSponsored" = false;
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    "browser.newtabpage.activity-stream.weather.temperatureUnits" = "c";
    "browser.privatebrowsing.autostart" = true;
    "browser.theme.content-theme" = 0;
    "browser.theme.toolbar-theme" = 0;
    "browser.urlbar.suggest.history" = false;

    "extensions.autoDisableScopes" = 0;

    "layout.css.prefers-color-scheme.content-override" = 0;

    "privacy.sanitize.sanitizeOnShutdown" = true;
    "privacy.trackingprotection.emailtracking.enabled" = true;
    "privacy.trackingprotection.enabled" = true;
    "privacy.trackingprotection.socialtracking.enabled" = true;
  };
in
{
  programs.firefox = {
      enable = true;
      languagePacks = [ "en-US" ];

      profiles = {
        default = {
          isDefault = true;

          inherit search;

          settings = settings // {
            "browser.newtabpage.pinned" = [
              {
                title = "YouTube";
                url = "https://www.youtube.com";
              }

              {
                title = "Wikipedia";
                url = "https://en.wikipedia.org";
              }
            ];

            "extensions.activeThemeID" = "{e8f3b919-d290-4270-b66f-29f3fdbb1986}";
          };
        };

        school = {
          id = 1;

          inherit search;

          extensions = {};

          settings = settings // {
            "browser.newtabpage.pinned" = [
              {
                title = "myPurdue";
                url = "https://mypurdue.purdue.edu";
              }

              {
                title = "Brightspace";
                url = "https://purdue.brightspace.com";
              }

              {
                title = "Outlook";
                url = "https://outlook.office365.com";
              }
            ];

            "sidebar.verticalTabs" = true;
          };
        };
      };
  };
}