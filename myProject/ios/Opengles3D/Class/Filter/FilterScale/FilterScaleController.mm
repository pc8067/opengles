//
//  FilterScaleController.m
//  Opengles3D
//
//  Created by 勒俊 on 2017/7/21.
//  Copyright © 2017年 XunLei. All rights reserved.
//

#import "FilterScaleController.h"
#import "filter_scale.hpp"
#import "OpenglesTool.h"

@interface FilterScaleController ()

@property (nonatomic, assign) CGFloat           time;

@end

@implementation FilterScaleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setupGL
{
    [EAGLContext setCurrentContext:self.context];
    
    memset( &_esContext, 0, sizeof( _esContext ) );
    
    
    _esContext.userData = malloc(sizeof(FILTER_SCALE::UserData));
    
    FILTER_SCALE::UserData *userData = (FILTER_SCALE::UserData *)_esContext.userData;
    
    UIImage *image = [UIImage imageNamed:@"sj_20160705_2.JPG"];
    
    userData->buffer1 = (char *)[OpenglesTool getBuffer:image];
    userData->buffer1_width = image.size.width;
    userData->buffer1_height = image.size.height;
    
    FILTER_SCALE demo;
    demo.esMain(&_esContext);
}


- (void)update
{
    if ( _esContext.updateFunc )
    {
        _esContext.updateFunc( &_esContext, self.timeSinceLastUpdate );
    }
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    _esContext.width = (GLint)view.drawableWidth;
    _esContext.height = (GLint)view.drawableHeight;
    
    if ( _esContext.drawFunc )
    {
        _esContext.drawFunc( &_esContext );
    }
}


@end
