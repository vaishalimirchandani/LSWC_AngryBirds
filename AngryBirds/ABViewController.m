//
//  ABViewController.m
//  AngryBirds
//
//  Created by g108 DIT UPM on 06/03/14.
//  Copyright (c) 2014 g108 DIT UPM. All rights reserved.
//

#import "ABViewController.h"
#import "ABbombardingAreaView.h"

@interface ABViewController ()

@property (weak, nonatomic) IBOutlet UIView *BombardingArea;
@end

@implementation ABViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)givenAngle:(UISlider *)sender {
}

- (IBAction)givenSpeed:(UISlider *)sender {
}

- (IBAction)givenDistance:(UISlider *)sender {
}


@end
