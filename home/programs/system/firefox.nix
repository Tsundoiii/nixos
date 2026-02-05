let
  search = {
    default = "ddg";
    force = true;
  };

  settings = {
    "browser.aboutConfig.showWarning" = false;
    "browser.newtabpage.activity-stream.showSponsored" = false;
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    "browser.newtabpage.activity-stream.weather.display" = false;
    "browser.privatebrowsing.autostart" = true;
    "browser.urlbar.suggest.history" = false;

    "devtools.toolbox.host" = "right";

    "extensions.autoDisableScopes" = 0;
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
              title = "Spotify";
              url = "https://open.spotify.com";
            }

            {
              title = "Wikipedia";
              url = "https://en.wikipedia.org";
            }
          ];
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
              title = "Gradescope";
              url = "https://www.gradescope.com";
            }

            {
              title = "MyLab & Mastering";
              url = "https://mylab.pearson.com";
            }

            {
              title = "Outlook";
              url = "https://outlook.office365.com";
            }

            {
              title = "OneDrive";
              url = "https://purdue0-my.sharepoint.com/";
            }

            {
              title = "Word";
              url = "https://word.microsoft.cloud";
            }

            {
              title = "PaperCut";
              url = "https://wpvapppcprt01.itap.purdue.edu:9192/user";
            }

            {
              title = "Wikipedia";
              url = "https://en.wikipedia.org";
            }
          ];

          "sidebar.verticalTabs" = true;
        };
      };
    };
  };

  stylix.targets.firefox.profileNames = [
    "default"
    "school"
  ];
}
