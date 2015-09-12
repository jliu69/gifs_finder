//
//  GifObject.h
//  GifsFinder
//
//  Created by Johnson Liu on 9/10/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ImageObjects;

@interface GifObject : NSObject

@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *imageId;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *bitlyGifUrl;
@property (strong, nonatomic) NSString *bitlyUrl;
@property (strong, nonatomic) NSString *embedUrl;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *source;
@property (strong, nonatomic) NSString *rating;
@property (strong, nonatomic) NSString *caption;
@property (strong, nonatomic) NSString *contentUrl;
@property (strong, nonatomic) NSDate *importDate;
@property (strong, nonatomic) NSDate *trendingDate;
@property (strong, nonatomic) ImageObjects *imagesData;

@end
