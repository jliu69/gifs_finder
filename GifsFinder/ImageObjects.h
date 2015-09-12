//
//  ImageObjects.h
//  GifsFinder
//
//  Created by Johnson Liu on 9/10/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FixedHeight, FixedHeightStill, FixedHeightDownsampled, FixedWidth, FixedWidthStill, FixedWidthDownsampled, FixedHeightSmall, FixedHeightSmallStill, FixedWidthSmall, FixedWidthSmallStill, Downsized, DownsizedStill, DownsizedLarge, Original, OriginalStill;

@interface ImageObjects : NSObject

@property (strong, nonatomic) FixedHeight *fixedHeight;
@property (strong, nonatomic) FixedHeightStill *fixedHeighStill;
@property (strong, nonatomic) FixedHeightDownsampled *fixedHeightDownsampled;
@property (strong, nonatomic) FixedWidth *fixedWidth;
@property (strong, nonatomic) FixedWidthStill *fixedWidthStill;
@property (strong, nonatomic) FixedWidthDownsampled *fixedWidthDownsampled;
@property (strong, nonatomic) FixedHeightSmall *fixedHeightSmall;
@property (strong, nonatomic) FixedHeightSmallStill *fixedHeightSmallStill;
@property (strong, nonatomic) FixedWidthSmall *fixedWidthSmall;
@property (strong, nonatomic) FixedWidthSmallStill *fixedWidthSmallStill;
@property (strong, nonatomic) Downsized *downsized;
@property (strong, nonatomic) DownsizedStill *downsizedStill;
@property (strong, nonatomic) DownsizedLarge *downsizedLarge;
@property (strong, nonatomic) Original *original;
@property (strong, nonatomic) OriginalStill *originalStill;

@end
