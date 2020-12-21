//
//  ShowTouchesViewManager.m
//  ShowTouches
//
//  Created by Michael Kiley on 12/18/20.
//

#import <Foundation/Foundation.h>
#import "React/RCTViewManager.h"

@interface RCT_EXTERN_MODULE(ShowTouchesViewManager, RCTViewManager)

//Main circle props
RCT_EXPORT_VIEW_PROPERTY(color, UIColor)
RCT_EXPORT_VIEW_PROPERTY(opacity, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(radius, NSNumber)

//Border props
RCT_EXPORT_VIEW_PROPERTY(borderColor, UIColor)
RCT_EXPORT_VIEW_PROPERTY(borderOpacity, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(borderWidth, NSNumber)

//Animation props
RCT_EXPORT_VIEW_PROPERTY(fadeDuration, NSNumber)

@end

