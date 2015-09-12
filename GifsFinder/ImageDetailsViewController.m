//
//  ImageDetailsViewController.m
//  GifsFinder
//
//  Created by Johnson Liu on 9/10/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import "ImageDetailsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <MessageUI/MessageUI.h>
#import "ConnectionHelper.h"
#import "GifObject.h"
#import "ImageHelper.h"
#import "GifsItem.h"
#import "ImageDetailsCell.h"


@interface ImageDetailsViewController ()

@property (strong, nonatomic) NSArray *rowsArray;
@property (strong, nonatomic) GifsItem *selectedItem;

@property (strong, nonatomic) MFMessageComposeViewController *composer;

@end


@implementation ImageDetailsViewController

@synthesize tableView;
@synthesize processingView;
@synthesize noImageMessageLabel;
@synthesize selectedGif;
@synthesize rowsArray;
@synthesize selectedItem;
@synthesize composer;

#pragma mark - Init

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.noImageMessageLabel.hidden = YES;
    self.rowsArray = [NSArray array];
    
    if (![ConnectionHelper isConnectionAvailable]) {
        [self hideProgressView];
        [self noConnectionMessage];
        return;
    }
    
    self.processingView.layer.cornerRadius = 10;
    self.processingView.clipsToBounds = YES;
    
    [self getDetailImages];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - IB action

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - local methods

- (void)getDetailImages {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        ImageHelper *helper = [ImageHelper new];
        NSArray *detailsArray = [helper detailsFromImage:self.selectedGif];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.rowsArray = [NSArray arrayWithArray:detailsArray];
            
            if (self.rowsArray == nil || self.rowsArray.count == 0)
                self.noImageMessageLabel.hidden = NO;
            
            [self.tableView reloadData];
            [self hideProgressView];
        });
    });
}

- (void)showProgressView {
    self.processingView.hidden = NO;
    [self.view bringSubviewToFront:self.processingView];
}

- (void)hideProgressView {
    self.processingView.hidden = YES;
    [self.view sendSubviewToBack:self.processingView];
}

- (void)noConnectionMessage {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:@"There is no Internet connection, please try again when it resumes."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark - table view source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.rowsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"CellId";
    ImageDetailsCell *cell = (ImageDetailsCell *)[self.tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ImageDetailsCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    GifsItem *item = [self.rowsArray objectAtIndex:indexPath.row];
    cell.styleLabel.text = [NSString stringWithFormat:@"Image Style : %@", item.styleName];
    
    if (item.image == nil) {
        cell.gifsImageView.backgroundColor = [UIColor lightGrayColor];
    }
    else {
        cell.gifsImageView.image = item.image;
        
        //-- 100 is the fixed height of image view
        cell.imageWidth.constant = item.width * 100 / item.height;
    }
    
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (![ConnectionHelper isConnectionAvailable]) {
        [self noConnectionMessage];
        return;
    }
    
    self.selectedItem = [self.rowsArray objectAtIndex:indexPath.row];
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select Sharing option:"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Share via SMS", @"Copy to Clipboard", nil];
    
    [actionSheet showInView:self.view];
}

#pragma mark - action sheet delegate

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0: {
            //-- share via SMS
            
            self.composer = [[MFMessageComposeViewController alloc] init];
            self.composer.messageComposeDelegate = self;
            [self.composer setSubject:@"Share Image"];
            
            if([MFMessageComposeViewController respondsToSelector:@selector(canSendAttachments)] && [MFMessageComposeViewController canSendAttachments]) {
                
                NSData *attachment = UIImageJPEGRepresentation(self.selectedItem.image, 1.0);
                NSString *uti = (NSString *)kUTTypeMessage;
                [self.composer addAttachmentData:attachment typeIdentifier:uti filename:@"myImage.jpg"];
            }
            
            [self presentViewController:self.composer animated:YES completion:nil];
            break;
        }
        case 1: {
            //-- copy to clipboard
            
            NSData *data = UIImagePNGRepresentation(self.selectedItem.image);
            UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
            [pasteBoard setData:data forPasteboardType:(NSString *)kUTTypeGIF];
            break;
        }
        default:break;
    }
}

#pragma mark - message compose delegate

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    [self.composer dismissViewControllerAnimated:YES completion:nil];
}

@end

