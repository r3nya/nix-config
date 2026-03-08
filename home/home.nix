{ lib, user, ... }:

{
  imports =
    [
      ./programs
      ./packages.nix
    ]
    ++ lib.optional (builtins.pathExists ./local.nix) ./local.nix;

  home = {
    username = user;
    homeDirectory = "/Users/${user}";
    stateVersion = "24.11";
    
    sessionPath = [
      "$HOME/.local/bin"
    ];

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  programs.home-manager.enable = true;

  home.file.".config/opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    theme = "system";
    default_agent = "plan";
    tui = {
      scroll_speed = 3;
      scroll_acceleration = {
        enabled = true;
      };
    };
  };

  home.file.".claude/settings.json".text = builtins.toJSON {
    includeCoAuthoredBy = false;
    permissions = {
      allow = [
        "Edit(~/Development/**)"
        "Bash(git diff:*)"
        "Bash(ls:*)"
        "Bash(gh pr view:*)"
        "Bash(gh pr diff:*)"
        "Bash(gh pr checks:*)"
        "Bash(yarn lint)"
        "Bash(wc:*)"
      ];
      deny = [
        "Read(~/Desktop/**)"
        "Read(~/Documents/**)"
        "Read(~/Downloads/**)"
        "Read(~/Development/**/.env*)"
      ];
      defaultMode = "plan";
    };
    hooks = {
      SessionStart = [
        {
          hooks = [
            {
              type = "command";
              command = "defaults read -g AppleInterfaceStyle 2>/dev/null | grep -q Dark && echo 'System theme: Dark' || echo 'System theme: Light'";
            }
            {
              type = "command";
              command = "$HOME/.claude/hooks/load-agents.sh";
            }
          ];
        }
      ];
    };
    alwaysThinkingEnabled = true;
  };

  home.file.".claude/hooks/load-agents.sh" = {
    executable = true;
    text = ''
      #!/bin/bash
      if [ -f "$CLAUDE_PROJECT_DIR/AGENTS.md" ]; then
        cat "$CLAUDE_PROJECT_DIR/AGENTS.md"
      fi
    '';
  };
}
