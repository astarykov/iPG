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

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSDate *date;
@property (nonatomic, retain) NSMutableArray *photos;

@end
