
#import <Cordova/CDVPlugin.h>



@interface EpsilonPrinter : CDVPlugin

-(void)sendZplOverBluetooth:(CDVInvokedUrlCommand*)command;

-(void)skataAlert:(CDVInvokedUrlCommand*)command;

@end