//
//  SystemPermission.h
//  SystemPermission
//
//  Created by 薛涛 on 2019/6/28.
//  Copyright © 2019 薛涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>
#import <CoreLocation/CoreLocation.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface SystemPermission : NSObject

/**
 判断用户是否允许了通知
 
 @return 通知状态
 */
+ (BOOL)isUserNotificationEnable;

/**
 跳转系统设置--通知
 */
+ (void)goToAppSystemSettingNotification;


/**
 跳转到系统设置界面
 */
+ (void)goToAppSystemSetting;

/**
 判断定位权限是否打开
 
 @return 定位状态
 */
+ (BOOL)isLocationServiceOpen;


/**
 跳转系统设置--定位
 */
+ (void)goToAppSystemSettingLocation;

/**
 检测照片权限
 
 @return 照片状态
 */
+ (PHAuthorizationStatus)checkPhotoStatus;


/**
 获取相册权限
 */
+ (NSString *)getPhotoAccess;

/**
 检测相机权限
 
 @return 相机状态
 */
+ (AVAuthorizationStatus)checkCameraStatus;


/**
 获取相机权限
 */
+ (NSString *)getCameraAccess;

/**
 检测麦克风状态
 
 @return 麦克风状态
 */
+ (AVAuthorizationStatus)checkMicrophoneStatus;


/**
 获取麦克风权限
 */
+ (NSString *)getMicrophoneAccess;

@end

NS_ASSUME_NONNULL_END
