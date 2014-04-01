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
    UIImageView *sunshine;
    UIImageView *sunImageView;
    double angle;
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
    [self setBackgroundImage:[UIImage imageNamed:@"bg_rain.jpg"]];
    effectView = [UIEffectDesignerView effectWithFile:@"rain_light.ped"];
    [self addSubview:effectView];
    
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
    
    [sunImageView.layer removeAllAnimations];
    
    [self sunStartAlphaAnimation];
    
    sunshine =  [[UIImageView alloc] initWithFrame:CGRectMake(140, 0, 200, 241)];
    //[sunshine setCenter:CGPointMake(200, 180)];
    [sunshine setImage:[UIImage imageNamed:@"sunshine.png"] ];
    [self addSubview:sunshine];
    angle = 10;
    
        [sunshine.layer removeAllAnimations];
    
    [self startAnimation];
    
    currentWeatherEffect = WeatherEffectSunny;
}

-(void)sunStartAlphaAnimation
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
                                               [self sunStartAlphaAnimation];
                                          }];
                     }];
    
}

- (void)startAnimation
{
    
    
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(angle * (M_PI / 180.0f));
    
    [UIView animateWithDuration:0.01 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        sunshine.transform = endAngle;
    } completion:^(BOOL finished) {
        angle += 0.02;
        [self startAnimation];
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
@end
