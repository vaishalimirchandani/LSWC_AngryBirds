//
//  ABbombardingAreaView.h
//  AngryBirds
//
//  Created by g108 DIT UPM on 06/03/14.
//  Copyright (c) 2014 g108 DIT UPM. All rights reserved.
///Users/alejandro/repos/vaish/LSWC_AngryBirds/AngryBirds/ABbombardingAreaView.h

#import <UIKit/UIKit.h>

@class ABbombardingAreaView;

@protocol TrajectoryDataSource

- (CGFloat) trajViewStartTime:(ABbombardingAreaView*)tv;
- (CGFloat) trajViewEndTime:(ABbombardingAreaView*)tv;

- (CGFloat) trajView:(ABbombardingAreaView*)tv heightAt:(CGFloat)time;
- (CGFloat) trajView:(ABbombardingAreaView*)tv distanceAt:(CGFloat)time;


@end

@interface ABbombardingAreaView : UIView

@property (nonatomic) CGFloat targetDistance;

@property (nonatomic, weak) id <TrajectoryDataSource> dataSource;

@end
