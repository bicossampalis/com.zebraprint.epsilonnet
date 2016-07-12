#import "EpsilonPrinter.h"
#import "Toast+UIView.h"
#import "MfiBtPrinterConnection.h"
 
  @implementation EpsilonPrinter
 -(void)sendZplOverBluetooth:(CDVInvokedUrlCommand*)command{

   
   NSArray *names = [NSArray arrayWithObjects: [command.arguments objectAtIndex:0],[command.arguments objectAtIndex:1], nil];
   
   
   [MfiBtPrinterConnection sendZplOverBluetoothParent:names];
 }
 
 -(void)skataAlert:(CDVInvokedUrlCommand*)command{
  NSDictionary* options = [command argumentAtIndex:0];
  NSString *message  = options[@"message"];
  NSString *duration = options[@"duration"];
  NSString *position = options[@"position"];
  NSDictionary *data = options[@"data"];
  NSNumber *addPixelsY = options[@"addPixelsY"];
  NSDictionary *styling = options[@"styling"];
  
  if (![position isEqual: @"top"] && ![position isEqual: @"center"] && ![position isEqual: @"bottom"]) {
    CDVPluginResult * pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"invalid position. valid options are 'top', 'center' and 'bottom'"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    return;
  }
  
  NSTimeInterval durationMS;
  if ([duration.lowercaseString isEqualToString: @"short"]) {
    durationMS = 2000;
  } else if ([duration.lowercaseString isEqualToString: @"long"]) {
    durationMS = 4000;
  } else {
    durationMS = [duration intValue];
  }
  
  [self.webView makeToast:message
                 duration:durationMS / 1000
                 position:position
               addPixelsY:addPixelsY == nil ? 0 : [addPixelsY intValue]
                     data:data
                  styling:styling
          commandDelegate:self.commandDelegate
               callbackId:command.callbackId];
  
  CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
  pluginResult.keepCallback = [NSNumber numberWithBool:YES];
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


 
 @end