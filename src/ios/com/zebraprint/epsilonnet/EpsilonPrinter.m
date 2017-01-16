//#import "EpsilonPrinter.h"
//#import "MfiBtPrinterConnection.h"
//#import <ExternalAccessory/ExternalAccessory.h>
//#import <UIKit/UIKit.h>
//#import "ZebraPrinterConnection.h"
//#import "PrinterStatus.h"
//#import "ZebraPrinterFactory.h"
//#import "ZebraPrinter.h"

 #import "EpsilonPrinter.h"
 #import <ExternalAccessory/ExternalAccessory.h>
 #import "MfiBtPrinterConnection.h"
 #import "ZebraPrinterFactory.h"
 
  @implementation EpsilonPrinter

  
 -(void)sendZplOverBluetooth:(CDVInvokedUrlCommand*)command{


     NSString *serialNumber = @"";
    NSString *serialNumberPda = [[command.arguments objectAtIndex:0] capitalizedString];
	
	  EAAccessoryManager *sam = [EAAccessoryManager sharedAccessoryManager];
     NSArray * connectedAccessories = [sam connectedAccessories];
     for (EAAccessory *accessory in connectedAccessories) {
	 NSString *serialNumberTmp = [accessory.serialNumber capitalizedString];
         if([accessory.protocolStrings indexOfObject:@"com.zebra.rawport"] != NSNotFound && [serialNumberTmp isEqualToString:serialNumberPda]){
             serialNumber = accessory.serialNumber;
             break;
             //Note: This will find the first printer connected! If you have multiple Zebra printers connected, you should display a list to the user and have him select the one they wish to use
         }
     }
	 
	 

     id<ZebraPrinterConnection, NSObject> thePrinterConn = [[MfiBtPrinterConnection alloc] initWithSerialNumber:serialNumber];
     
      [((MfiBtPrinterConnection*)thePrinterConn) setTimeToWaitAfterWriteInMilliseconds:30];
	  
     BOOL success = [thePrinterConn open];
     
     NSString* zplData = [command.arguments objectAtIndex:1];
     
     NSError* error2 = nil;

	 
if (![zplData isEqualToString:@"connect"] && ![zplData isEqualToString:@"close"]){
	  id<ZebraPrinter, NSObject> printer = [ZebraPrinterFactory getInstance:thePrinterConn error:&error2];
	       NSError* error3 = nil;
	 //if (error == nil) {
	 PrinterStatus *printerStatus = [printer getCurrentStatus:&error3];
NSError* error = nil;
	 //if (error == nil) {
			 if (printerStatus.isReadyToPrint) {
			 
			 
	 success = success && [thePrinterConn write:[zplData dataUsingEncoding:NSUTF8StringEncoding] error:&error];
			
 } else if (printerStatus.isPaused) {
			 error = [[NSError alloc] initWithDomain:@"Cannot Print because the printer is paused" code:200 userInfo:@{@"Error reason": @"Cannot Print because the printer is paused"}];

			
			 } else if (printerStatus.isHeadOpen) {
			 error =  [[NSError alloc] initWithDomain:@"Cannot Print because the printer head is open" code:201 userInfo:@{@"Error reason": @"Cannot Print because the printer head is open"}];
			 //@"Cannot Print because the printer head is open."; 
			
			 } else if (printerStatus.isPaperOut) {
			 error = [[NSError alloc] initWithDomain:@"Cannot Print because the paper is out" code:202 userInfo:@{@"Error reason": @"Cannot Print because the paper is out"}];
// @"Cannot Print because the paper is out."; 
			 } 
			 else if (printerStatus.isHeadTooHot) {
			 error = [[NSError alloc] initWithDomain:@"Cannot Print because the Head is Too Hot" code:204 userInfo:@{@"Error reason": @"Cannot Print because the paper is out"}];

			 }else if (printerStatus.isHeadCold) {
			 error = [[NSError alloc] initWithDomain:@"Cannot Print because the Head is Cold" code:205 userInfo:@{@"Error reason": @"Cannot Print because the paper is out"}];

			 } else if (printerStatus.isRibbonOut) {
			 error = [[NSError alloc] initWithDomain:@"Cannot Print because the Ribbon is Out" code:206 userInfo:@{@"Error reason": @"Cannot Print because the paper is out"}];

			 } else if (printerStatus.isReceiveBufferFull) {
			 error = [[NSError alloc] initWithDomain:@"Cannot Print because the Buffer Is Full" code:207 userInfo:@{@"Error reason": @"Cannot Print because the paper is out"}];

			 } else if (printerStatus.isPartialFormatInProgress) {
			 error = [[NSError alloc] initWithDomain:@"" code:208 userInfo:@{@"Error reason": @"Cannot Print because the paper is out"}];

			 }  else { 
			 error = [[NSError alloc] initWithDomain:@"Cannot Print" code:203 userInfo:@{@"Error reason": @"Cannot Print"}];
 //@"Cannot Print."; 
				}
	// }
	 	// }

	 
if (success != YES || error != nil) {
[thePrinterConn close];
      	   CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString: [error localizedDescription] ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
     }
     else{
	  CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:command.callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
	 }
	 }
	 
	 
	 
	 
	 // if ([zplData isEqualToString:@"close"])
	 [thePrinterConn close];
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