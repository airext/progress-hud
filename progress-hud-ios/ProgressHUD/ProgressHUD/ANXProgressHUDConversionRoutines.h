//
//  ANXProgressHUDConversionRoutines.h
//  ProgressHUD
//
//  Created by Max Rozdobudko on 4/18/18.
//  Copyright © 2018 Max Rozdobudko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"

@interface ANXProgressHUDConversionRoutines : NSObject

+(FREObject) convertBoolToFREObject: (BOOL) value;
+(BOOL) convertFREObjectToBool: (FREObject) value;

+(FREObject) convertNSStringToFREObject:(NSString*) string;
+(NSString*) convertFREObjectToNSString: (FREObject) string;

+(FREObject) convertNSIntegerToFREObject: (NSInteger) value;
+(NSInteger) convertFREObjectToNSInteger: (FREObject) value;

@end
