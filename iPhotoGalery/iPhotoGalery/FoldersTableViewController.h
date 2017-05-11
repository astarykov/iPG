//
//  TableViewController.h
//  iPhotoGalery
//
//  Created by admin on 4/23/17.
//  Copyright © 2017 staryaprod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoldersTableViewController : UITableViewController

@end

@interface CustomFolder : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSMutableArray *photos;

@end
