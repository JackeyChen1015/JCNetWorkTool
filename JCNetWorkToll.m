//
//  JCNetWorkToll.m
//  网络成功和失败的回调
//
//  Created by JackeyChen on 16/1/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "JCNetWorkToll.h"

@implementation JCNetWorkToll

//网络请求完成之后的回调
-(void)getServerDataWithUrlString:(NSString *)urlString Success:(SuccessBlcok)successBlk Fail:(FailBlock)failBlk{
    
//    1.创建网络请求
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:15];
    
//    2.发送网络请求
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
//        网络请求完成之后的回调
        
//        成功:
        if (data && !error) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
//               3.执行成功回调
                if (successBlk) {
                    successBlk(data,request);
                }
            });
        }else{
            
            if (failBlk) {
//                3.执行失败回调
                failBlk(error);
            }
        }
    }]resume];

}


+(instancetype)shareNetWorkTool{
    
    static id _instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[self alloc] init];
        
    });
    
    return _instance;
}


@end
