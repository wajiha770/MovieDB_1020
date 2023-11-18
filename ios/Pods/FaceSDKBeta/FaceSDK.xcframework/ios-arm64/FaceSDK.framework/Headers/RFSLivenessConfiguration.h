//
//  RFSLivenessConfiguration.h
//  FaceSDK
//
//  Created by Pavel Kondrashkov on 4/15/21.
//  Copyright © 2021 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <FaceSDK/RFSBaseConfiguration.h>
#import <FaceSDK/RFSCameraPosition.h>

NS_ASSUME_NONNULL_BEGIN

/// Mutable builder part of the `RFSLivenessConfiguration`.
NS_SWIFT_NAME(LivenessConfigurationBuilder)
@interface RFSLivenessConfigurationBuilder: RFSBaseConfigurationBuilder
@end

/// Configuration for the Liveness processing.
///
/// This class is used as a parameters for `-[RFSFaceSDK startLivenessFrom:animated:configuration:onLiveness:completion:]`.
/// The configuration provides convenient properties to change the behavior and the appearance of the Liveness UI module.
NS_SWIFT_NAME(LivenessConfiguration)
@interface RFSLivenessConfiguration : RFSBaseConfiguration<RFSLivenessConfigurationBuilder *> <NSObject>

/// Defines whether the `RFSHintView` idle animation is enabled or not. Defaults to `true`.
/// When set to `false` the `RFSHintView` will not play the animation that is triggered when hint statuses remain the same for some time.
@property(readonly, nonatomic, assign, getter=isHintAnimationEnabled) BOOL enableHintAnimation;

#pragma mark - Liveness

/// The number of attempts to pass the Liveness before completing with error. Defaults to `0`.
/// When set to `0`  the Liveness will always ask to retry on error.
/// When set to `1` or more the Liveness will end with `RFSLivenessError.RFSLivenessErrorProcessingAttemptsEnded` error when the number of attemps exceeds.
@property(readonly, nonatomic, assign) NSInteger attemptsCount;

/// Defines whether the liveness request sends a location of a device. Defaults to `true`.
/// When set to `true` the liveness request to web service will contain the `location` object within the json `metadata` object.
/// The location is used only when permissions are granted and the location is available.
@property(readonly, nonatomic, assign, getter=isLocationTrackingEnabled) BOOL locationTrackingEnabled;

#pragma mark - Camera

/// Defines whether the camera switch button is available on the Liveness UI. Defaults to `false`.
/// When set to `true` the `RFSCameraToolbarView` will contain a button to change current `cameraPosition`.
@property(readonly, nonatomic, assign) BOOL cameraSwitchEnabled;

/// Selected camera device position. Defaults to `.front`.
@property(readonly, nonatomic, assign) RFSCameraPosition cameraPosition;

@end

@interface RFSLivenessConfigurationBuilder ()

/// @see RFSLivenessConfiguration.enableHintAnimation
@property(readwrite, nonatomic, assign, getter=isHintAnimationEnabled) BOOL enableHintAnimation;
/// @see RFSLivenessConfiguration.attemptsCount.
@property(readwrite, nonatomic, assign) NSInteger attemptsCount;
/// @see RFSLivenessConfiguration.locationTrackingEnabled.
@property(readwrite, nonatomic, assign, getter=isLocationTrackingEnabled) BOOL locationTrackingEnabled;
/// @see RFSLivenessConfiguration.cameraSwitchEnabled.
@property(readwrite, nonatomic, assign) BOOL cameraSwitchEnabled;
/// @see RFSLivenessConfiguration.cameraPosition.
@property(readwrite, nonatomic, assign) RFSCameraPosition cameraPosition;

@end

NS_ASSUME_NONNULL_END
