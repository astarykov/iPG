//
//  FolderCell.h
//  iPhotoGalery
//
//  Created by admin on 4/23/17.
//  Copyright © 2017 staryaprod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FolderCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *folderNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *folderDateCreatedLabel;

@end
