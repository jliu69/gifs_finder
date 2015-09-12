//
//  ImageDetailsCell.h
//  GifsFinder
//
//  Created by Johnson Liu on 9/11/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageDetailsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *styleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *gifsImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWidth;

@end
