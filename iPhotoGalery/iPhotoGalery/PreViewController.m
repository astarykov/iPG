//
//  PreViewController.m
//  iPhotoGalery
//
//  Created by admin on 5/7/17.
//  Copyright © 2017 staryaprod. All rights reserved.
//

#import "PreViewController.h"

@interface PreViewController ()

@end

@implementation PreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.previewImageView.image = _currentImage;
}

@end
