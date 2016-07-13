#import <ExternalAccessory/ExternalAccessory.h>
#import "MfiBtPrinterConnection.h"
 
  @implementation MfiBtPrinterConnection
 +(bool)sendZplOverBluetoothParent:(NSArray*)command{
 
         NSString *serialNumber = [command objectAtIndex:0];
    

     id<ZebraPrinterConnection, NSObject> thePrinterConn = [[MfiBtPrinterConnection alloc] initWithSerialNumber:serialNumber];
     
     
     BOOL success = [thePrinterConn open];
     
     
     NSString *zplData = [command objectAtIndex:1];
     
     NSError *error = nil;
     
     success = success && [thePrinterConn write:[zplData dataUsingEncoding:NSUTF8StringEncoding] error:&error];
     bool bIsError = FALSE;
     if (success != YES || error != nil) {
       bIsError = TRUE;
     }
     
     [thePrinterConn close];
     
     
	 
	  return bIsError;
 }
 
 @end