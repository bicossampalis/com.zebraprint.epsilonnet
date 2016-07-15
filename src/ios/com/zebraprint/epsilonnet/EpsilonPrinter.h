
#import <Cordova/CDVPlugin.h>



@interface EpsilonPrinter :  CDVPlugin {
  
    CDVInvokedUrlCommand* cordova_command;
  
}

-(void)changeLanguage:(CDVInvokedUrlCommand*)command;

-(void)sendZplOverBluetooth:(CDVInvokedUrlCommand*)command;

-(void)skataAlert:(CDVInvokedUrlCommand*)command;

-(void)findPrinter:(CDVInvokedUrlCommand*)command;

@end