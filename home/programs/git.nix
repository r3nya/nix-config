{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      alias = {
        co = "checkout";
        br = "branch";
        ci = "commit";
        st = "status";
        unstage = "reset HEAD --";
        last = "log -1 HEAD";
        lg = "log --oneline --graph --decorate --all";
        amend = "commit --amend --no-edit";
      };

      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      core.editor = "nvim";
      merge.tool = "nvimdiff";
      credential.helper = "osxkeychain";
      diff.tool = "nvimdiff";
      difftool.prompt = false;
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      light = false;
      side-by-side = true;
      line-numbers = true;
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        theme = {
          lightTheme = false;
          activeBorderColor = [ "blue" "bold" ];
        };
      };
      git = {
        paging = {
          pager = "delta --dark --paging=never";
        };
      };
    };
  };
}
