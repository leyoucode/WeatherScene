//
//  LDViewController.m
//  WeatherScene
//
//  Created by liu wei on 3/31/14.
//  Copyright (c) 2014 刘 伟. All rights reserved.
//

#import "LDViewController.h"
#import "UIEffectDesignerView.h"

#import "LDRainSceneView.h"
#import "LDWeatherSceneView.h"

@interface LDViewController ()

@end

@implementation LDViewController

@synthesize weatherSceneView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    UIEffectDesignerView* effectView1 = [UIEffectDesignerView effectWithFile:@"snow_light.ped"];
//    UIEffectDesignerView* effectView2 = [UIEffectDesignerView effectWithFile:@"rain_light.ped"];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
//    [imageView setImage:[UIImage imageNamed:@"bg_rain.jpg"]];
//    //    imageView.contentMode
//    [self.view addSubview:imageView];
//    
//    [self.view addSubview:effectView1];
//    [self.view addSubview:effectView2];
    
//    LDRainSceneView *rainView = [[LDRainSceneView alloc] initWithFrame:self.view.bounds andBackgroundImage:[UIImage imageNamed:@"bg_rain.jpg"]];
//    [self.view addSubview:rainView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doRain:(id)sender {
     [weatherSceneView doSkyRainning];
}

- (IBAction)doSnow:(id)sender {
      [weatherSceneView doSkySnowing];
}

- (IBAction)doOvercast:(id)sender {
      [weatherSceneView doSkyOvertcasting];
}

- (IBAction)doCloudy:(id)sender {
      [weatherSceneView doSkyClouding];
}

- (IBAction)doSunny:(id)sender {
      [weatherSceneView doSkyRainning];
}
@end
