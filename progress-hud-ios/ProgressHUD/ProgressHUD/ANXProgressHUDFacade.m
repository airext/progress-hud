//
//  ANXProgressHUDFacade.m
//  ProgressHUD
//
//  Created by Max Rozdobudko on 4/18/18.
//  Copyright © 2018 Max Rozdobudko. All rights reserved.
//

#import "ANXProgressHUDFacade.h"
#import "FlashRuntimeExtensions.h"
#import "ANXProgressHUDConversionRoutines.h"
#import <SVProgressHUD/SVProgressHUD.h>

@implementation ANXProgressHUDFacade

@end

#pragma mark API

FREObject ANXProgressHUDIsSupported(FREContext context, void* functionData, uint32_t argc, FREObject argv[]){
    NSLog(@"ANXProgressHUDIsSupported");
    return [ANXProgressHUDConversionRoutines convertBoolToFREObject: YES];
}

FREObject ANXProgressHUDVersion(FREContext context, void* functionData, uint32_t argc, FREObject argv[]){
    NSLog(@"ANXProgressHUDVersion");

    return [ANXProgressHUDConversionRoutines convertNSStringToFREObject: [NSString stringWithFormat: @"%li", (long)[SVProgressHUD version]]];
}


FREObject ANXProgressHUDShow(FREContext context, void* functionData, uint32_t argc, FREObject argv[]) {
    NSLog(@"ANXProgressHUDShow");

    [SVProgressHUD show];

    return NULL;
}

FREObject ANXProgressHUDDismiss(FREContext context, void* functionData, uint32_t argc, FREObject argv[]) {
    NSLog(@"ANXProgressHUDDismiss");

    [SVProgressHUD dismiss];
    
    return NULL;
}

#pragma mark ContextInitialize/ContextFinalizer

void ANXProgressHUDContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet) {

    *numFunctionsToSet = 4;

    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * (*numFunctionsToSet));

    func[0].name = (const uint8_t*) "isSupported";
    func[0].functionData = NULL;
    func[0].function = &ANXProgressHUDIsSupported;

    func[1].name = (const uint8_t*) "version";
    func[1].functionData = NULL;
    func[1].function = &ANXProgressHUDVersion;

    func[2].name = (const uint8_t*) "show";
    func[2].functionData = NULL;
    func[2].function = &ANXProgressHUDShow;

    func[3].name = (const uint8_t*) "dismiss";
    func[3].functionData = NULL;
    func[3].function = &ANXProgressHUDDismiss;

    *functionsToSet = func;
}

void ANXProgressHUDContextFinalizer(FREContext ctx){
    NSLog(@"ANXProgressHUDContextFinalizer");
}

#pragma mark Initializer/Finalizer

void ANXProgressHUDInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet) {
    NSLog(@"ANXProgressHUDInitializer");

    *extDataToSet = NULL;

    *ctxInitializerToSet = &ANXProgressHUDContextInitializer;
    *ctxFinalizerToSet = &ANXProgressHUDContextFinalizer;
}

void ANXProgressHUDFinalizer(void* extData) {
    NSLog(@"ANXProgressHUDFinalizer");
}
