//
//  TableViewController.m
//  iPhotoGalery
//
//  Created by admin on 4/23/17.
//  Copyright © 2017 staryaprod. All rights reserved.
//

#import "FoldersTableViewController.h"
#import "PhotosTableViewController.h"
#import "FolderCell.h"

@interface FoldersTableViewController() <UIAlertViewDelegate>

@property (nonatomic,strong) NSMutableArray *foldersList;

@end

@implementation FoldersTableViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"FolderCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"folderCell"];
    
    _foldersList = [[NSMutableArray alloc] init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _foldersList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FolderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"folderCell"];
    CustomFolder *currentFolder = [_foldersList objectAtIndex:indexPath.row];
    cell.folderName.text = currentFolder.name;
    
    NSDateFormatter *dt = [[NSDateFormatter alloc]init];
    [dt setDateFormat:@"yyyy-MM-dd HH:mm"];
    cell.folderDateCreated.text = [NSString stringWithFormat:@"%@", [dt stringFromDate:currentFolder.date]];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pushToFolder"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CustomFolder *currentFolder = [_foldersList objectAtIndex:indexPath.row];
        PhotosTableViewController *destViewController = segue.destinationViewController;
        destViewController.destinationFolder = currentFolder;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"pushToFolder" sender:self];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Delete"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        [_foldersList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    deleteAction.backgroundColor = [UIColor redColor];
    return @[deleteAction];
}

- (IBAction)addNewFolder:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"New Folder" message:@"Add new folder" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action){
                                                   UITextField *textField = alert.textFields[0];
                                                   [self addNewFolderToList:textField.text];
                                               }];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                                       
                                                   }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Folder name";
        textField.keyboardType = UIKeyboardTypeDefault;
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)addNewFolderToList:(NSString*)name
{
    CustomFolder *newFolder = [[CustomFolder alloc] init];
    newFolder.name = name;
    newFolder.date = [NSDate date];
    
    [_foldersList addObject:newFolder];
    [self.tableView reloadData];
}

@end


@implementation CustomFolder
@end