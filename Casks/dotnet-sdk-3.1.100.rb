cask "dotnet-sdk-3.1.100" do
  version "3.1.106,3.1.6"
  sha256 "cfb9777edd251f4e45c25e72ae5c276aebe6a3e10c2c6a904bd0d082d3596a84"

  url "https://download.visualstudio.microsoft.com/download/pr/ac3bd3ba-6a6c-4eff-a51c-835fce92b9db/77db90a6e13a5fe71dcea5d86a496fc2/dotnet-sdk-3.1.106-osx-x64.pkg"
  name ".NET Core SDK #{version.before_comma}"
  homepage "https://www.microsoft.com/net/core#macos"

  depends_on macos: "> :sierra"

  pkg "dotnet-sdk-#{version.before_comma}-osx-x64.pkg"

  uninstall pkgutil: "com.microsoft.dotnet.dev.#{version.before_comma}.component.osx.x64"

  zap trash:   ["~/.dotnet", "~/.nuget"],
      pkgutil: [
        "com.microsoft.dotnet.hostfxr.#{version.after_comma}.component.osx.x64",
        "com.microsoft.dotnet.sharedframework.Microsoft.NETCore.App.#{version.after_comma}.component.osx.x64",
        "com.microsoft.dotnet.sharedhost.component.osx.x64",
      ]

  caveats "Uninstalling the offical dotnet-sdk casks will remove the shared runtime dependencies, "\
          "so you\'ll need to reinstall the particular version cask you want from this tap again "\
          "for the `dotnet` command to work again."
end
