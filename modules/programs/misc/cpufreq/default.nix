{...}: {
  services.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        governor = "ondemand";  # Balanced mode for charger
        turbo = "never";
      };
      battery = {
        governor = "ondemand";  # Balanced mode for battery
        scaling_max_freq = 3800000;
        turbo = "never";
      };
    };
  };
}


# for hyper power
# {...}: {
#   services.auto-cpufreq = {
#     enable = true;
#     settings = {
#       charger = {
#         governor = "performance";
#         turbo = "auto";
#       };
#       battery = {
#         governor = "schedutil";
#         scaling_max_freq = 3800000;
#         turbo = "never";
#       };
#     };
#   };
# }