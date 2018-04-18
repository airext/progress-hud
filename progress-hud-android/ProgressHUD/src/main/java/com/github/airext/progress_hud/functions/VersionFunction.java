package com.github.airext.progress_hud.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;
import com.bigkoo.svprogresshud.BuildConfig;
import com.bigkoo.svprogresshud.SVProgressHUD;

/**
 * Created by max on 1/19/18.
 */

public class VersionFunction implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {
        try {
            return FREObject.newObject(BuildConfig.VERSION_NAME);
        } catch (FREWrongThreadException e) {
            e.printStackTrace();
            return null;
        }
    }
}
