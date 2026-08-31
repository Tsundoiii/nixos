{ osConfig, ... }:

{
  programs.ssh = {
    enable = true;

    settings = {
      "*".AddKeysToAgent = true;

      "eceprog" = {
        HostName = "eceprog.ecn.purdue.edu";
        User = "chen5708";
        IdentityFile = "~/.ssh/purdue-${osConfig.networking.hostName}";
      };
    };
  };
}
