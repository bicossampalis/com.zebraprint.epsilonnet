//#import "ZebraPrinterFactory.h"




@interface PrinterStatus

@property BOOL 	isReadyToPrint;
@property BOOL 	isHeadOpen;
@property BOOL 	isHeadCold;
@property BOOL 	isHeadTooHot;
@property BOOL 	isPaperOut;
@property BOOL 		isRibbonOut;
@property BOOL 	isReceiveBufferFull;
@property BOOL 	isPaused;
//@property NSInteger 	 	labelLengthInDots;
//@property NSInteger 	 	numberOfFormatsInReceiveBuffer;
//@property NSInteger 	 	labelsRemainingInBatch;
@property BOOL 	isPartialFormatInProgress;

- (id) init;			

- (BOOL) isHeadCold;

- (BOOL) isHeadTooHot;




- (BOOL) isPartialFormatInProgress;

- (BOOL) isReceiveBufferFull;

- (NSInteger) labelsRemainingInBatch;


- (NSInteger) numberOfFormatsInReceiveBuffer;

- (NSInteger) labelLengthInDots;

- (BOOL) isPaused;

//- (ZplPrintMode) printMode;

@end