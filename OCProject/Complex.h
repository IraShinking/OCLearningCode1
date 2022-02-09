#import<Foundation/Foundation.h>

/*Class Complex*/

//interface part
@interface Complex:NSObject

@property double real,imaginary;

-(void) print; //print a+bi
-(void) setReal:(double)a andImaginary:(double)b;


-(id)add:(id)complexNum;//add two complex number

@end
