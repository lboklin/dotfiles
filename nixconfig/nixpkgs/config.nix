{
  # Unity3D requirement.
  security.chromiumSuidSandbox.enable = true;

  allowUnfree = true;
  # allowBroken = true;

  packageOverrides = super: let self = super.pkgs; in {

    # Generic Haskell environment.
    myHaskellEnv = self.haskellPackages.ghcWithHoogle
                     (haskellPackages: with haskellPackages; [
                       # tools
                       cabal-install 
		       haskintex 
		       yesod-bin 
		       stack 
		       hlint 
		       ghc-mod
                     ]);

    # Environment for work.
    myUnityEnv = with self; [
      emacs
      vscode
      unity3d
      fsharp
      mono46
      mono-addins
      monodevelop
    ];
  };
}
