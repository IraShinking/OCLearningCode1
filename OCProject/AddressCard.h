//
//  AddressCard.h
//  OCProject
//
//  Created by IraShinking on 2022/1/26.
//

#import<Foundation/Foundation.h>

@interface AddressCard : NSObject<NSCopying,NSCoding>

@property(copy,nonatomic) NSString *firstName,*lastName,*email,*address,*phoneNum;

-(void)print;
-(void)setFirstName:(NSString *)theFirstName setLastName:(NSString *)theLastName
           setEmail:(NSString *)theEmail setAddress:(NSString *)theAddress setPhoneNum:(NSString*) thePhoneNum
;
-(void)initWithFirstName:(NSString *)theFirstName initWithLastName:(NSString *)theLastName
                initWithEmail:(NSString *)theEmail initWithAddress:(NSString *)theAddress initWithPhoneNum:(NSString*) thePhoneNum;
-(NSComparisonResult) compareNames:(id)element;

-(BOOL)find:(NSString *)element;

-(AddressCard *)copyWithZone:(NSZone *)zone;

-(void) encodeWithCoder:(NSCoder *)encoder;
-(id) initWithCoder:(NSCoder *)decoder;
@end

