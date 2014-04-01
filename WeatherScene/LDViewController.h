//
//  LDViewController.h
//  WeatherScene
//
//  Created by liu wei on 3/31/14.
//  Copyright (c) 2014 刘 伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LDWeatherSceneView;

@interface LDViewController : UIViewController

@property (strong, nonatomic) IBOutlet LDWeatherSceneView *weatherSceneView;

- (IBAction)doRain:(id)sender;
- (IBAction)doSnow:(id)sender;
- (IBAction)doOvercast:(id)sender;
- (IBAction)doCloudy:(id)sender;
- (IBAction)doSunny:(id)sender;
- (IBAction)doFog:(id)sender;

@end
