//
//  LDWeatherSceneView.m
//  WeatherScene
//
//  Created by liu wei on 4/1/14.
//  Copyright (c) 2014 刘 伟. All rights reserved.
//

#import "LDWeatherSceneView.h"
#import "UIEffectDesignerView.h"


@interface LDWeatherSceneView()

@property(nonatomic,strong) UIImageView *backgroundImageView;

@end

@implementation LDWeatherSceneView
{
    UIEffectDesignerView* effectView;
    WeatherEffect currentWeatherEffect;
    
    UIImageView *sunshineImageView;//太阳光柱图片
    UIImageView *sunImageView;//太阳图片
    double sunshineAngle;//太阳光柱图片旋转角度
    BOOL isSunshineRoating;//太阳光柱图片是否在旋转中
    BOOL isSunEaseInOuting;//太阳是否正在淡入淡出动画
    
    UIImageView *windImageView;//风车叶子图片
    double windAngle;//风车叶子图片旋转角度
    BOOL isWindRoating;//风车叶子图片是否在旋转中
}

@synthesize backgroundImageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

    }
    return self;
}

-(void) removeCurrentEffect
{
    isSunshineRoating = NO;
    isSunEaseInOuting = NO;
    isWindRoating = NO;
    
    NSArray *subViews =  [self subviews];
    for (UIView *view in subViews) {
        [view removeFromSuperview];
    }
    
    if (effectView!=nil) {
        [effectView removeFromSuperview];
        effectView = nil;
    }
}

-(void) setBackgroundImage:(UIImage*)backgroundImage
{
    if (self.backgroundImageView==nil) {
        [self.backgroundImageView removeFromSuperview];
        self.backgroundImageView = nil;
    }
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:self.backgroundImageView];
   [self.backgroundImageView setImage:backgroundImage];
}

//////////////////////////////////////////////////////// 下雨 ///////////////////////////////////////////////////
-(void) doSkyRainning
{
    //清除当前效果
    [self removeCurrentEffect];
    //Set background image
    [self setBackgroundImage:[UIImage imageNamed:@"bg_thunder_storm.jpg"]];
    effectView = [UIEffectDesignerView effectWithFile:@"rain_light.ped"];
    [self addSubview:effectView];
    
    UIEffectDesignerView *lightningEffectView1 = [UIEffectDesignerView effectWithFile:@"lightning.ped"];
    UIEffectDesignerView *lightningEffectView2 = [UIEffectDesignerView effectWithFile:@"lightning2.ped"];
    
    [self addSubview:lightningEffectView1];
     [self addSubview:lightningEffectView2];
    
    
    UIImageView *cloud1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overcast_cloud1.png"]];
    [cloud1 setFrame:CGRectMake(0, 0, 297, 208)];
    [self addSubview:cloud1];
    
    UIImageView *cloud2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overcast_cloud2.png"]];
    [cloud2 setFrame:CGRectMake(-297-208, 0, 297, 208)];
    [self addSubview:cloud2];
    
    [UIView animateWithDuration:30
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cloud1.frame = CGRectMake(480, 0, 297, 208);
                     }
     
                     completion:^(BOOL finished) {
                         //[unusedViews addObject:userItem];
                         // [cloud removeFromSuperview];
                         //[self moveClouds];
                     }
     ];
    
    [UIView animateWithDuration:40
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cloud2.frame = CGRectMake(480, 0, 297, 208);
                     }
     
                     completion:^(BOOL finished) {
                         //[unusedViews addObject:userItem];
                         // [cloud removeFromSuperview];
                         //[self moveClouds];
                     }
     ];

    
    currentWeatherEffect = WeatherEffectRain;
}







//////////////////////////////////////////////////////// 下雪 ///////////////////////////////////////////////////
-(void) doSkySnowing
{
    //清除当前效果
    [self removeCurrentEffect];
    //Set background image
    [self setBackgroundImage:[UIImage imageNamed:@"bg14_day_snow.jpg"]];
    effectView = [UIEffectDesignerView effectWithFile:@"snow_light.ped"];
    [self addSubview:effectView];
    
    currentWeatherEffect = WeatherEffectSnow;
}

//////////////////////////////////////////////////////// 阴天 ///////////////////////////////////////////////////
-(void) doSkyOvertcasting
{
    //清除当前效果
    [self removeCurrentEffect];
    //Set background image
    [self setBackgroundImage:[UIImage imageNamed:@"bg_overcast.jpg"]];
    
    UIImageView *cloud1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overcast_cloud1.png"]];
    [cloud1 setFrame:CGRectMake(0, 0, 297, 208)];
    [self addSubview:cloud1];
    
    UIImageView *cloud2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overcast_cloud2.png"]];
    [cloud2 setFrame:CGRectMake(-297-208, 0, 297, 208)];
    [self addSubview:cloud2];
    
    [UIView animateWithDuration:30
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cloud1.frame = CGRectMake(480, 0, 297, 208);
                     }
     
                     completion:^(BOOL finished) {
                         //[unusedViews addObject:userItem];
                         // [cloud removeFromSuperview];
                         //[self moveClouds];
                     }
     ];
    
    [UIView animateWithDuration:40
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cloud2.frame = CGRectMake(480, 0, 297, 208);
                     }
     
                     completion:^(BOOL finished) {
                         //[unusedViews addObject:userItem];
                         // [cloud removeFromSuperview];
                         //[self moveClouds];
                     }
     ];
    
    currentWeatherEffect = WeatherEffectOvercast;
}

