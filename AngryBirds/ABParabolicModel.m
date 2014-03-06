//
//  ABParabolicModel.m
//  AngryBirds
//
//  Created by g108 DIT UPM on 06/03/14.
//  Copyright (c) 2014 g108 DIT UPM. All rights reserved.
//

#import "ABParabolicModel.h"

#define EARTH_GRAVITY 9.80665

@implementation ABParabolicModel

- (float) speedXInitial{
    return self.initialSpeed*cos(self.initialAngle);
}

- (float) speedYInitial{
    return self.initialSpeed*sin(self.initialAngle);
}


- (CGFloat) heightAt:(CGFloat)time{
    return [self speedYInitial] * time - (0.5 * EARTH_GRAVITY * time * time);
}

- (CGFloat) distanceAt:(CGFloat)time{
    return [self speedXInitial] * time;
}

- (CGFloat) duration{
    return 2 * [self speedYInitial] / EARTH_GRAVITY;
}


@end
