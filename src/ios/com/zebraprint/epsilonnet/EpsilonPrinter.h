
#import <Cordova/CDVPlugin.h>
#import "MfiBtPrinterConnection.h"


@interface EpsilonPrinter : CDVPlugin

-(void)sendZplOverBluetooth:(CDVInvokedUrlCommand*)command;



@end