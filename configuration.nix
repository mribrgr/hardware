{
  modulesPath,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
  ];
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    efiInstallAsRemovable = true;
    devices = [ "/dev/vda" ];
  };

  # Disable systemd-boot and UEFI variable writing
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = false;

  services.openssh.enable = true;

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.gitMinimal
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCk9F1FJpQ/HT6QfWAcbHW+o5w2yUIc4MpL4aZxpKUkzLVawfvzfcOIpMJsxD4ZSMrd1icFIRxGm6n26tBMFG0/ktAxrcrlZ5qHD1oTk5JWgwihGrGvWRfKd9fuHdKltacn8YhfJnvQh0XNUK1GdSLsjlRQm7s96O/84SdsGrKQIWlhz/rwT96clbw/YiQnHpEb/pflaF++co7YpMyVuc4Aj2dEz4tMkGmIF8Cm5k0pT54OGiRYPytB3wFcpyUG9S20OGl7v9P9LfNknaKoRQMC1xdVIsYtSD/q8AP2l2EpVPIJLXcJ/1Py1OjhmbYOkWBhrWONdCuerBTUbGjE6rf6OowW0HdBEybj95zZCYfWR//+XCjEpsI9pGoZzvoweBaYkIbxdvlJIlpVoSpoKEw1xdjiLZnvNCZPXk3Nh08XR+yTM3V734tvBq/mQclpMg3qYwEKSZKUaNOGrbgc0WwFyJoguqG5Ge4HsL6aH84tzkBxOKHb4Vx40fzp14nj5M5TcIkj8n84y4I8bynCIvFAa/XuwYkk8/FYwQ54dqiiciF3TrRrjgPI6ftWeZebbEInNdZFEgdQmA8sEa75UuHdIFKI3s3hCVmTlUtwuYkVboS2x7bu2kZ8HRMivkEIyypW89dfGVMTcJ4HaGeoSfLZ2tpKffWkcSejx/dM3pnZVQ=="
  ];

  system.stateVersion = "24.11";
}
