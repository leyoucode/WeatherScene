//
//  LDWeatherSceneView.h
//  WeatherScene
//
//  Created by liu wei on 4/1/14.
//  Copyright (c) 2014 刘 伟. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    WeatherEffectRain,                  //雨
    WeatherEffectSnow,                //雪
    WeatherEffectOvercast,         //阴天
    WeatherEffectCloudy,             //多云
    WeatherEffectSunny,              //晴天
    WeatherEffectFog                   //雾霾
}WeatherEffect;


@interface LDWeatherSceneView : UIView

-(void) doSkyRainning;

-(void) doSkySnowing;

-(void) doSkyOvertcasting;

-(void) doSkyClouding;

-(void) doSkySunning;

-(void) doSkyFogging;

@end
