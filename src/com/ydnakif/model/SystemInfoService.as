package com.ydnakif.model
{
  import flash.system.Capabilities;
  import flash.desktop.NativeApplication;

  /**
   * Default implementation of system information provider.
   */
  public class SystemInfoService implements ISystemInfoProvider
  {
    /**
     * @inheritDoc
     */
    public function getVersionInfo():String
    {
      return NativeApplication.nativeApplication.runtimeVersion;
    }

    /**
     * @inheritDoc
     */
    public function getOSInfo():String
    {
      var osRaw:String = Capabilities.os;
      if (osRaw.indexOf("Mac OS") != -1)
      {
        var macVersionMatch:Array = osRaw.match(/\d+\.\d+(\.\d+)?/);
        return "macOS " + (macVersionMatch ? macVersionMatch[0] : "Unknown");
      }
      return osRaw;
    }

    /**
     * @inheritDoc
     */
    public function getPlatformLabel():String
    {
      return Capabilities.playerType == "Desktop" ?
        "Adobe AIR Version" : "Flash Player Version";
    }

    /**
     * @inheritDoc
     */
    public function isDesktop():Boolean
    {
      return Capabilities.playerType == "Desktop";
    }
  }
}