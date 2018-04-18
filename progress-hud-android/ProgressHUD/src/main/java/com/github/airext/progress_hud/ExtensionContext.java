package com.github.airext.progress_hud;

import com.adobe.fre.FREFunction;
import com.github.airext.progress_hud.functions.DismissFunction;
import com.github.airext.progress_hud.functions.IsSupportedFunction;
import com.github.airext.progress_hud.functions.ShowFunction;
import com.github.airext.progress_hud.functions.VersionFunction;

import java.util.HashMap;
import java.util.Map;

public class ExtensionContext extends com.adobe.fre.FREContext {

    @Override
    public Map<String, FREFunction> getFunctions() {
        Map<String, FREFunction> functions = new HashMap<String, FREFunction>();
        functions.put("isSupported", new IsSupportedFunction());
        functions.put("version", new VersionFunction());
        functions.put("show", new ShowFunction());
        functions.put("dismiss", new DismissFunction());
        return functions;
    }

    @Override
    public void dispose() {

    }
}
