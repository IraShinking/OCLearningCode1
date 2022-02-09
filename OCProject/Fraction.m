//
//  Fraction.m
//  OCProject
//
//  Created by IraShinking on 2021/12/3.
//

#import "Fraction.h"

static int gCounter;//only visible in Fraction.m so declare it here with "static"

@implementation Fraction
{
    //int numerator;
}
@synthesize numerator,denominator;

-(Fraction *)initWith:(int)n over:(int)d
{
    self=[super init];
    if(self)
    {
        [self setNumerator:n setDenominator:d];
    }
    
    return self;
}

-(void)setNumerator:(int)n setDenominator:(int)d
{
    NSLog(@"The double vactor function is called.");
    numerator=n;
    denominator=d;
}


-(id )add:(id )f
{
    Fraction * result=[[Fraction alloc] init];
    if([f isMemberOfClass:[Fraction class]]==YES)
    {
        double fDe=[f denominator];
        double fNu=[f numerator];
    result.numerator=numerator*fDe+fNu*denominator;
    result.denominator=denominator*fDe;
    
    [result reduce];
    }
    return result;
    
   
}

//Override the description method
-(NSString *) description
{
    return [NSString stringWithFormat:@"%i/%i",numerator,denominator];
}

-(void)reduce
{
    int u=numerator;
    int v=denominator;
    int temp;
    
    while(v!=0)
    {
        temp=u%v;
        u=v;
        v=temp;
    }
    
    numerator/=u;
    denominator/=u;
    
    NSLog(@"The fraction is now recude~");
}
-(void)print:(BOOL)reduce
{
    
    if(reduce==YES)
    {
        Fraction *result=[[Fraction alloc]init];
        result.numerator=numerator;
        result.denominator=denominator;
        [result reduce];
        [result print:NO];//tricky
    }
    else
    {
        if([self converToNum]>1)
        {
            int temp=numerator/denominator;
            int result=numerator%denominator;
            NSLog(@"%i %i/%i",temp,result,denominator);
        }
        else
            NSLog(@"%i/%i",numerator,denominator);
    }
        
}
-(double)converToNum
{
    if(denominator!=0)
    {
        return (double)numerator/denominator;
    }
    else
    {
        return NAN;
    }
}

-(NSComparisonResult)comparison:(Fraction *)f
{
    double result1=[self converToNum];
    double result2=[f converToNum];
    if(result1==result2)
    {
        return NSOrderedSame;
    }
    else if(result1<result2)
    {
        return NSOrderedAscending;
    }
    else
    {
        return NSOrderedDescending;
    }
}

+(Fraction *)allocF
{
    extern int gCounter;
    ++gCounter;
    return [Fraction alloc];
    
}
+(int) count
{
    
    extern int gCounter;
    return gCounter;
}

-(id) copyWithZone:(NSZone *)zone
{
    Fraction *newFract = [[Fraction allocWithZone:zone ]init];
    
    [newFract setNumerator:numerator setDenominator:denominator];
    return newFract;
}

@end


