
#import <Cordova/CDVPlugin.h>



@interface EpsilonPrinter :  CDVPlugin {
  
    CDVInvokedUrlCommand* cordova_command;
  
}

-(void)sendZplOverBluetooth:(CDVInvokedUrlCommand*)command;

-(void)skataAlert:(CDVInvokedUrlCommand*)command;

@end