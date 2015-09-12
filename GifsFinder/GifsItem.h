//
//  GifsItem.h
//  GifsFinder
//
//  Created by Johnson Liu on 9/10/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GifsItem : NSObject

@property (strong, nonatomic) NSString *styleName;
@property (strong, nonatomic) UIImage *image;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;

@end
