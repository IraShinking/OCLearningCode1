#import <Foundation/Foundation.h>

int main(int argc,char* argv[])
{
    @autoreleasepool {
        int p,d,isPrime;
        NSMutableArray *resultArray=[NSMutableArray array];
        
        for(p=2;p<=50;p++)
        {
            isPrime = 1;
            
            for(d=2;d<p;++d)
            {
                if(p%d==0)
                {
                    isPrime=0;
                }
            }
            if(isPrime!=0)
            {
                //NSLog(@"%i ",p);
                NSNumber *tempNum=[NSNumber numberWithInt:p];
                [resultArray addObject:tempNum];
            }
                
            
        }
        
        if([resultArray writeToFile:@"primes.pl" atomically:YES]==NO)
        {
            NSLog(@"Save to file failed!");
        }
        
        NSMutableArray *readResult;
        readResult=[NSMutableArray arrayWithContentsOfFile:@"primes.pl"];
        
        NSLog(@"%@",readResult);
    }
}
