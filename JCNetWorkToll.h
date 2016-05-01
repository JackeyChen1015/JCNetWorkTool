//
//  JCNetWorkToll.h
//  网络成功和失败的回调
//
//  Created by JackeyChen on 16/1/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义Block 类型:
//1.成功回调 参数类型: 二进制数据和响应头信息
typedef void(^SuccessBlcok)(NSData *data , NSURLRequest *request);
//2.失败回调
typedef void(^FailBlock)(NSError *error);

@interface JCNetWorkToll : NSObject


//实例化单例的方法
+(instancetype)shareNetWorkTool;

//发送网络请求的方法
//urlString:网路接口
//两个block 参数
//1.successBlk 成功回调
//2.failBlk 失败回调
-(void)getServerDataWithUrlString:(NSString *)urlString Success:(SuccessBlcok)successBlk Fail:(FailBlock)failBlk;


@end
