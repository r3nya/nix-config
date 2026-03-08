{ hostname, user, ... }:

{
  networking = {
    hostName = hostname;
    localHostName = hostname;
    computerName = hostname;
  };

  system = {
    defaults = {
      dock = {
        autohide = true;
        show-recents = false;
        launchanim = false;
        magnification = true;
        largesize = 64;
        orientation = "bottom";
        tilesize = 48;
        minimize-to-application = true;
      };

      finder = {
        NewWindowTarget = "Home";
        FXPreferredViewStyle = "Nlsv";
        ShowPathbar = true;
        ShowStatusBar = true;
        FXEnableExtensionChangeWarning = false;
        _FXSortFoldersFirst = true;
      };

      NSGlobalDomain = {
        AppleKeyboardUIMode = 3;
        ApplePressAndHoldEnabled = false;
        InitialKeyRepeat = 10;
        KeyRepeat = 1;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        _HIHideMenuBar = false;
      };

      screencapture = {
        location = "/Users/${user}/Pictures/Screenshots";
        type = "png";
      };

      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = false;
    };
  };

  system.defaults.CustomUserPreferences = {
    NSGlobalDomain = {
      "com.apple.sound.beep.feedback" = 0;
    };
  };
}
