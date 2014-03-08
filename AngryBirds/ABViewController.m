//
//  ABViewController.m
//  AngryBirds
//
//  Created by g108 DIT UPM on 06/03/14.
//  Copyright (c) 2014 g108 DIT UPM. All rights reserved.
//

#import "ABViewController.h"
#import "ABbombardingAreaView.h"
#import "ABParabolicModel.h"

@interface ABViewController () <TrajectoryDataSource>

@property (weak, nonatomic) IBOutlet ABbombardingAreaView *bombardingArea;
@property (weak, nonatomic) IBOutlet ABParabolicModel *model;


@property (weak, nonatomic) IBOutlet UISlider *angleSlider;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;

@end

@implementation ABViewController

//Changing default model getter
/*- (ABParabolicModel*) model{
    if(!_model){
        _model = [[ABParabolicModel alloc] init];
    }
    return _model;
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.bombardingArea.dataSource = self;
    [self givenSpeed:self.speedSlider];
    [self givenAngle:self.angleSlider];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)givenAngle:(UISlider *)sender {
    self.model.initialAngle = sender.value;
    [self.bombardingArea setNeedsDisplay];
}

- (IBAction)givenSpeed:(UISlider *)sender {
    self.model.initialSpeed = sender.value;
    [self.bombardingArea setNeedsDisplay];
}

- (IBAction)givenDistance:(UISlider *)sender {
    self.bombardingArea.targetDistance = sender.value;
    [self.bombardingArea setNeedsDisplay];
}

#pragma mark - Data Source de Trajectory View

- (CGFloat) trajViewStartTime:(ABbombardingAreaView*)tv{
    return 0;
}

- (CGFloat) trajViewEndTime:(ABbombardingAreaView*)tv{
    return [self.model duration];
}

- (CGFloat) trajView:(ABbombardingAreaView*)tv heightAt:(CGFloat)time{
    return [self.model heightAt:time];
}

- (CGFloat) trajView:(ABbombardingAreaView*)tv distanceAt:(CGFloat)time{
    return [self.model distanceAt:time];
}
@end
