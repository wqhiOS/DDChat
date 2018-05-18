//
//  DDChatModel.h
//  DDChat
//
//  Created by wuqh on 2018/5/14.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,DDMessageRolwType) {
    DDMessageRolwTypeOthers,//其他人
    DDMessageRolwTypeMe//我
};

typedef NS_ENUM(NSInteger,DDMessageType) {
    DDMessageTypeText,//文本
    DDMessageTypeImage,//图片
    DDMessageTypeVoice//语音
};

typedef NS_ENUM(NSInteger,DDMessageSendStatus) {
    DDMessageSendStatusSended,//已送达
    DDMessageSendStatusUnSend,//未发送
    DDMessageSendStatusSending//正在发送
};

typedef NS_ENUM(NSInteger,DDmessageReadStatus) {
    DDmessageReadStatusRead,//已读
    DDmessageReadStatusUnread,//未读
};




@interface DDChatModel : NSObject

@property (nonatomic, assign) DDMessageType messageType;
@property (nonatomic, assign) DDMessageRolwType roleType;
@property (nonatomic, assign) DDMessageSendStatus sendStatus;
@property (nonatomic, assign) DDmessageReadStatus readStatus;


/**
 是否显示时间
 */
@property (nonatomic, assign,getter=isShowMessageTime) BOOL showMessageTime;

/**
 消息时间
 */
@property (nonatomic, copy) NSString *messageTime;


/**
 头像url
 */
@property (nonatomic, copy) NSString *headIconUrl;


/**
 消息文本内容
 */
@property (nonatomic, copy) NSString *messageText;

/**
 图片文件
 */
@property (nonatomic, copy) NSString *imageUrl;


/**
 图片 小 文件
 */
//@property (nonatomic, strong) UIImage *imageSmall;

/**
 音频时间
 */
@property (nonatomic, assign) NSInteger audioTime;

/**
 消息音频url
 */
@property (nonatomic, copy) NSString *audioUrl;




@end
