//
//  AddressBook.h
//  OCProject
//
//  Created by IraShinking on 2022/1/26.
//

#import<Foundation/Foundation.h>
#import"AddressCard.h"

@interface AddressBook:NSObject<NSCopying,NSCoding>

@property(nonatomic,copy)NSString *bookName;
@property(nonatomic,copy)NSMutableArray *book;

-(instancetype) initWithName:(NSString *)name;

-(void)addCard:(AddressCard *)theCard;
-(void)removeCard:(AddressCard *)theCard;

-(int)entries;
-(void)list;

-(void)sort;



-(NSMutableArray *)lookup:(NSString *)element;
-(NSMutableArray *)lookupAll:(NSString *)theName;

-(BOOL) removeName:(NSString *)theName;

-(AddressBook *)copyWithZone:(NSZone *)zone;

-(void)encodeWithCoder:(NSCoder *)encoder;
-(id)initWithCoder:(NSCoder *)decoder;

@end
