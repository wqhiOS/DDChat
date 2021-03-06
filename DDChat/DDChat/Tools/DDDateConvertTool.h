//
//  DDDateConvertTool.h
//  DDChat
//
//  Created by wuqh on 2018/5/25.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    DDDateDisplayType_Default = 0,        //  yyyy-MM-dd HH:mm:ss
    DDDateDisplayType_Date = 1,           //  yyyy-MM-dd
    DDDateDisplayType_Time = 2,           //  HH:mm
    DDDateDisplayType_Custom = 3          //  自定义类型
} DDDateDisplayType;

typedef enum : NSUInteger {
    DDPreviousDateDirectionType_Before = 0,       //  之前
    DDPreviousDateDirectionType_After = 1,        //  之后
} DDPreviousDateDirectionType;

@interface DDDateConvertTool : NSObject
/**
 获取现在的时间戳
 
 @return 现在的时间戳
 */
+ (long)getThePresentTimeStamp;



/**
 获取现在的时间
 
 @param dateDisplayType 转换类型
 @param customTypeString 自定义类型，如果不需要的话设置nil
 @return 现在的时间
 */
+ (NSString *)getThePresentTimeWithDateDisplayType:(DDDateDisplayType)dateDisplayType
                                  customTypeString:(NSString *)customTypeString;



/**
 时间戳转换成字符串
 
 @param timeStamp 时间戳
 @param dateDisplayType 转换类型
 @param customTypeString 自定义类型，如果不需要的话设置nil
 @return 字符串日期
 */
+ (NSString *)dateConvertTimeStampToStringWithTimeStamp:(long)timeStamp
                                        dateDisplayType:(DDDateDisplayType)dateDisplayType
                                       customTypeString:(NSString *)customTypeString;



/**
 字符串转换成时间戳
 
 @param timeString 时间字符串
 @param dateDisplayType 转换类型
 @param customTypeString 自定义类型，如果不需要的话设置nil
 @return 时间戳
 */
+ (long)dateConvertStringToTimeStampWithTimeString:(NSString *)timeString
                                   dateDisplayType:(DDDateDisplayType)dateDisplayType
                                  customTypeString:(NSString *)customTypeString;



/**
 字符串转换成字符串  （精确时间转换成模糊时间,，例如：yyyy-MM-dd HH:mm:ss -> HH:mm）
 
 @param timeString 时间字符串
 @param dateDisplayType 转换类型
 @param customTypeString 自定义类型，如果不需要的话设置nil
 @return 时间戳
 */
+ (NSString *)dateConvertStringToStringWithTimeString:(NSString *)timeString
                                      dateDisplayType:(DDDateDisplayType)dateDisplayType
                                     customTypeString:(NSString *)customTypeString;



/**
 时间戳转换成字符串  （多少时间之内的，类似朋友圈的发布时间显示）
 
 @param timeStamp 时间戳
 @param hour 设置多少小时以内显示分钟
 @return 时间字符串
 */
+ (NSString *)dateConvertTimeStampToLatelyStringWithTimeStamp:(long)timeStamp
                                                         hour:(NSInteger)hour;



/**
 获取多少天之前之后的日期时间
 
 @param timeString 时间字符串
 @param dateDisplayType 转换类型
 @param customTypeString 自定义类型，如果不需要的话设置nil
 @param dayNum 天数
 @param directionType 之前之后方向
 @return 日期时间字符串
 */
+ (NSString *)gainPreviousDateWithBeginTimeString:(NSString *)timeString
                                  dateDisplayType:(DDDateDisplayType)dateDisplayType
                                 customTypeString:(NSString *)customTypeString
                                           dayNum:(NSInteger)dayNum
                                    directionType:(DDPreviousDateDirectionType)directionType;


@end
