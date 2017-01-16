#import "ZebraPrinterFactory.h"
#import "ZebraPrinter.h"



@protocol PrinterStatus


- (enum) PrinterLanguage;

- (PrinterStatus *) getCurrentStatus:		(NSError **) 	error	;


- (id<FileUtil, NSObject>) getFileUtil			;

- (id<FormatUtil, NSObject>) getFormatUtil;			


- (id<GraphicsUtil, NSObject>) getGraphicsUtil	;		


- (id<MagCardReader, NSObject>) getMagCardReader;			


- (PrinterLanguage) getPrinterControlLanguage	;		

- (id<SmartCardReader, NSObject>) getSmartCardReader	;		


- (id<ToolsUtil, NSObject>) getToolsUtil		;	

@end