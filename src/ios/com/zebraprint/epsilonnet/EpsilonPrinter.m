#import <ExternalAccessory/ExternalAccessory.h>
 #import "EpsilonPrinter.h"
 
  @implementation EpsilonPrinter
 -(void)sendZplOverBluetooth:(CDVInvokedUrlCommand*)command{

   
   NSArray *names = [NSArray arrayWithObjects: [command.arguments objectAtIndex:0],[command.arguments objectAtIndex:1], nil];
   
   
    MfiBtPrinterConnection* pickedContact = [MfiBtPrinterConnection sendZplOverBluetoothParent:names];
 }
 
 @end