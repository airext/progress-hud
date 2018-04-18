package com.github.airext.progress_hud.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREObject;
import com.bigkoo.svprogresshud.SVProgressHUD;

public class DismissFunction implements com.adobe.fre.FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {
        new SVProgressHUD(context.getActivity()).dismiss();
        return null;
    }
}
