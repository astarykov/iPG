//
//  TableViewController.m
//  iPhotoGalery
//
//  Created by admin on 4/23/17.
//  Copyright © 2017 staryaprod. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController()

@end

@implementation TableViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"FolderCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"folderCell"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"folderCell"];
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 210;
//}

@end
