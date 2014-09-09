//
//  Interface.m
//  QuestionAsk
//
//  Created by Mac_lyf on 14-9-8.
//  Copyright (c) 2014年 723. All rights reserved.
//

#import "Interface.h"
#import "MKNetworkKit.h"

@implementation Interface
#pragma urlDataAsy
//异步访问url 获取数据
- (void) urlDataAsy:(NSString*) interfaceNname andJsonConditionStr:(NSString*)jsonConditionStr responseBlock:(InterfaceResponseBlock)responseBlock errorBlock:(InterfaceErrorBlock)errorBlock{
    if (interfaceNname == nil || jsonConditionStr == nil) {
        self.res = false;
        NSLog(@"接口名称为空 or 参数为空");
        return;
    }
    
    NSString* basePath = @"toonan.f3322.org:8281/pencil";
    NSString* path = @"";
    path = [path stringByAppendingFormat:@"/%@?jsonConditionStr=%@",interfaceNname, jsonConditionStr];
    NSLog(@"path: %@",path);
    MKNetworkEngine* engine = [[MKNetworkEngine alloc] initWithHostName:basePath customHeaderFields:nil];
    //MKNetworkOperation *op = [engine operationWithPath:path params:param httpMethod:@"POST"];
    MKNetworkOperation *op = [engine operationWithPath:path];
    [op addCompletionHandler:^(MKNetworkOperation *operation){
        NSLog(@"responseData :%@", [operation responseString]);
        NSData* data = [operation responseData];
        NSDictionary* resDict  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        if ([[NSString stringWithFormat:@"%@",[resDict objectForKey:@"result"]] isEqualToString:@"1"] && responseBlock != nil){
            responseBlock(resDict, true,  [resDict objectForKey:@"msg"]);
        }else{
            responseBlock(resDict, false, [resDict objectForKey:@"msg"]);
        }
    }errorHandler:^(MKNetworkOperation *errorOp, NSError *error) {
        NSLog(@"请求错误: %@",[error localizedDescription ]);
        if (errorBlock != nil) {
            errorBlock(error);
        }
    }];
    [engine enqueueOperation:op];
}

#pragma urlDataSyn
//同步访问url 获取数据
-(void) urlDataSyn:(NSString*) interfaceNname andJsonConditionStr:(NSString*)jsonConditionStr{
        NSError *error;
     if (interfaceNname == nil || jsonConditionStr == nil) {
        self.res = false;
        NSLog(@"接口名称为空 or 参数为空");
        return;
    }
    
    NSString* path = @"http://toonan.f3322.org:8281/pencil";
    path = [path stringByAppendingFormat:@"/%@?jsonConditionStr=%@",interfaceNname, jsonConditionStr];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:path]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
        //NSLog(@"result %@ %@",[resDict objectForKey:@"result"]  ,[resDict objectForKey:@"msg"]);
    if ([[NSString stringWithFormat:@"%@",[resDict objectForKey:@"result"]] isEqualToString:@"1" ]) {
        self.res = true;
        self.resDict = resDict;
    }else{
        self.res = false;
        self.resDict = nil;
    }
}

#pragma interfaceEnter
//接口入口
- (void) interfaceEnter:(NSDictionary*)jsonConitionDic interfaceNname:(INTERFACENAME)interfacNname responseBlock:(InterfaceResponseBlock)responseBlock errorBlock:(InterfaceErrorBlock)errorBlock{
    if (jsonConitionDic == nil) {
        return;
    }
    NSString* interfaceName;
    interfaceName = [self genInterfaceName:interfacNname];
    if (interfaceName == nil) {
        return;
    }
    NSString* jsonConitionStr = [self genJsonConitionStr:jsonConitionDic];
    [self urlDataAsy:interfaceName andJsonConditionStr:jsonConitionStr responseBlock:responseBlock errorBlock:errorBlock];
}

#pragma genJsonConitionStr
//将NSDictionary转换成字符串
- (NSString*) genJsonConitionStr:(NSDictionary*)jcsDic {
    NSData * registerData;
    if ([NSJSONSerialization isValidJSONObject:jcsDic]) {
        NSError *error;
        registerData = [NSJSONSerialization dataWithJSONObject:jcsDic options:NSJSONWritingPrettyPrinted error:&error];
       
    }
    NSString *js =[[NSString alloc] initWithData:registerData encoding:NSUTF8StringEncoding];
    js =[js stringByReplacingOccurrencesOfString:@"{" withString:@"%7B"];
    js =[js stringByReplacingOccurrencesOfString:@"}" withString:@"%7D"];
    js =[js stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    js =[js stringByReplacingOccurrencesOfString:@"\"" withString:@"'"];
    js =[js stringByReplacingOccurrencesOfString:@" " withString:@""];
    return js;
}

#pragma genInterfaceName
//接口名转换
//如果有新接口 就新增if语句
- (NSString*) genInterfaceName:(int)interfaceName{
    NSString *itfStr;
    
    if (interfaceName == 1) {
        itfStr = @"webUserLogin";
    }
    
    if (interfaceName == 2) {
        itfStr = @"sendMobileValidCode";
    }

    if (interfaceName == 3) {
        itfStr = @"confirmMobileValidCode";
    }
    
    if (interfaceName == 4) {
        itfStr = @"webUserRegister";
    }

    
    return itfStr;
}

@end
