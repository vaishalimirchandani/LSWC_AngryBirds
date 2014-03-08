//
//  ABbombardingAreaView.m
//  AngryBirds
//
//  Created by g108 DIT UPM on 06/03/14.
//  Copyright (c) 2014 g108 DIT UPM. All rights reserved.
//

#import "ABbombardingAreaView.h"

#define HEIGHT_VIEW 200

@implementation ABbombardingAreaView

- (CGFloat) height2Pixels:(CGFloat)alture{
    CGFloat h = self.bounds.size.height;
    return h - alture / HEIGHT_VIEW * h;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    UIBezierPath * traj = [UIBezierPath bezierPath];
    
    CGFloat t0 = [self.dataSource trajViewStartTime:self] ;
    CGFloat t1 = [self.dataSource trajViewEndTime:self] ;
    
    CGFloat posX = [self.dataSource trajView:self distanceAt:t0];
    CGFloat posY = [self height2Pixels:[self.dataSource trajView:self heightAt:t0]];
    
    //Init trajectory line
    [traj moveToPoint:CGPointMake(posX, posY)];
    
    for (CGFloat t = t0; t<t1+0.1; t+= 0.1) {

        posX = [self.dataSource trajView:self distanceAt:t];
        posY = [self height2Pixels:[self.dataSource trajView:self heightAt:t]];
        
        [traj addLineToPoint:CGPointMake(posX, posY)];
        
    }
    
    //[traj setLineWidth:3];
    traj.lineWidth = 3;
    [[UIColor redColor]set];
    [traj stroke];

}


@end
