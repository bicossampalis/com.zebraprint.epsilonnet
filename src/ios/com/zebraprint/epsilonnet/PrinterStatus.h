#import "ZebraPrinterFactory.h"
#import "ZebraPrinter.h"



@interface PrinterStatus


- (id) init;			

- (BOOL) isHeadCold;

- (BOOL) isHeadTooHot;




- (BOOL) isPartialFormatInProgress;

- (BOOL) isReceiveBufferFull;

- (NSInteger) labelsRemainingInBatch;


- (NSInteger) numberOfFormatsInReceiveBuffer;

- (NSInteger) labelLengthInDots;

- (BOOL) isPaused;

- (ZplPrintMode) printMode;

@end