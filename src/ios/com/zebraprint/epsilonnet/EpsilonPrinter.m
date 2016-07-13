#import "EpsilonPrinter.h"
#import "MfiBtPrinterConnection.h"
#import <UIKit/UIKit.h>
#import <Cordova/NSArray+Comparisons.h>
#import <Cordova/NSDictionary+Extensions.h>
 
  @implementation EpsilonPrinter

  
 -(void)sendZplOverBluetooth:(CDVInvokedUrlCommand*)command{


   
  // NSArray *names = [NSArray arrayWithObjects: [command.arguments objectAtIndex:0],[command.arguments objectAtIndex:1], nil];
   
   
   bool bIsError = [MfiBtPrinterConnection sendZplOverBluetoothParent];
      if (bIsError) {
	   CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:command.callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
	  }else{
	   CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsInt:command.callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
	  }
 }

 
 -(void)skataAlert:(CDVInvokedUrlCommand*)command{
 
   CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:command.callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}


 
 @end