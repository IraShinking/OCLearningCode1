//
//  XYPoint.m
//  OCProject
//
//  Created by IraShinking on 2021/12/6.
//

#import "XYPoint.h"

@implementation XYPoint
@synthesize x,y;

-(void)setX:(int)xVal andY:(int)yVal
{
    x=xVal;
    y=yVal;
}

-(void)print
{
    NSLog(@"(%i,%i)",x,y);
}

-(XYPoint *)copyWithZone:(NSZone *)zone
{
    XYPoint *newPoint=[[XYPoint allocWithZone:zone] init];
    [newPoint setX:x andY:y];
    return newPoint;
}
@end
