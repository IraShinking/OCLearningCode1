//
//  GraphicObject.h
//  OCProject
//
//  Created by IraShinking on 2021/12/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GraphicObject : NSObject
{
    int fillColor; //32位颜色
    BOOL filled; //是否为对象填充了
    int lineColor; //32位线的颜色
}

@end

NS_ASSUME_NONNULL_END
