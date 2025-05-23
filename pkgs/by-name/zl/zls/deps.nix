# generated by zon2nix (https://github.com/nix-community/zon2nix)

{ linkFarm, fetchzip }:

linkFarm "zig-packages" [
  {
    name = "N-V-__8AABhrAQAQLLLGadghhPsdxTgBk9N9aLVOjXW3ay0V";
    path = fetchzip {
      url = "https://github.com/ziglibs/diffz/archive/ef45c00d655e5e40faf35afbbde81a1fa5ed7ffb.tar.gz";
      hash = "sha256-5/3W0Xt9RjsvCb8Q4cdaM8dkJP7CdFro14JJLCuqASo=";
    };
  }
  {
    name = "N-V-__8AAMeOlQEipHjcyu0TCftdAi9AQe7EXUDJOoVe0k-t";
    path = fetchzip {
      url = "https://github.com/wolfpld/tracy/archive/refs/tags/v0.11.1.tar.gz";
      hash = "sha256-HofqYJT1srDJ6Y1f18h7xtAbI/Gvvz0t9f0wBNnOZK8=";
    };
  }
  {
    name = "known_folders-0.0.0-Fy-PJtLDAADGDOwYwMkVydMSTp_aN-nfjCZw6qPQ2ECL";
    path = fetchzip {
      url = "https://github.com/ziglibs/known-folders/archive/aa24df42183ad415d10bc0a33e6238c437fc0f59.tar.gz";
      hash = "sha256-YiJ2lfG1xsGFMO6flk/BMhCqJ3kB3MnOX5fnfDEcmMY=";
    };
  }
  {
    name = "lsp_codegen-0.1.0-CMjjo0ZXCQB-rAhPYrlfzzpU0u0u2MeGvUucZ-_g32eg";
    path = fetchzip {
      url = "https://github.com/zigtools/zig-lsp-codegen/archive/063a98c13a2293d8654086140813bdd1de6501bc.tar.gz";
      hash = "sha256-KzRi/a3FCS11Mryin9skkf3rFrIuoMP8+RcU0IuYNBA=";
    };
  }
]
