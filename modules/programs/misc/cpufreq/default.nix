{ ... }: {
  services.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        governor = "schedutil";
        scaling_max_freq = 2800000;  # Cap to 2.8 GHz when on charger
        turbo = "never";
      };
      battery = {
        governor = "schedutil";
        scaling_max_freq = 2800000;  # Cap to 2.8 GHz when on battery
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
