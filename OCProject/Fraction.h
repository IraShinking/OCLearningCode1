//
//  Fraction.h
//  OCProject
//
//  Created by IraShinking on 2021/12/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Fraction : NSObject <NSCopying>

@property int numerator,denominator;

//-(void)setNumerator:(int)n;
//-(int)numerator;
-(Fraction *)initWith:(int)n over:(int)d;

-(void)setNumerator:(int)n setDenominator:(int)d;




-(void)reduce;//gcd algorithm
-(void) print:(BOOL)reduce;
-(double)converToNum;

-(id )add:(id )f;
-(NSString * )description;

-(NSComparisonResult)comparison:(Fraction *)f;

+(Fraction *)allocF;
+(int) count;

//实现深复制的方法
-(id) copyWithZone:(NSZone *)zone;

@end

NS_ASSUME_NONNULL_END
