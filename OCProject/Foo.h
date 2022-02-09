//
//  Foo.h
//  OCProject
//
//  Created by IraShinking on 2022/2/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Foo : NSObject<NSCoding>

@property(copy,nonatomic)NSString *strVal;
@property int intVal;
@property float floatVal;

@end

NS_ASSUME_NONNULL_END
