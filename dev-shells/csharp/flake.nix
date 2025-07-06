{
  description = "A Nix-flake-based C# development environment";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";

  outputs = {
    self,
    nixpkgs,
  }: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forEachSupportedSystem = f:
      nixpkgs.lib.genAttrs supportedSystems (system:
        f {
          pkgs = import nixpkgs {
            inherit system;
            config.permittedInsecurePackages = [
              "dotnet-sdk-6.0.428"
              "dotnet-runtime-6.0.36"
            ];
          };
        });
  in {
    devShells = forEachSupportedSystem ({pkgs}: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          dotnet-sdk_8
          omnisharp-roslyn
          mono
          msbuild
        ];
      };
    });
  };
}
