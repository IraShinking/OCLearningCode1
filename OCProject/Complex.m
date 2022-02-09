//
//  Complex.m
//  OCProject
//
//  Created by IraShinking on 2021/12/6.
//

#import "Complex.h"

//implementation part
@implementation Complex
@synthesize real,imaginary;

-(void) print //print a+bi
{
    NSLog(@"%g + %gi ",real,imaginary);
}

-(void) setReal:(double)a andImaginary:(double)b
{
    real=a;
    imaginary=b;
}

-(id)add:(id)complexNum;//add two complex number
{
    Complex *result=[[Complex alloc]init];

    if([complexNum isMemberOfClass:[Complex class]]==YES)
    {
        int complexReal=[complexNum real];
        int complexImag=[complexNum imaginary];
        
        result.real=real+complexReal;
        result.imaginary=imaginary+complexImag;
    }
    
    
    return result;
    
}
@end
