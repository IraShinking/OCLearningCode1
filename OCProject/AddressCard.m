//
//  AddressCard.m
//  OCProject
//
//  Created by IraShinking on 2022/1/26.
//

#import"AddressCard.h"

@implementation AddressCard

@synthesize firstName,lastName,email,address,phoneNum;


-(void)print
{
    NSLog(@"===========================");
    NSLog(@"|                         |");
    NSLog(@"| %s %-31s |",[firstName UTF8String],[lastName UTF8String]);
    NSLog(@"| %-31s |",[email UTF8String]);
    NSLog(@"| %-31s |",[address UTF8String]);
    NSLog(@"| %-31s |",[phoneNum UTF8String]);
    NSLog(@"|                         |");
    NSLog(@"|    O            O       |");
    NSLog(@"==================================");
}

-(void)setFirstName:(NSString *)theFirstName setLastName:(NSString *)theLastName
           setEmail:(NSString *)theEmail setAddress:(NSString *)theAddress setPhoneNum:(NSString*) thePhoneNum
{
    self.firstName=theFirstName;
    self.lastName=theLastName;
    self.email=theEmail;
    self.address=theAddress;
    self.phoneNum=thePhoneNum;
}
-(void)initWithFirstName:(NSString *)theFirstName initWithLastName:(NSString *)theLastName
           initWithEmail:(NSString *)theEmail initWithAddress:(NSString *)theAddress initWithPhoneNum:(NSString*) thePhoneNum
{
    self.firstName=theFirstName;
    self.lastName=theLastName;
    self.email=theEmail;
    self.address=theAddress;
    self.phoneNum=thePhoneNum;
}

//比较指定的地址卡片中的两个名字
-(NSComparisonResult) compareNames:(id)element
{
    NSString* name=[firstName stringByAppendingString:lastName];
    return [name compare:[element name]];
}

//检索所有字段 查找匹配值
-(BOOL)find:(NSString *)element
{
    NSRange firstNameRange=[firstName rangeOfString:element];
    NSRange lastNameRange=[lastName rangeOfString:element];
    NSRange emailRange=[email rangeOfString:element];
    NSRange addressRange=[address rangeOfString:element];
    NSRange phoneNumRange=[phoneNum rangeOfString:element];
    //在串里面找一个子串，然后记录找到的范围，如果找到了，就返回YES
    //但凡任何一个找到了 都返回yes
    if((firstNameRange.location!=NSNotFound)||(lastNameRange.location!=NSNotFound)||(emailRange.location!=NSNotFound)||(addressRange.location!=NSNotFound)||(phoneNumRange.location!=NSNotFound))
    {
        
        return YES;
    }
    else
    {
        return NO;
    }
}

-(AddressCard *)copyWithZone:(NSZone *)zone
{
    AddressCard *newCard = [[AddressCard allocWithZone : zone] init];
    
    //可能要修改成assign方法 因为set方法会创建副本 而实际上不需要创建副本，只需要传递引用
    [newCard setFirstName:firstName setLastName:lastName setEmail:email setAddress:address setPhoneNum:phoneNum];
    
    return newCard;
}

-(void) encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:firstName forKey:@"AddressCardFirstName"];
    [encoder encodeObject:lastName forKey:@"AddressCardLastName"];
    [encoder encodeObject:email forKey:@"AddressCardEmail"];
    [encoder encodeObject:address forKey:@"AddressCardAddress"];
    [encoder encodeObject:phoneNum forKey:@"AddressCardPhoneNum"];
    NSLog(@"The encodeWithCoder: of AddressCard is called");
}
-(id) initWithCoder:(NSCoder *)decoder
{
    firstName=[decoder decodeObjectForKey:@"AddressCardFirstName"];
    lastName=[decoder decodeObjectForKey:@"AddressCardLastName"];
    email=[decoder decodeObjectForKey:@"AddressCardEmail"];
    address=[decoder decodeObjectForKey:@"AddressCardAddress"];
    phoneNum=[decoder decodeObjectForKey:@"AddressCardPhoneNum"];
    NSLog(@"The initWithCoder: of AddressCard is called");
    return self;
}

@end


