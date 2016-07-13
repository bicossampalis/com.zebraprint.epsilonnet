#import <ExternalAccessory/ExternalAccessory.h>
 #import "MfiBtPrinterConnection.h"
 
  @implementation MfiBtPrinterConnection
 -(bool)sendZplOverBluetoothParent:(NSArray*)command{
 
     NSString *serialNumber = [command objectAtIndex:0];
     
     // Instantiate connection to Zebra Bluetooth accessory
     id<ZebraPrinterConnection, NSObject> thePrinterConn = [[MfiBtPrinterConnection alloc] initWithSerialNumber:serialNumber];
     
     // Open the connection - physical connection is established here.
     BOOL success = [thePrinterConn open];
     
     // This example prints "This is a ZPL test." near the top of the label.
     NSString *zplData = [command objectAtIndex:1];
     
     NSError *error = nil;
     // Send the data to printer as a byte array.
     success = success && [thePrinterConn write:[zplData dataUsingEncoding:NSUTF8StringEncoding] error:&error];
     bool bIsError = FALSE;
     if (success != YES || error != nil) {
       bIsError = TRUE;
     }
     // Close the connection to release resources.
     [thePrinterConn close];
     
     //[thePrinterConn release];
	 
	  return bIsError;
 }
 
 @end