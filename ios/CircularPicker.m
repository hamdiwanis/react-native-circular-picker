// import RCTViewManager
#if __has_include(<React/RCTViewManager.h>)
#import <React/RCTViewManager.h>
#elif __has_include(“RCTViewManager.h”)
#import “RCTViewManager.h”
#else
#import “React/RCTViewManager.h”
#endif

// todo: expose more porops
@interface RCT_EXTERN_MODULE(CircularPicker, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(colors, NSArray)
RCT_EXPORT_VIEW_PROPERTY(text, NSString)
RCT_EXPORT_VIEW_PROPERTY(current, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(max, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(onValueChange, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onColorChange, RCTBubblingEventBlock)

@end
