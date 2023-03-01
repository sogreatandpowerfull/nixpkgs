# Written by sogreatandpowerful under the GNU General Public License v3.0
# ATTENTION(sogreatandpowerful): This is malpractice. Possibly broken package. Use at your own risk.
{
  stdenvNoCC,
  pkgs,
}:
stdenvNoCC.mkDerivation rec {
  pname = "hblock";
  version = "3.4.1";

  meta = with pkgs.lib; {
    description = "A POSIX-compliant shell script for blocking ads, malware and tracking domains";
    homepage = "https://github.com/hectorm/hblock";
    license = licenses.mit;
    maintainers = with maintainers; [sogreatandpowerful];
    mainProgram = "hblock";
    # Mark broken packages as broken packages or travis (and consequently caching) will fail
    broken = true;
  };

  src = pkgs.fetchFromGitHub {
    owner = "hectorm";
    repo = "hblock";
    rev = "v${version}";
    sha256 = "1j0ypfh2hylhihx3xis76aafmwz8cqv0n2ndyr3pbr5cql5gzrf8";
  };

  buildInputs = [pkgs.coreutils];
  nativeBuildInputs = [pkgs.installShellFiles pkgs.makeWrapper];

  # TODO(sogreatandpowerful): Add systemd service
  # <https://github.com/hectorm/hblock/tree/master/resources/systemd>
  installPhase = ''
    install -Dm744 $src/hblock $out/bin/hblock
    runHook postInstall
  '';

  postInstall = ''
    installManPage hblock.1
  '';
}
