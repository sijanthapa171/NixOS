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
        scaling_max_freq = 3800000;
        turbo = "never";
      };
    };
  };
}
