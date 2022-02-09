//
//  Square.h
//  OCProject
//
//  Created by IraShinking on 2021/12/6.
//

#import "Rectangle.h"

NS_ASSUME_NONNULL_BEGIN

@interface Square :Rectangle

-(id)initWithSide:(int)Side;

-(void)setSide:(int)s;
-(int)side;

@end

NS_ASSUME_NONNULL_END
