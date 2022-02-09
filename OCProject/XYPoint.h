//
//  XYPoint.h
//  OCProject
//
//  Created by IraShinking on 2021/12/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYPoint : NSObject<NSCopying>
@property int x,y;

-(void) setX:(int)xVal andY:(int) yVal;
-(void) print;

-(XYPoint *)copyWithZone:(NSZone *)zone;

@end

NS_ASSUME_NONNULL_END
