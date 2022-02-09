//
//  Calculator.m
//  OCProject
//
//  Created by IraShinking on 2021/11/21.
//
#import "Calculator.h"

//implementation part
@implementation Calculator
{
    double accumulator;
    
}

-(void) setAccumulator:(double)value
{
    accumulator = value;
    
}

-(void) clear
{
    accumulator = 0;
}

-(double) accumulator
{
    return accumulator;
}

-(void) add:(double) value
{
    accumulator += value;
}

-(void) subtract:(double) value
{
    accumulator -=value;
}

-(void) multiply:(double) value
{
    accumulator *= value;
}

-(void) divide:(double) value
{
    accumulator/=value;
}
@end

 

