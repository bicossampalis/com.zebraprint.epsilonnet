#import <ExternalAccessory/ExternalAccessory.h>
 #import "MfiBtPrinterConnection.h"
 
 @implementation MfiBtPrinterConnection
 
 -(void)sendZplOverBluetooth:(CDVInvokedUrlCommand*)command{
 
     NSString *serialNumber = [command.arguments objectAtIndex:0];
     
     // Instantiate connection to Zebra Bluetooth accessory
     id<ZebraPrinterConnection, NSObject> thePrinterConn = [[MfiBtPrinterConnection alloc] initWithSerialNumber:serialNumber];
     
     // Open the connection - physical connection is established here.
     BOOL success = [thePrinterConn open];
     
     // This example prints "This is a ZPL test." near the top of the label.
     NSString *zplData = [command.arguments objectAtIndex:1];
     
     NSError *error = nil;
     // Send the data to printer as a byte array.
     success = success && [thePrinterConn write:[zplData dataUsingEncoding:NSUTF8StringEncoding] error:&error];
     
     if (success != YES || error != nil) {
         UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
         [errorAlert show];
         //[errorAlert release];
     }
     // Close the connection to release resources.
     [thePrinterConn close];
     
     //[thePrinterConn release];
 }
 
 @end