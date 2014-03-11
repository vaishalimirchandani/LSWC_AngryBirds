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
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) ABParabolicModel *model;


@property (weak, nonatomic) IBOutlet UISlider *angleSlider;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (weak, nonatomic) IBOutlet UISlider *gravitySlider;

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
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3bt5"]];
    [self.containerView addSubview:backgroundView];
    [self.containerView sendSubviewToBack:backgroundView];
    
    self.bombardingArea.dataSource = self;
    
    self.model = [[ABParabolicModel alloc] init];
    [self givenSpeed:self.speedSlider];
    [self givenAngle:self.angleSlider];
    [self givenGravity:self.gravitySlider];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)givenAngle:(UISlider *)sender {
    //initial value is 45º = pi/4
    self.model.initialAngle = sender.value*1.57;
    [self.bombardingArea setNeedsDisplay];
}

- (IBAction)givenSpeed:(UISlider *)sender {
    //initial value is 50 m/s
    self.model.initialSpeed = sender.value*100;
    [self.bombardingArea setNeedsDisplay];
}

- (IBAction)givenGravity:(UISlider *)sender {
    //initial value is earth gravity
    self.model.initialGravity = sender.value*18.16132;
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
