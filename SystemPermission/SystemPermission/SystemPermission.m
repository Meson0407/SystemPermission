//
//  SystemPermission.m
//  SystemPermission
//
//  Created by 薛涛 on 2019/6/28.
//  Copyright © 2019 薛涛. All rights reserved.
//

#import "SystemPermission.h"

@implementation SystemPermission

+ (BOOL)isUserNotificationEnable { // 判断用户是否允许接收通知
    BOOL isEnable = NO;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0f) { // iOS版本 >=8.0 处理逻辑
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        isEnable = (UIUserNotificationTypeNone == setting.types) ? NO : YES;
    } else { // iOS版本 <8.0 处理逻辑
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        isEnable = (UIRemoteNotificationTypeNone == type) ? NO : YES;
    }
    return isEnable;
}

// 如果用户关闭了接收通知功能，该方法可以跳转到APP设置页面进行修改  iOS版本 >=8.0 处理逻辑
+ (void)goToAppSystemSetting {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([application canOpenURL:url]) {
        if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
            [application openURL:url options:@{} completionHandler:nil];
        } else {
            [application openURL:url];
        }
    }
}

// 定位
+ (BOOL)isLocationServiceOpen {
    if ([ CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
        return NO;
    } else
        return YES;
}

+ (void)goToAppSystemSettingLocation
{
    //if (SYSTEM_VERSION_GREATER_THAN(@"8.0")) {
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
    //}
}

+ (void)goToAppSystemSettingNotification
{
    //if (SYSTEM_VERSION_GREATER_THAN(@"8.0")) {
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
    //}
}

/**
 检测照片权限
 
 @return 照片状态
 */
+ (PHAuthorizationStatus)checkPhotoStatus
{
    PHAuthorizationStatus photoAuthorStatus = [PHPhotoLibrary authorizationStatus];
//        BOOL status;
//        switch (photoAuthorStatus) {
//            case PHAuthorizationStatusAuthorized:
//                status = YES;
//                break;
//            case PHAuthorizationStatusDenied:
//                status = NO;
//                break;
//            case PHAuthorizationStatusNotDetermined:
//                status = NO;
//                break;
//            case PHAuthorizationStatusRestricted:
//                status = NO;
//                break;
//            default:
//                status = NO;
//                break;
//        }
    return photoAuthorStatus;
}


/**
 获取相册权限
 */
+ (NSString *)getPhotoAccess
{
    __block PHAuthorizationStatus photoStatus;
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        photoStatus = status;
    }];
    
    NSString *status;
    if (photoStatus == PHAuthorizationStatusAuthorized) {
        status = @"1";
    } else {
        status = @"0";
    }
    
    return status;
}


/**
 检测相机权限
 
 @return 相机状态
 */
+ (AVAuthorizationStatus)checkCameraStatus
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    //    switch (authStatus) {
    //        case AVAuthorizationStatusNotDetermined:
    //            //没有询问是否开启相机
    //            status = NO;
    //            break;
    //        case AVAuthorizationStatusRestricted:
    //            //未授权，家长限制
    //            status = NO;
    //            break;
    //        case AVAuthorizationStatusDenied:
    //            //未授权
    //            status = NO;
    //            break;
    //        case AVAuthorizationStatusAuthorized:
    //            //玩家授权
    //            status = YES;
    //            break;
    //        default:
    //            status = NO;
    //            break;
    //    }
    
    return authStatus;
}


/**
 获取相机权限
 */
+ (NSString *)getCameraAccess
{
    __block NSString *cameraStatus;
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        cameraStatus = granted ? @"1" : @"0";
    }];
    return cameraStatus;
}

/**
 检测麦克风状态
 
 @return 麦克风状态
 */
+ (AVAuthorizationStatus)checkMicrophoneStatus
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    //    BOOL status;
    //    switch (authStatus) {
    //        case AVAuthorizationStatusNotDetermined:
    //            //没有询问是否开启麦克风
    //            status = NO;
    //            break;
    //        case AVAuthorizationStatusRestricted:
    //            //未授权，家长限制
    //            status = NO;
    //            break;
    //        case AVAuthorizationStatusDenied:
    //            //玩家未授权
    //            status = NO;
    //            break;
    //        case AVAuthorizationStatusAuthorized:
    //            //玩家授权
    //            status = YES;
    //            break;
    //        default:
    //            status = NO;
    //            break;
    //    }
    
    return authStatus;
}


/**
 获取麦克风权限
 */
+ (NSString *)getMicrophoneAccess
{
    __block NSString *microphoneStatus;
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
        microphoneStatus = granted ? @"1" : @"0";
    }];
    return microphoneStatus;
}

@end
