#import <ExternalAccessory/ExternalAccessory.h>
#import "MfiBtPrinterConnection.h"
 
  @implementation MfiBtPrinterConnection
 -(bool)sendZplOverBluetoothParent:(NSArray*)command{
 
   
     
  
     NSString *zplData = [command objectAtIndex:1];
     

 

     bool bIsError = FALSE;

	 
	  return bIsError;
 }
 
 @end