//
//  ABParabolicModel.h
//  AngryBirds
//
//  Created by g108 DIT UPM on 06/03/14.
//  Copyright (c) 2014 g108 DIT UPM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABParabolicModel : NSObject

@property (nonatomic) CGFloat initialSpeed;
@property (nonatomic) CGFloat initialAngle;
@property (nonatomic) CGFloat initialGravity;

- (CGFloat) heightAt:(CGFloat)time;
- (CGFloat) distanceAt:(CGFloat)time;

- (CGFloat) duration;

@end
