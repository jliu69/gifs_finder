//
//  ImageDetailsViewController.h
//  GifsFinder
//
//  Created by Johnson Liu on 9/10/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@class GifObject;


@interface ImageDetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate, MFMessageComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *processingView;
@property (weak, nonatomic) IBOutlet UILabel *noImageMessageLabel;

@property (strong, nonatomic) GifObject *selectedGif;


- (IBAction)backAction:(id)sender;

@end
