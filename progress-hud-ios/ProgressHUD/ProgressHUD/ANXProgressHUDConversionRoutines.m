//
//  ANXProgressHUDConversionRoutines.m
//  ProgressHUD
//
//  Created by Max Rozdobudko on 4/18/18.
//  Copyright © 2018 Max Rozdobudko. All rights reserved.
//

#import "ANXProgressHUDConversionRoutines.h"

@implementation ANXProgressHUDConversionRoutines

+(FREObject) convertBoolToFREObject: (BOOL) value
{
    FREObject result;

    if (value)
        FRENewObjectFromBool((uint32_t) 1, &result);
    else
        FRENewObjectFromBool((uint32_t) 0, &result);

    return result;
}

+(BOOL) convertFREObjectToBool: (FREObject) value
{
    uint32_t tempValue;

    FREResult result = FREGetObjectAsBool(value, &tempValue);

    if (result != FRE_OK)
        return NO;

    return tempValue > 0;
}

+(FREObject) convertNSStringToFREObject:(NSString*) string
{
    if (string == nil) return NULL;

    const char* utf8String = string.UTF8String;

    unsigned long length = strlen( utf8String );

    FREObject converted;
    FREResult result = FRENewObjectFromUTF8((uint32_t) length + 1, (const uint8_t*) utf8String, &converted);

    if (result != FRE_OK)
        return NULL;

    return converted;
}

+(NSString*) convertFREObjectToNSString: (FREObject) string
{
    FREResult result;

    uint32_t length = 0;
    const uint8_t* tempValue = NULL;

    result = FREGetObjectAsUTF8(string, &length, &tempValue);

    if (result != FRE_OK)
        return nil;

    NSString *value = [NSString stringWithUTF8String: (const char*) tempValue];

    return value;
}

+(FREObject) convertNSIntegerToFREObject: (NSInteger) value
{
    FREObject convertedValue;

    FREResult result = FRENewObjectFromInt32((int32_t) value, &convertedValue);

    if (result != FRE_OK)
        return NULL;

    return convertedValue;
}

+(NSInteger) convertFREObjectToNSInteger: (FREObject) value
{
    int32_t convertedValue;

    FREResult result = FREGetObjectAsInt32(value, &convertedValue);

    if (result != FRE_OK)
        return 0;

    return (NSInteger) convertedValue;
}

@end
