//
//  Rectangle.m
//  OCProject
//
//  Created by IraShinking on 2021/12/6.
//
#import "XYPoint.h"
#import "Rectangle.h"

//implementation
@implementation Rectangle
{
    XYPoint *origin;
}

@synthesize width,height;

-(instancetype)init
{
    return [self initWithWidth:0 andHeight:0];
        
}

-(id)initWithWidth:(int)w andHeight:(int)h
{
    self=[super init];
    if(self)
    {
        NSLog(@"The initWith method is called");
        [self setWidth:w];
        [self setHeight:h];
    }
    return self;
    
}
-(XYPoint *)origin
{
    if(origin)
    {
        XYPoint *OriginReturn=[[XYPoint alloc]init];
        OriginReturn.x=origin.x;
        OriginReturn.y=origin.y;
        return OriginReturn;
    }
    
    return origin;
    
}

-(void) setOrigin:(XYPoint *)pt
{
    if(!origin)
    {
        origin=[[XYPoint alloc]init];
    }
    
    origin.x=pt.x;
    origin.y=pt.y;
}

-(void) translate:(XYPoint *)newPt
{
    if(newPt)
    {
        origin.x=newPt.x;
        origin.y=newPt.y;
    }
}
-(BOOL) containsPoint:(XYPoint *)aPoint
{
    double x1=(double)origin.x+width;
    double y1=(double)origin.y+height;
    if(aPoint.x<=x1&&aPoint.x>=origin.x&&aPoint.y<=y1&&aPoint.y>=origin.y)
        return YES;
    else
        return NO;
        
}
-(double)area
{
    return width*height;
}
-(double)perimeter //计算矩形周长
{
    return width*2+height*2;
}

-(void)setWidth:(double)w andHeight:(double)h
{
    width=w;
    height=h;
}
-(void)draw
{
    NSLog(@"orgin at: ");
    [origin print];
    for(int i=0;i<width;i++)
    {
        printf("-");
    }
    printf("\n");
    for (int i=0; i<height; i++) {
        printf("|");
        for(int i=0;i<width-2;i++)
        {
            printf(" ");
        }
        printf("|\n");
        
    }
    
    for(int i=0;i<width;i++)
    {
        printf("-");
    }
    printf("\n");
}

-(Rectangle *)intersect:(Rectangle *)otherRect
{
    int x1,y1,x2,y2,x3,y3,x4,y4;
    x1=origin.x;
    y1=origin.y;
    x2=x1+width;
    y2=y1+height;
    
    x3=otherRect.origin.x;
    y3=otherRect.origin.y;
    x4=x3+otherRect.width;
    y4=y3+otherRect.height;
    
    int x5,y5,x6,y6;
    x5=(x3>x1?x3:x1);
    y5=(y3>y1?y3:y1);
    x6=(x2<x4?x2:x4);
    y6=(y2<y4?y2:y4);
    
    if((x6-x5)>0&&(y6-y5)>0)
    {
        Rectangle *existRect=[[Rectangle alloc]init];
        [existRect setWidth:(x6-x5) andHeight:(y6-y5)];
        
        XYPoint *existPoint=[[XYPoint alloc]init];
        [existPoint setX:x5 andY:y5];
        
        existRect.origin=existPoint;
        
        return existRect;
    }
    else
    {
        Rectangle *notExistRect=[[Rectangle alloc]init];
        [notExistRect setWidth:0 andHeight:0];
        
        XYPoint *notExistPoint=[[XYPoint alloc]init];
        [notExistPoint setX:0 andY:0];
        
        notExistRect.origin=notExistPoint;
        
        return notExistRect;
    }
    
}


-(Rectangle *)copyWithZone:(NSZone *)zone
{
    Rectangle *newRect=[[Rectangle allocWithZone:zone]init];
    [newRect setWidth:width andHeight:height];
    [newRect setOrigin:[origin copy]];
    
    
    return newRect;
}

@end
