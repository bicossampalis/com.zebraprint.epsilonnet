#import "EpsilonPrinter.h"
#import "MfiBtPrinterConnection.h"
 
  @implementation EpsilonPrinter
  @synthesize cordova_command;
  
 -(void)sendZplOverBluetooth:(CDVInvokedUrlCommand*)command{

 self.cordova_command = command;
   
   NSArray *names = [NSArray arrayWithObjects: [command.arguments objectAtIndex:0],[command.arguments objectAtIndex:1], nil];
   
   
   [MfiBtPrinterConnection sendZplOverBluetoothParent:names];
 }
 
 -(void)skataAlert:(CDVInvokedUrlCommand*)command{
 
 
 
   [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"skata"] callbackId:self.cordova_command.callbackId];
}


 
 @end