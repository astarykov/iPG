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

@property (nonatomic, retain) CustomFolder *destinationFolder;

@end


@interface PhotoShot : NSObject
@property (nonatomic, retain) UIImage *picture;
@property (nonatomic, retain) NSDate *creationDate;
@end
