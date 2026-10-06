{ config, ... }: {
  flake.modules.nixos.network = config.flake.modules.nixos.certs;
  flake.modules.nixos.certs = { pkgs, ... }: {
    # вирусы бесплатно скачать без регистрации 2026
    security.pki.certificateFiles = [
      (pkgs.fetchurl {
        url = "https://gu-st.ru/content/lending/russian_trusted_root_ca_pem.crt";
        hash = "sha256-k2pD/qbo5SW8wPgazZw9IbT8S5torOp5BtaYAFr8ZQQ=";
      })

      (pkgs.fetchurl {
        url = "https://gu-st.ru/content/lending/russian_trusted_sub_ca_pem.crt";
        hash = "sha256-8K5YnzZ3TynvNkj3mEsI1C/M5vH/7rYjbXc9rrJ0TqY=";
      })
    ];
  };
}
