//
//  AddressBook.m
//  OCProject
//
//  Created by IraShinking on 2022/1/26.
//

#import "AddressBook.h"

@implementation AddressBook
@synthesize bookName,book;

-(instancetype) initWithName:(NSString *)name
{
    self=[super init];
    if(self)
    {
        bookName=[NSString stringWithString:name];
        book=[NSMutableArray array];
    }
    
    return self;
}

-(instancetype)init
{
    return [self initWithName:@"NoName"];
}
-(void)addCard:(AddressCard *)theCard
{
    [book addObject:theCard];
}

-(void)removeCard:(AddressCard *)theCard
{
    [book removeObjectIdenticalTo: theCard];
}
-(int)entries
{
    return (int)[book count];
}
-(void)list;
{
  NSLog(@"======= Content of %@ =========",bookName);
    
    for(AddressCard *theCard in book)
    {
        NSLog(@"%-10s %-10s %-10s %-10s %-10s",[theCard.firstName UTF8String],[theCard.lastName UTF8String],[theCard.email UTF8String],[theCard.address UTF8String],[theCard.phoneNum UTF8String]);
    }
    
    NSLog(@"============================");
  
}

-(void)sort
{
    //[book sortUsingSelector:@selector(compareNames:)];
    [book sortUsingComparator:^(id obj1,id obj2){
        return [[obj1 name] compare: [obj2 name]];
    }];
}

//修改后的方法，能够用传入的字段，在card里寻找所有字段，任何一个匹配就返回YES
-(NSMutableArray *)lookup:(NSString *)element
{
    //存储匹配结果
    NSMutableArray *matches=[NSMutableArray array];
    for( AddressCard *nextCard in book)
    {
        if([nextCard find:element]==YES)
        {
            [matches addObject:nextCard];
        }
    }

    return  matches;
//    //存储返回的结果
//    NSMutableArray *resultArray=[NSMutableArray array];
//    //存储符合条件的索引的集合
//    NSIndexSet *resultIndex=[book indexesOfObjectsPassingTest:
//    ^(id obj,NSUInteger idx,BOOL *stop)
//    {
//        NSString *objEmail=[obj email];
//        NSRange subRange=[objEmail rangeOfString:theEmail];
//        //在串里面找一个子串，然后记录找到的范围，如果找到了，就返回YES
//        if(subRange.location!=NSNotFound)
//        {
//            //NSLog(@"%@",[obj name]);
//            [resultArray addObject:obj];
//            return YES;
//        }
//        else
//        {
//            return NO;
//        }
//        }];
//
                        
    //返回结果之后，按照这个索引进行遍历
//    NSLog(@"%@",resultIndex);
//    NSUInteger index;
//    index=[resultIndex firstIndex];
//
//    NSLog(@"%lu",index);
//    index=[resultIndex indexGreaterThanIndex:index];
    
//    return resultArray;

}

-(NSMutableArray *)lookupAll:(NSString *)theName
{
    //存储返回的结果
    NSMutableArray *resultArray=[NSMutableArray array];
    //存储符合条件的索引的集合
    NSIndexSet *resultIndex=[book indexesOfObjectsPassingTest:
    ^(id obj,NSUInteger idx,BOOL *stop)
    {
        NSString *firstName=[obj firstName];
        NSString *lastName=[obj lastName];
        NSMutableString *name=[NSMutableString stringWithString:firstName];
        [name appendString:@" "];
        [name appendString:lastName];
        NSLog(@"name:%@",name);

        if([name caseInsensitiveCompare:theName]==NSOrderedSame)
        {
            [resultArray addObject:obj];
            [obj print];
            return YES;
        }
        else
        {
            return NO;
        }
//        NSRange subRange=[name rangeOfString:theName];
//        //在串里面找一个子串，然后记录找到的范围，如果找到了，就返回YES
//        if(subRange.location!=NSNotFound)
//        {
//            //NSLog(@"%@",[obj name]);
//            [resultArray addObject:obj];
//            [obj print];
//            return YES;
//        }
//        else
//        {
//            return NO;
//        }
        }];
       
                        
    //返回结果之后，按照这个索引进行遍历
//    NSLog(@"%@",resultIndex);
//    NSUInteger index;
//    index=[resultIndex firstIndex];
//
//    NSLog(@"%lu",index);
//    index=[resultIndex indexGreaterThanIndex:index];
    
    return resultArray;
    
}

-(BOOL) removeName:(NSString *)theName
{
    NSMutableArray *resultArray=[self lookupAll:theName];
    
     if([resultArray count]==1)
    {
        
        [book removeObject:[resultArray firstObject]];
        return YES;
    }
    return NO;
}

-(AddressBook *)copyWithZone:(NSZone *)zone
{
    AddressBook *newBook =[[AddressBook allocWithZone:zone]init];
    newBook.bookName=[NSString stringWithString:bookName];
    NSMutableArray *bookList=[NSMutableArray array];
    for(AddressCard *nextCard in book)
    {
        AddressCard *newCard = [nextCard copy];
        [bookList addObject:newCard];
    }
    newBook.book=bookList;
    return  newBook;
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:bookName forKey:@"AddressBookBookName"];
    [encoder encodeObject:book forKey:@"AddressBookBook"];
    
    NSLog(@"The encodeWithCoder: of AddressBook is called");
}

-(id)initWithCoder:(NSCoder *)decoder
{
    bookName=[decoder decodeObjectForKey:@"AddressBookBookName"];
    book=[decoder decodeObjectForKey:@"AddressBookBook"];
    
    NSLog(@"The initWithCoder: of AddressBook is called");
    return self;
}
@end
