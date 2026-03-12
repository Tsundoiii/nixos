let
  settings = {
    extensions.autoDisableScopes = 0;

    devtools.toolbox.host = "right";

    browser = {
      privatebrowsing.autostart = true;

      urlbar.suggest.history = false;

      aboutConfig.showWarning = false;

      newtabpage = {
        activity-stream.showSponsored = false;
        activity-stream.showSponsoredTopSites = false;
        activity-stream.system.showWeather = false;
      };
    };
  };

  search = {
    default = "ddg";
    force = true;
  };
in
{
  programs.firefox = {
    enable = true;

    policies = {
      HttpsOnlyMode = "force_enabled";

      EnableTrackingProtection = {
        Value = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/uBlock0@raymondhill.net/latest.xpi";
          private_browsing = true;
        };

        "browserpass@maximbaz.com" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/browserpass@maximbaz.com/latest.xpi";
          private_browsing = true;
        };

        "{dedb3663-6f13-4c6c-bf0f-5bd111cb2c79}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/{dedb3663-6f13-4c6c-bf0f-5bd111cb2c79}/latest.xpi";
        };

        "{59812185-ea92-4cca-8ab7-cfcacee81281}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/{59812185-ea92-4cca-8ab7-cfcacee81281}/latest.xpi";
        };
      };
    };

    profiles = {
      default = {
        inherit search;

        settings = settings // {
          browser.newtabpage.pinned = [
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
        inherit search;

        id = 1;

        settings = settings // {
          sidebar.verticalTabs = true;

          browser.newtabpage = {
            activity-stream.feeds.section.topstories = false;

            pinned = [
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
          };
        };
      };
    };
  };

  stylix.targets.firefox.profileNames = [
    "default"
    "school"
  ];
}
