#import "EpsilonPrinter.h"
#import "MfiBtPrinterConnection.h"
#import <ExternalAccessory/ExternalAccessory.h>
#import <UIKit/UIKit.h>
//#import <PrinterStatus.h>

 
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
     
     
     BOOL success = [thePrinterConn open];
     
     NSString* zplData = [command.arguments objectAtIndex:1];
     
     NSError* error = nil;
	 
	 

	 
	 
	 PrinterStatus *printerStatus = [printer getCurrentStatus:&error];
			 if (printerStatus.isReadyToPrint) {
			 if (![zplData isEqualToString:@"connect"] && ![zplData isEqualToString:@"close"]){
	 success = success && [thePrinterConn write:[zplData dataUsingEncoding:NSUTF8StringEncoding] error:&error];
			 } else if (printerStatus.isPaused) {
			 error = @"Cannot Print because the printer is paused."; 
			
			 } else if (printerStatus.isHeadOpen) {
			 error = @"Cannot Print because the printer head is open."; 
			
			 } else if (printerStatus.isPaperOut) {
			 error = @"Cannot Print because the paper is out."; 
			 } else { 
			 error = @"Cannot Print."; 
				}
	 
	 
if (success != YES || error != nil) {
      	   CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString: [error localizedDescription] ];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
     }
     else{
	  CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:command.callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
	 }
	 }
	 
	 
	  if ([zplData isEqualToString:@"close"])
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