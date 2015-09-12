//
//  ImageHelper.h
//  GifsFinder
//
//  Created by Johnson Liu on 9/10/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GifObject;


@interface ImageHelper : NSObject

- (NSArray *)displayImageListFrom:(NSArray *)imagesArray;
- (NSArray *)detailsFromImage:(GifObject *)selectedGif;

@end
