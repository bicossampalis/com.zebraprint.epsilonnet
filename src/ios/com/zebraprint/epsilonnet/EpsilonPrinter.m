#import "EpsilonPrinter.h"

 
  @implementation EpsilonPrinter
  @synthesize cordova_command;
  

 
 -(void)skataAlert:(CDVInvokedUrlCommand*)command{
 
 
 
   [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"skata"] callbackId:self.cordova_command.callbackId];
}


 
 @end