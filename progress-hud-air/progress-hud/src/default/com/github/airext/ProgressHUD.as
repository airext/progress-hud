/**
 * Created by max.rozdobudko@gmail.com on 4/18/18.
 */
package com.github.airext {
import com.github.airext.core.progress_hud;

import flash.system.Capabilities;

use namespace progress_hud;

public class ProgressHUD {

    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    public static function get isSupported(): Boolean {
        return false;
    }

    public static function extensionVersion():String {
        return null;
    }

    //--------------------------------------------------------------------------
    //
    //  API
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  version
    //-------------------------------------

    public static function get version(): String {
        trace("ProgressHUD is not supported for " + Capabilities.os);
        return null;
    }

    //-------------------------------------
    //  show
    //-------------------------------------

    public static function show(): void {
        trace("ProgressHUD is not supported for " + Capabilities.os);
    }

    //-------------------------------------
    //  dismiss
    //-------------------------------------

    public static function dismiss(): void {
        trace("ProgressHUD is not supported for " + Capabilities.os);
    }

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function ProgressHUD() {
        super();
    }

}
}