//////////////////////////////////////////////////////// 多云 ///////////////////////////////////////////////////
-(void) doSkyClouding
{
    //清除当前效果
    [self removeCurrentEffect];
    //Set background image
    [self setBackgroundImage:[UIImage imageNamed:@"bg1_cloudy_day.jpg"]];
   UIImageView *cloud1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cloudy_cloud1.png"]];
    [cloud1 setFrame:CGRectMake(0, 0, 297, 208)];
    [self addSubview:cloud1];
    
   UIImageView *cloud2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overcast_cloud2.png"]];
     [cloud2 setFrame:CGRectMake(-297-208, 0, 297, 208)];
    [self addSubview:cloud2];
    
    [UIView animateWithDuration:30
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cloud1.frame = CGRectMake(480, 0, 297, 208);
                     }
     
                     completion:^(BOOL finished) {
                         //[unusedViews addObject:userItem];
                         // [cloud removeFromSuperview];
                         //[self moveClouds];
                     }
     ];
    
    [UIView animateWithDuration:40
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cloud2.frame = CGRectMake(480, 0, 297, 208);
                     }
     
                     completion:^(BOOL finished) {
                         //[unusedViews addObject:userItem];
                         // [cloud removeFromSuperview];
                         //[self moveClouds];
                     }
     ];
    
}

//////////////////////////////////////////////////////// 晴天 ///////////////////////////////////////////////////
-(void) doSkySunning
{
    //清除当前效果
    [self removeCurrentEffect];
    //Set background image
    [self setBackgroundImage:[UIImage imageNamed:@"bg0_fine_day.jpg"]];
    
    sunImageView = [[UIImageView alloc] initWithFrame:CGRectMake(140, 0, 200, 214)];
    [sunImageView setImage:[UIImage imageNamed:@"sun_small.png"]];
    [self addSubview:sunImageView];
    
    isSunEaseInOuting = YES;
    
    [self startSunEaseInOutAnimation];
    
    sunshineImageView =  [[UIImageView alloc] initWithFrame:CGRectMake(140, 0, 200, 241)];
    //[sunshine setCenter:CGPointMake(200, 180)];
    [sunshineImageView setImage:[UIImage imageNamed:@"sunshine.png"] ];
    [self addSubview:sunshineImageView];
    sunshineAngle = 1;
    isSunshineRoating = YES;
    [self startSunshineRotationAnimation];
    
    currentWeatherEffect = WeatherEffectSunny;
}

//太阳淡入淡出效果
-(void)startSunEaseInOutAnimation
{
    [UIView animateWithDuration:3.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         sunImageView.alpha = 0.8;
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:3.0
                                               delay:0.0
                                             options:UIViewAnimationOptionCurveEaseOut animations:^{
                                                 sunImageView.alpha = 1.0;
                                             }
                                          completion:^(BOOL finished) {
                                              if (isSunEaseInOuting) {
                                                   [self startSunEaseInOutAnimation];
                                              }
                                          }];
                     }];
    
}

//太阳光柱旋转动画
- (void)startSunshineRotationAnimation
{
    
    
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(sunshineAngle * (M_PI / 180.0f));
    
    [UIView animateWithDuration:0.01 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        sunshineImageView.transform = endAngle;
    } completion:^(BOOL finished) {
        if (isSunshineRoating) {
            sunshineAngle += 0.02;
            [self startSunshineRotationAnimation];
        }
    }];
    
}

//////////////////////////////////////////////////////// 雾霾 ///////////////////////////////////////////////////
-(void) doSkyFogging
{
    //清除当前效果
    [self removeCurrentEffect];
    //Set background image
    [self setBackgroundImage:[UIImage imageNamed:@"bg_overcast.jpg"]];
    effectView = [UIEffectDesignerView effectWithFile:@"fog.ped"];
    [self addSubview:effectView];
    
    currentWeatherEffect = WeatherEffectFog;
}

//////////////////////////////////////////////////////// 风 ///////////////////////////////////////////////////
-(void) doSkyWinding
{
    //清除当前效果
    [self removeCurrentEffect];
    //Set background image
    [self setBackgroundImage:[UIImage imageNamed:@"bg_na.jpg"]];
    
    windImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 120, 200,200)];
    [windImageView setImage:[UIImage imageNamed:@"na_windmill.png"]];
    [self addSubview:windImageView];
    
    windAngle = 1;
    isWindRoating = YES;
    [self startWindRotationAnimation];
}

//风车叶子旋转动画
- (void)startWindRotationAnimation
{
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(windAngle * (M_PI / 180.0f));
    [UIView animateWithDuration:0.01 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        windImageView.transform = endAngle;
    } completion:^(BOOL finished) {
        if (isWindRoating) {
             windAngle += 1;
             [self startWindRotationAnimation];
        }
    }];
    
}
@end
