{lib, buildGoModule, fetchFromGitHub}:

buildGoModule rec {
  pname = "trok";
  version = "0.0.2";

  src = fetchFromGitHub {
    owner = "tuxdotrs";
    repo = "trok";
    rev = "v${version}";
    hash = "sha256-d6H+zTm0g1loLBQOoesyLKFRAIDzdR7zPpO7fU/hSCY=";
  };

  vendorHash = "sha256-KwcLxkW3pbzujjc6JOZRwATlAA/qndf4FWpkJANv2z8=";

  meta = with lib; {
    description = "Simple and efficient tunneling service";
    homepage = "https://github.com/tuxdotrs/trok";
    license = licenses.mit;
    maintainers = with maintainers; [];
  };
} 