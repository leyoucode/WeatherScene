//
//  LDRainSceneView.m
//  WeatherScene
//
//  Created by liu wei on 3/31/14.
//  Copyright (c) 2014 刘 伟. All rights reserved.
//

#import "LDRainSceneView.h"
#import "UIEffectDesignerView.h"
#import "UIEffectDesignerView.h"

@implementation LDRainSceneView
{
    UIImageView *cloud1;
    UIImageView *cloud2;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//-(id)initWithFrame:(CGRect)frame andBackgroundImage:(UIImage *)backgroundImage
//{
//    self = [super initWithFrame:frame withBackgroundImage:backgroundImage withEffectWithFile:@"rain_heavy.ped"];
//    if (self) {
//        cloud1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overcast_cloud1.png"]];
//        [self addSubview:cloud1];
//        cloud2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overcast_cloud2.png"]];
//        [self addSubview:cloud2];
//    }
//    
//    [self moveClouds];
//    return self;
//}

-(void)moveClouds
{
    
    [cloud1 setFrame:CGRectMake(-297, 0, 297, 208)];
    [cloud2 setFrame:CGRectMake(-297-208, 0, 297, 208)];
    
    [UIView animateWithDuration:60
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
    
    [UIView animateWithDuration:80
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
