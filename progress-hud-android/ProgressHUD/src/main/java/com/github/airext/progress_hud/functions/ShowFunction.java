package com.github.airext.progress_hud.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREObject;
import com.bigkoo.svprogresshud.SVProgressHUD;

public class ShowFunction implements com.adobe.fre.FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {
        new SVProgressHUD(context.getActivity()).show();
        return null;
    }
}
