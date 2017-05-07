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

@interface PhotosTableViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, retain) NSMutableArray *photos;

@end

@implementation PhotosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UINib *nib = [UINib nibWithNibName:@"PhotoCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"photoCell"];
    
    _photos = _destinationFolder.photos ? _destinationFolder.photos : [[NSMutableArray alloc] init];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _photos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoShot* shot = [[PhotoShot alloc] init];
    shot.picture = [_photos objectAtIndex:indexPath.row];
    PhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"photoCell" forIndexPath:indexPath];
    cell.picture.image = shot.picture;
    
    shot.creationDate = [NSDate date];
    NSDateFormatter *dt = [[NSDateFormatter alloc]init];
    [dt setDateFormat:@"yyyy-MM-dd HH:mm"];
    cell.creationDate.text = [NSString stringWithFormat:@"%@", [dt stringFromDate:shot.creationDate]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Delete"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        [_photos removeObjectAtIndex:indexPath.row];
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
        UIImage *pickedImage = [_photos objectAtIndex:indexPath.row];
        PreViewController *destViewController = segue.destinationViewController;
        destViewController.currentImage = pickedImage;
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
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [_photos addObject:image];
    [self.tableView reloadData];
    
    _destinationFolder.photos = _photos;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end


@implementation PhotoShot

@end
