#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(MapkitLocalSearch, NSObject)

RCT_EXTERN_METHOD(searchForLocations:(NSString)searchText withRegion:(NSDictionary)region
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

@end
