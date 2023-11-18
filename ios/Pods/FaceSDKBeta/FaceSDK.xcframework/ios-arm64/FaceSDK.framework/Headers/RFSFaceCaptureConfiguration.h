//
//  RFSFaceCaptureConfiguration.h
//  FaceSDK
//
//  Created by Pavel Kondrashkov on 4/16/21.
//  Copyright © 2021 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <FaceSDK/RFSBaseConfiguration.h>
#import <FaceSDK/RFSCameraPosition.h>

NS_ASSUME_NONNULL_BEGIN

/// Mutable builder part of the `RFSFaceCaptureConfiguration`.
NS_SWIFT_NAME(FaceCaptureConfigurationBuilder)
@interface RFSFaceCaptureConfigurationBuilder: RFSBaseConfigurationBuilder
@end

/// Configuration for the FaceCapture.
///
/// This class is used as a parameters for `-[RFSFaceSDK presentFaceCaptureViewControllerFrom:animated:configuration:onCapture:completion:]`.
/// The configuration provides convenient properties to change the behavior and the appearance of the FaceCapture UI module.
NS_SWIFT_NAME(FaceCaptureConfiguration)
@interface RFSFaceCaptureConfiguration : RFSBaseConfiguration<RFSFaceCaptureConfigurationBuilder *> <NSObject>

/// Defines whether the `RFSHintView` idle animation is enabled or not. Defaults to `true`.
/// When set to `false` the `RFSHintView` will not play the animation that is triggered when hint statuses remain the same for some time.
@property(readonly, nonatomic, assign, getter=isHintAnimationEnabled) BOOL enableHintAnimation;

#pragma mark - Camera

/// Defines whether the camera switch button is available on the FaceCapture UI. Defaults to `false`.
/// When set to `true` the `RFSCameraToolbarView` will contain a button to change current `cameraPosition`.
@property(readonly, nonatomic, assign) BOOL cameraSwitchEnabled;
/// Selected camera device position. Defaults to `.front`.
@property(readonly, nonatomic, assign) RFSCameraPosition cameraPosition;

@end

@interface RFSFaceCaptureConfigurationBuilder ()

/// @see RFSLivenessConfiguration.enableHintAnimation
@property(readwrite, nonatomic, assign, getter=isHintAnimationEnabled) BOOL enableHintAnimation;
/// @see RFSFaceCaptureConfiguration.cameraSwitchEnabled.
@property(readwrite, nonatomic, assign) BOOL cameraSwitchEnabled;
/// @see RFSFaceCaptureConfiguration.cameraPosition.
@property(readwrite, nonatomic, assign) RFSCameraPosition cameraPosition;

@end

NS_ASSUME_NONNULL_END
