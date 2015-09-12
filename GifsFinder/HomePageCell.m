//
//  HomePageCell.m
//  GifsFinder
//
//  Created by Johnson Liu on 9/10/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import "HomePageCell.h"

@implementation HomePageCell

@synthesize gifImageView;
@synthesize gifDescLabel;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
