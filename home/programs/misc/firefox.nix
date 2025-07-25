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
  };
in
{
  programs.firefox = {
      enable = true;
      languagePacks = [ "en-US" ];

      policies = {
        EnableTrackingProtection = {
          Value = true;
          Cryptomining = true;
          Fingerprinting = true;
          EmailTracking = true;
        };

        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          };
        };

        HttpsOnlyMode = "force_enabled";
      };

      profiles = {
        default = {
          containersForce = true;
          containers = {
            Google = {
              color = "red";
              icon = "circle";
            };
          };

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

          settings = settings // {
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
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