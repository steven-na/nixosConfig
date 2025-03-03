(final: prev: {
    nixfmt-rfc-style = prev.nixfmt-rfc-style.overrideAttrs (old: {
        src = prev.fetchFromGitHub {
            owner = "NixOS";
            repo = "nixfmt";
            rev = "187985fd1408074a352d3be407bd9524417afe57";
            hash = "sha256-MZq/h+48FlA1XqRjXsJsBvZxA+6V3dpnaOI+O7udcBQ=";
        };
    });
})
