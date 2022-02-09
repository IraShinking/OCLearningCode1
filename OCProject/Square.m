//
//  Square.m
//  OCProject
//
//  Created by IraShinking on 2021/12/6.
//

#import "Square.h"

@implementation Square

-(instancetype)init
{
    return [self initWithSide:0];
}

-(id)initWithSide:(int)Side
{
    self=[super init];
    if(self)
    {
        NSLog(@"The init with side method is called");
        [self setSide:Side];
    }
    return self;
    
}
-(void)setSide:(int)s
{
    [self setWidth:s andHeight:s];
}

-(int)side
{
    return self.width;
}
@end
