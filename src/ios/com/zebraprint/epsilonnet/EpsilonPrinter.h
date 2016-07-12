
#import <Cordova/CDVPlugin.h>
 #import "MfiBtPrinterConnection.h"


@interface PrinterConnection : CDVPlugin



-(void)sendZplOverBluetooth:(CDVInvokedUrlCommand*)command;

 -(void)skataAlert2:(CDVInvokedUrlCommand*)command;

 -(void)skataAlert:(CDVInvokedUrlCommand*)command;

@end