#import <ExternalAccessory/ExternalAccessory.h>
#import "MfiBtPrinterConnection.h"
 
+(NSString*)sendZplOverBluetoothParent:(NSArray*)command{
 
     NSString* serialNumber = @"";
    
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
     
     
     NSString* zplData = command[1];
     
     NSError* error = nil;
     
     success = success && [thePrinterConn write:[zplData dataUsingEncoding:NSUTF8StringEncoding] error:&error];
  
     
     [thePrinterConn close];
     
	 
	  return serialNumber;
 }
 