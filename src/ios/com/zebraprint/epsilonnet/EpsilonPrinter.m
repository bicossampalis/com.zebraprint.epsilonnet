#import "EpsilonPrinter.h"
#import "MfiBtPrinterConnection.h"
#import <ExternalAccessory/ExternalAccessory.h>
#import <UIKit/UIKit.h>
#import <Cordova/NSArray+Comparisons.h>
#import <Cordova/NSDictionary+Extensions.h>
 
  @implementation EpsilonPrinter

  
 -(void)sendZplOverBluetooth:(CDVInvokedUrlCommand*)command{


     NSString* serialNumber = [command.arguments objectAtIndex:0];
     id<ZebraPrinterConnection, NSObject> thePrinterConn = [[MfiBtPrinterConnection alloc] initWithSerialNumber:serialNumber];
     
     
     BOOL success = [thePrinterConn open];
     
     
     NSString* zplData = [command.arguments objectAtIndex:1];
     
     NSError* error = nil;
     
     success = success && [thePrinterConn write:[zplData dataUsingEncoding:NSUTF8StringEncoding] error:&error];
  
     
     [thePrinterConn close];
	 
 }

 
 -(void)skataAlert:(CDVInvokedUrlCommand*)command{
 
   CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:command.callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}


 
 @end