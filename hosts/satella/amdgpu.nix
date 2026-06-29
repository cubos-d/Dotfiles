{ config, pkgs, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];
  # 1. Enable standard OpenCL/HIP hardware injection layers
  hardware.amdgpu.opencl.enable = true;
  # 2. Fix hardcoded library search paths for external compute tools
  systemd.tmpfiles.rules =
  let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [
        rocblas
        hipblas
        clr
      ];
    };
  in
  [
    "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  ];
  # 3. Enable Ollama service with ROCm/AMD acceleration
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    environmentVariables = {
      HSA_OVERRIDE_GFX_VERSION = "10.3.0";
    };
  };
  services.lact.enable = true;
}
