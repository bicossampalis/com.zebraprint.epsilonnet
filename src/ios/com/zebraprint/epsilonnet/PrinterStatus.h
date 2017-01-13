




@protocol PrinterStatus


- (id) init			

- (BOOL) isHeadCold

- (BOOL) isHeadTooHot

- (ZplPrintMode) printMode


- (BOOL) isPartialFormatInProgress

- (BOOL) isReceiveBufferFull

- (NSInteger) labelsRemainingInBatch


- (NSInteger) numberOfFormatsInReceiveBuffer

- (NSInteger) labelLengthInDots

- (BOOL) isPaused


@end