{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    factorio = factorio.override {
      username = "";
      password = "";
    };
  };
}

