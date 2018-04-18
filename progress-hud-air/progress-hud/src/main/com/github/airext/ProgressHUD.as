/**
 * Created by max.rozdobudko@gmail.com on 4/18/18.
 */
package com.github.airext {
import com.github.airext.core.progress_hud;

import flash.external.ExtensionContext;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

use namespace progress_hud;

public class ProgressHUD {

    //--------------------------------------------------------------------------
    //
    //  Class constants
    //
    //--------------------------------------------------------------------------

    progress_hud static const EXTENSION_ID:String = "com.github.airext.ProgressHUD";

    //--------------------------------------------------------------------------
    //
    //  Class properties
    //
    //--------------------------------------------------------------------------

    private static var _context: ExtensionContext;

    progress_hud static function get context(): ExtensionContext {
        if (_context == null) {
            _context = ExtensionContext.createExtensionContext(EXTENSION_ID, null);
        }
        return _context;
    }

    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    /**
     * Indicates if ProgressHUD extension is supported on current platform.
     *
     * @return <code>true</code> if ProgressHUD is supported or <code>false</code>
     * otherwise.
     */
    public static function isSupported(): Boolean {
        return context != null && context.call("isSupported");
    }

    //-------------------------------------
    //  extensionVersion
    //-------------------------------------

    private static var _extensionVersion:String = null;

    /**
     * Returns version of extension
     * @return extension version
     */
    public static function extensionVersion():String
    {
        if (_extensionVersion == null) {
            try {
                var extension_xml:File = ExtensionContext.getExtensionDirectory(EXTENSION_ID).resolvePath("META-INF/ANE/extension.xml");
                if (extension_xml.exists) {
                    var stream:FileStream = new FileStream();
                    stream.open(extension_xml, FileMode.READ);

                    var extension:XML = new XML(stream.readUTFBytes(stream.bytesAvailable));
                    stream.close();

                    var ns:Namespace = extension.namespace();

                    _extensionVersion = extension.ns::versionNumber;
                }
            } catch (error:Error) {
                // ignore
            }
        }

        return _extensionVersion;
    }

    //--------------------------------------------------------------------------
    //
    //  API
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  show
    //-------------------------------------

    public static function show(): void {
        context.call("show");
    }

    //-------------------------------------
    //  dismiss
    //-------------------------------------

    public static function dismiss(): void {
        context.call("dismiss")
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
