#import "EpsilonPrinter.h"
 
  @implementation EpsilonPrinter
 -(void)sendZplOverBluetooth:(CDVInvokedUrlCommand*)command{

   
   NSArray *names = [NSArray arrayWithObjects: [command.arguments objectAtIndex:0],[command.arguments objectAtIndex:1], nil];
   
   
   [MfiBtPrinterConnection sendZplOverBluetoothParent:names];
 }
 
 -(void)skataAlert:(CDVInvokedUrlCommand*)command{
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No network connection" 
                                                message:@"You must be connected to the internet to use this app." 
                                               delegate:nil 
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
[alert show];
 }
 
 @end