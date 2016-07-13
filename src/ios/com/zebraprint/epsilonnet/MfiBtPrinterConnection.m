#import <ExternalAccessory/ExternalAccessory.h>
#import "MfiBtPrinterConnection.h"
 
  @implementation MfiBtPrinterConnection
 -(bool)sendZplOverBluetoothParent:(NSArray*)command{
 
         NSString *serialNumber = @"";
     //Find the Zebra Bluetooth Accessory
     EAAccessoryManager *sam = [EAAccessoryManager sharedAccessoryManager];
     NSArray * connectedAccessories = [sam connectedAccessories];
     for (EAAccessory *accessory in connectedAccessories) {
         if([accessory.protocolStrings indexOfObject:@"com.zebra.rawport"] != NSNotFound){
             serialNumber = accessory.serialNumber;
             break;
             //Note: This will find the first printer connected! If you have multiple Zebra printers connected, you should display a list to the user and have him select the one they wish to use
         }
     }
     
     
     // This example prints "This is a ZPL test." near the top of the label.
     NSString *zplData = [command objectAtIndex:1];
     
     NSError *error = nil;
     // Send the data to printer as a byte array.

     bool bIsError = FALSE;

	 
	  return bIsError;
 }
 
 @end