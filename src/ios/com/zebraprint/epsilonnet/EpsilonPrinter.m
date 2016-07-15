#import "EpsilonPrinter.h"
#import "MfiBtPrinterConnection.h"
#import <ExternalAccessory/ExternalAccessory.h>
#import <UIKit/UIKit.h>
#import <Cordova/NSArray+Comparisons.h>
#import <Cordova/NSDictionary+Extensions.h>
 
  @implementation EpsilonPrinter

  
 -(void)sendZplOverBluetooth:(CDVInvokedUrlCommand*)command{


     NSString *serialNumber =[command.arguments objectAtIndex:0];
    
	
     id<ZebraPrinterConnection, NSObject> thePrinterConn = [[MfiBtPrinterConnection alloc] initWithSerialNumber:serialNumber];
     
     
     BOOL success = [thePrinterConn open];
     
     NSString* zplData1 = [command.arguments objectAtIndex:2];
     NSString* zplData = [command.arguments objectAtIndex:1];
     
     NSError* error = nil;
     
     success = success && [thePrinterConn write:[zplData1 dataUsingEncoding:NSUTF8StringEncoding] error:&error];
  
     [thePrinterConn close];
 
     success = [thePrinterConn open];
	 
	 success = success && [thePrinterConn write:[zplData dataUsingEncoding:NSUTF8StringEncoding] error:&error];
	 

	 
	 
if (success != YES || error != nil) {
       CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:command.callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
     }
     else{
	 CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:command.callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
	 }
	 

 }

 
 -(void)skataAlert:(CDVInvokedUrlCommand*)command{
 
   CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:command.callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

 -(void)findPrinter:(CDVInvokedUrlCommand*)command{
 
  EAAccessoryManager *sam = [EAAccessoryManager sharedAccessoryManager];
     NSArray * connectedAccessories = [sam connectedAccessories];
	  NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:connectedAccessories.count];
     for (EAAccessory *accessory in connectedAccessories) {
         if([accessory.protocolStrings indexOfObject:@"com.zebra.rawport"] != NSNotFound){
	
		[tempArray addObject:[accessory.serialNumber capitalizedString]];
	
    }
	
          
     }
	 
	CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:[tempArray copy]];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];

}


 @end