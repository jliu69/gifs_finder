//
//  ImageDetailsCell.m
//  GifsFinder
//
//  Created by Johnson Liu on 9/11/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import "ImageDetailsCell.h"

@implementation ImageDetailsCell

@synthesize styleLabel;
@synthesize gifsImageView;
@synthesize imageWidth;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
