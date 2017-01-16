
#import "ZebraPrinter.h"



@interface ZebraPrinterFactory


+ (id<ZebraPrinter,NSObject>) getInstance:(id< ZebraPrinterConnection, NSObject >) 	connection error:(NSError **) 	error ;


+ (id<ZebraPrinter,NSObject>) getInstance:		(id< ZebraPrinterConnection, NSObject >) 	connection withCpclPrefixes:		(NSArray *) 	cpclPrefixes error:		(NSError **) 	error ;


+ (id<ZebraPrinter,NSObject>) getInstance:		(id< ZebraPrinterConnection, NSObject >) 	connection withPrinterLanguage:		(PrinterLanguage) 	language ;



@end