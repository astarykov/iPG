//
//  PreViewController.h
//  iPhotoGalery
//
//  Created by admin on 5/7/17.
//  Copyright © 2017 staryaprod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *previewImageView;
@property (nonatomic, strong) UIImage *currentImage;

@end
