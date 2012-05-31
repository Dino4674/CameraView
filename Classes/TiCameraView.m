/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2012 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiCameraView.h"

@interface  TiCameraView ()

@property (nonatomic, retain) UIView *cameraView;
@property (nonatomic, retain) UIImagePickerController *imagePicker;

@end

@implementation TiCameraView

@synthesize cameraView, imagePicker;

-(void)dealloc
{
    RELEASE_TO_NIL(self.cameraView);
    RELEASE_TO_NIL(self.imagePicker);
    [super dealloc];
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    if (self.cameraView == nil) {
        self.imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.allowsEditing = NO;
        imagePicker.showsCameraControls = NO;
        
        self.cameraView = [[UIView alloc] initWithFrame: [self frame]];
        self.cameraView.clipsToBounds = YES;
        
        [self.cameraView addSubview:imagePicker.view];
        
        [self addSubview:self.cameraView];
    }
    
    [TiUtils setView:self.cameraView positionRect:bounds];
}

@end
