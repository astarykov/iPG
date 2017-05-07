//
//  FolderCell.h
//  iPhotoGalery
//
//  Created by admin on 4/23/17.
//  Copyright © 2017 staryaprod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FolderCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *folderIcon;
@property (weak, nonatomic) IBOutlet UILabel *folderName;
@property (weak, nonatomic) IBOutlet UILabel *folderDateCreated;

@end
