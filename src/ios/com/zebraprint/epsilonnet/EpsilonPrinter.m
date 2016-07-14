#import "EpsilonPrinter.h"
#import "MfiBtPrinterConnection.h"
#import <ExternalAccessory/ExternalAccessory.h>
#import <UIKit/UIKit.h>
#import <Cordova/NSArray+Comparisons.h>
#import <Cordova/NSDictionary+Extensions.h>
 
  @implementation EpsilonPrinter

  
 -(void)sendZplOverBluetooth:(CDVInvokedUrlCommand*)command{


     NSString *serialNumber = @"";
    
	  EAAccessoryManager *sam = [EAAccessoryManager sharedAccessoryManager];
     NSArray * connectedAccessories = [sam connectedAccessories];
     for (EAAccessory *accessory in connectedAccessories) {
         if([accessory.protocolStrings indexOfObject:@"com.zebra.rawport"] != NSNotFound){
             serialNumber = accessory.serialNumber;
             break;
             //Note: This will find the first printer connected! If you have multiple Zebra printers connected, you should display a list to the user and have him select the one they wish to use
         }
     }

     id<ZebraPrinterConnection, NSObject> thePrinterConn = [[MfiBtPrinterConnection alloc] initWithSerialNumber:serialNumber];
     
     
     BOOL success = [thePrinterConn open];
     
     
     NSString* zplData = [command.arguments objectAtIndex:1];
     
     NSError* error = nil;
     
     success = success && [thePrinterConn write:[zplData dataUsingEncoding:NSUTF8StringEncoding] error:&error];
  
     [thePrinterConn close];
	 
	 
if (success != YES || error != nil) {
       CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:command.callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
     }
     else{
	   CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:command.callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
	 }
 }

 
 -(void)skataAlert:(CDVInvokedUrlCommand*)command{
 
   CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:command.callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}


 
 @end