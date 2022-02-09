//
//  Rectangle.h
//  OCProject
//
//  Created by IraShinking on 2021/12/6.
//

#import <Foundation/Foundation.h>
#import "GraphicObject.h"
NS_ASSUME_NONNULL_BEGIN

@class XYPoint;

/*Class Rectangle*/

//interface part
@interface Rectangle:GraphicObject<NSCopying>
@property double width,height;

-(id)initWithWidth:(int)w andHeight:(int)h;

-(XYPoint *)origin;
-(void) setOrigin:(XYPoint *)pt;
-(void) translate:(XYPoint *)newPt;
-(BOOL) containsPoint:(XYPoint *)aPoint;

-(double)area;
-(double)perimeter;

-(void)setWidth:(double)w andHeight:(double)h;
-(void)draw;
-(Rectangle *)intersect:(Rectangle *)otherRect;

-(Rectangle *)copyWithZone:(NSZone *)zone;

@end
NS_ASSUME_NONNULL_END
