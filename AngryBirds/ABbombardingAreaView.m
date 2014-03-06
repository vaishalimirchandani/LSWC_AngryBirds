//
//  ABbombardingAreaView.m
//  AngryBirds
//
//  Created by g108 DIT UPM on 06/03/14.
//  Copyright (c) 2014 g108 DIT UPM. All rights reserved.
//

#import "ABbombardingAreaView.h"

@implementation ABbombardingAreaView

/*- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
*/

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    UIBezierPath *tray = [UIBezierPath bezierPath];
    [tray moveToPoint:CGPointMake(0, 0)];
    CGFloat posX = 10;
    CGFloat posY = 20;
    
    for (CGFloat t = 0; t<10; t+= 0.1) {
    
        posX += 5;
        posY += 3;
        
        [tray addLineToPoint:CGPointMake(posX, posY)];
        
    }
    
    [tray setLineWidth:3];
    [[UIColor redColor]set];
    [tray stroke];

}


@end
