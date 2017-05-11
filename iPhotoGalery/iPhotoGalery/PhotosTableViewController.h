//
//  PhotosTableViewController.h
//  iPhotoGalery
//
//  Created by admin on 5/6/17.
//  Copyright © 2017 staryaprod. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoldersTableViewController.h"

@interface PhotosTableViewController : UITableViewController

@property (nonatomic, strong) CustomFolder *destinationFolder;

@end


@interface PhotoShot : NSObject
@property (nonatomic, strong) UIImage *picture;
@property (nonatomic, strong) NSDate *creationDate;
@end
