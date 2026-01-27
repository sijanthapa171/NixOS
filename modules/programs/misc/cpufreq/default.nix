{ ... }:
{
  services.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        governor = "schedutil";
        turbo = "never";
      };
      battery = {
        governor = "schedutil";
        turbo = "never";
      };
    };
  };
}
