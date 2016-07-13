#import <ExternalAccessory/ExternalAccessory.h>
#import "MfiBtPrinterConnection.h"
 
+(NSString*)sendZplOverBluetoothParent:(NSArray*)command{
 
     NSString* serialNumber = command[0];
    

     id<ZebraPrinterConnection, NSObject> thePrinterConn = [[MfiBtPrinterConnection alloc] initWithSerialNumber:serialNumber];
     
     
     BOOL success = [thePrinterConn open];
     
     
     NSString* zplData = command[1];
     
     NSError* error = nil;
     
     success = success && [thePrinterConn write:[zplData dataUsingEncoding:NSUTF8StringEncoding] error:&error];
  
     
     [thePrinterConn close];
     
	 
	  return serialNumber;
 }
 