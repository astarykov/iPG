//
//  PhotosTableViewController.m
//  iPhotoGalery
//
//  Created by admin on 5/6/17.
//  Copyright © 2017 staryaprod. All rights reserved.
//

#import "PhotosTableViewController.h"
#import "PhotoCell.h"
#import "PreViewController.h"
#import "Utils.h"

@interface PhotosTableViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

//@property (nonatomic, retain) NSMutableArray *photos;

@end

@implementation PhotosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UINib *nib = [UINib nibWithNibName:@"PhotoCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"photoCell"];
    
    if (!_destinationFolder.photos)
    {
        _destinationFolder.photos = [[NSMutableArray alloc] init];
    }
    //_photos = _destinationFolder.photos ? _destinationFolder.photos : [[NSMutableArray alloc] init];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _destinationFolder.photos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoShot* shot = [_destinationFolder.photos objectAtIndex:indexPath.row];
    
    PhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"photoCell" forIndexPath:indexPath];
    cell.picture.image = shot.picture;

    cell.creationDate.text = [Utils getCurrentDateWithString:shot.creationDate];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Delete"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        [_destinationFolder.photos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    deleteAction.backgroundColor = [UIColor redColor];
    return @[deleteAction];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"previewImage" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"previewImage"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PhotoShot *pickedImage = [_destinationFolder.photos objectAtIndex:indexPath.row];
        PreViewController *destViewController = segue.destinationViewController;
        destViewController.currentImage = pickedImage.picture;
    }
}

- (IBAction)takePhoto:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    PhotoShot *shot = [[PhotoShot alloc] init];
    shot.picture = [info valueForKey:UIImagePickerControllerOriginalImage];
    shot.creationDate = [NSDate date];
    [_destinationFolder.photos addObject:shot];
    [self.tableView reloadData];
    
    _destinationFolder.photos = _destinationFolder.photos;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end


@implementation PhotoShot

@end
