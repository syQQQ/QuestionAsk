//
//  Interface.h
//  QuestionAsk
//
//  Created by Mac_lyf on 14-9-8.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import <Foundation/Foundation.h>

//接口名称 枚举
typedef NS_ENUM (NSInteger, INTERFACENAME) {
    webUserLogin = 1,
    sendMobileValidCode = 2,
    webUserRegister = 3
    //......
};


typedef void (^InterfaceResponseBlock)(NSDictionary* resDic, bool finsh, NSString* msg);
typedef void (^InterfaceErrorBlock)(NSError* error);

@interface Interface : NSObject
@property NSDictionary *resDict;
@property bool res;
@property NSString* error;

//接口入口
//jsonConitionDic 传给服务的参数
//interfaceNname  接口枚举值
//responseBlock 请求成功 ui界面的回调函数 (请求成功服务器成功后，ui界面类传入块函数来处理数据)
//errorBlock 请求失败 ui界面的回调函数 (请求成功服务器失败后，ui界面类传入块函数来处理数据)
- (void) interfaceEnter:(NSDictionary*)jsonConitionDic interfaceNname:(INTERFACENAME)interfacNname responseBlock:(InterfaceResponseBlock)responseBlock errorBlock:(InterfaceErrorBlock)errorBlock ;
@end
