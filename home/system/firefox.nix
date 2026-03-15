let
  ublock = "uBlock0@raymondhill.net";
  browserpass = "browserpass@maximbaz.com";
  tenten = "{dedb3663-6f13-4c6c-bf0f-5bd111cb2c79}";
  zhongwen = "{59812185-ea92-4cca-8ab7-cfcacee81281}";

  extension = id: {
    installation_mode = "force_installed";
    private_browsing = true;
    default_area = "navbar";
    install_url = "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";
  };

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
        "${ublock}" = extension ublock;
        "${browserpass}" = extension browserpass;
        "${zhongwen}" = extension zhongwen;
        "${tenten}" = extension tenten;
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

        bookmarks = {
          force = true;

          settings = [
            {
              name = "Tech";

              bookmarks = [
                {
                  name = "Linux";

                  bookmarks = [
                    {
                      name = "CUPS";
                      url = "http://localhost:631";
                    }

                    {
                      name = "Linux Journey";
                      url = "https://linuxjourney.com";
                    }

                    {
                      name = "Linux From Scratch";
                      url = "https://www.linuxfromscratch.org/lfs";
                    }

                    {
                      name = "Zero to Nix";
                      url = "https://zero-to-nix.com";
                    }
                  ];
                }

                {
                  name = "Programming";

                  bookmarks = [
                    {
                      name = "Languages";

                      bookmarks = [
                        {
                          name = "Crafting Interpreters";
                          url = "https://craftinginterpreters.com";
                        }

                        {
                          name = "Sequent Calculus";
                          url = "https://ryanbrewer.dev/posts/sequent-calculus";
                        }
                      ];
                    }

                    {
                      name = "Demos";

                      bookmarks = [
                        {
                          name = "The Grug Brained Developer";
                          url = "https://grugbrain.dev";
                        }

                        {
                          name = "How I Experience Web Today";
                          url = "https://how-i-experience-web-today.com";
                        }

                        {
                          name = "User Inyerface";
                          url = "https://userinyerface.com";
                        }

                        {
                          name = "Motherfucking Website";
                          url = "https://motherfuckingwebsite.com";
                        }

                        {
                          name = "Puter";
                          url = "https://puter.com";
                        }

                        {
                          name = "Mackerelmedia Fish";
                          url = "https://mackerelmediafish.com";
                        }
                      ];
                    }
                  ];
                }

                {
                  name = "GitHub";
                  url = "https://github.com";
                }

                {
                  name = "Oh Shit, Git!?!";
                  url = "https://ohshitgit.com";
                }
              ];
            }

            {
              name = "Linguistics";

              bookmarks = [
                {
                  name = "Chinese";

                  bookmarks = [
                    {
                      name = "MDBG Chinese Dictionary";
                      url = "https://www.mdbg.net/chinese/dictionary";
                    }

                    {
                      name = "Learning Cangjie";
                      url = "https://learningcangjie.com/demo/demo.html";
                    }

                    {
                      name = "Canto Lessons (1 to 7) Vocab and Grammar";
                      url = "https://docs.google.com/document/d/1Zhq9GfH8xnAUM59-UnaeQ-zKM0mvwzAbKBKlEEMxDiI/edit#";
                    }

                    {
                      name = "BCC语料库";
                      url = "http://bcc.blcu.edu.cn";
                    }
                  ];
                }

                {
                  name = "Language Log";
                  url = "https://languagelog.ldc.upenn.edu";
                }

                {
                  name = "Clozemaster";
                  url = "https://www.clozemaster.com/languages";
                }

                {
                  name = "Marshall's Site";
                  url = "https://marshallyin.com";
                }

                {
                  name = "Venla";
                  url = "https://venla.info";
                }
              ];
            }

            {
              name = "Queer";

              bookmarks = [
                {
                  name = "Queering The Map";
                  url = "https://www.queeringthemap.com";
                }

                {
                  name = "Transgender Map";
                  url = "https://www.transgendermap.com";
                }

                {
                  name = "REFUGE Restrooms";
                  url = "https://refugerestrooms.org";
                }
              ];
            }

            {
              name = "Reading";

              bookmarks = [
                {
                  name = "Rest of World";
                  url = "https://restofworld.org";
                }

                {
                  name = "Sixth Tone";
                  url = "https://www.sixthtone.com";
                }

                {
                  name = "Coda Story";
                  url = "https://www.codastory.com";
                }

                {
                  name = "Global Voices";
                  url = "https://globalvoices.org";
                }

                {
                  name = "Quanta Magazine";
                  url = "https://www.quantamagazine.org";
                }

                {
                  name = "h2g2";
                  url = "https://h2g2.com";
                }

                {
                  name = "辟谣吧";
                  url = "https://www.piyaoba.org";
                }

                {
                  name = "The Unsent Project";
                  url = "https://theunsentproject.com";
                }
              ];
            }

            {
              name = "Outdoors";

              bookmarks = [
                {
                  name = "Geocaching";
                  url = "https://www.geocaching.com";
                }

                {
                  name = "INDOT Benchmark Locator";
                  url = "https://entapps.indot.in.gov/dotmaps/Benchmarks/DefaultMap.htm";
                }
              ];
            }

            {
              name = "Puzzles";

              bookmarks = [
                {
                  name = "Bellingcat Open Source Challenge";
                  url = "https://challenge.bellingcat.com";
                }

                {
                  name = "MIT Mystery Hunt";
                  url = "https://puzzles.mit.edu";
                }

                {
                  name = "Cipher Challenge";
                  url = "https://www.cipherchallenge.org";
                }

                {
                  name = "The Keeper's House";
                  url = "http://thekeepershouse.uk";
                }

                {
                  name = "Geocaching Toolbox";
                  url = "https://www.geocachingtoolbox.com";
                }
              ];
            }

            {
              name = "Broadcasting";

              bookmarks = [
                {
                  name = "Radio-Locator";
                  url = "https://radio-locator.com";
                }

                {
                  name = "FCC Station Query";
                  url = "https://www.fcc.gov/media/radio/am-query";
                }

                {
                  name = "WRTH Online";
                  url = "https://www.wrth.com";
                }
              ];
            }

            {
              name = "Other";

              bookmarks = [
                {
                  name = "Nanidafuqamisaying";
                  url = "https://soundcloud.com/xkiichan/nanidafuqamisaying";
                }

                {
                  name = "Drawabox";
                  url = "https://drawabox.com";
                }

                {
                  name = "CHS LaTeX Lab Reports";
                  url = "https://mirrors.rit.edu/CTAN/macros/latex/contrib/chs-physics-report/chs-physics-report.pdf";
                }

                {
                  name = "Conga!";
                  url = "https://matias.ma/nsfw";
                }

                {
                  name = "Endless Depths";
                  url = "http://endlessdepths.com";
                }

                {
                  name = "DreamWeaver Studios";
                  url = "https://dreamweaverstudios.com";
                }

                {
                  name = "Why start at x, y, z";
                  url = "https://whystartat.xyz";
                }

                {
                  name = "Subway Builder";
                  url = "https://www.subwaybuilder.com";
                }

                {
                  name = "The Most Dangerous Writing App";
                  url = "https://www.squibler.io/dangerous-writing-prompt-app";
                }
              ];
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
