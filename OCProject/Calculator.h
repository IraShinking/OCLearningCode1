//Calculator 类
#import<Foundation/Foundation.h>

@interface Calculator:NSObject

//累加方法
-(void) setAccumulator:(double)value;
-(void) clear;
-(double) accumulator;

//算术方法
-(void) add:(double) value;
-(void) subtract:(double) value;
-(void) multiply:(double) value;
-(void) divide:(double) value;

@end
