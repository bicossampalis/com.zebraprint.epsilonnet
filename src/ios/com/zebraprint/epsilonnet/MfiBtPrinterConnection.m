#import <ExternalAccessory/ExternalAccessory.h>
#import "MfiBtPrinterConnection.h"
 
  @implementation MfiBtPrinterConnection
  
 +(NSString*)sendZplOverBluetoothParent:(NSArray*)command{
 
     NSString* serialNumber = command[0];
    
    id<ZebraPrinterConnection, NSObject> thePrinterConn = [[MfiBtPrinterConnection alloc] initWithSerialNumber:serialNumber];
 
     
     
	 
	  return serialNumber;
 }
 
 @end