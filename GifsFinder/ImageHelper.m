//
//  ImageHelper.m
//  GifsFinder
//
//  Created by Johnson Liu on 9/10/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import "ImageHelper.h"
#import <QuartzCore/QuartzCore.h>
#import "GifObject.h"
#import "ImageObjects.h"
#import "GifsItem.h"

#import "FixedHeight.h"
#import "FixedHeightStill.h"
#import "FixedHeightDownsampled.h"
#import "FixedWidth.h"
#import "FixedWidthStill.h"
#import "FixedWidthDownsampled.h"
#import "FixedHeightSmall.h"
#import "FixedHeightSmallStill.h"
#import "FixedWidthSmall.h"
#import "FixedWidthSmallStill.h"
#import "Downsized.h"
#import "DownsizedStill.h"
#import "DownsizedLarge.h"
#import "Original.h"
#import "OriginalStill.h"


@implementation ImageHelper

- (NSArray *)displayImageListFrom:(NSArray *)imagesArray {
    
    if (imagesArray == nil || imagesArray.count == 0)
        return nil;
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (GifObject *gifObject in imagesArray) {
        
        FixedHeightStill *aFixHeightStill = gifObject.imagesData.fixedHeighStill;
        UIImage *anImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:aFixHeightStill.url]]];
        
        NSString *imageId = [gifObject imageId];
        
        NSDictionary *item = [NSDictionary dictionaryWithObjectsAndKeys:anImage, @"image", imageId, @"imageId", nil];
        [mutableArray addObject:item];
    }
    
    return [NSArray arrayWithArray:mutableArray];
}

- (NSArray *)detailsFromImage:(GifObject *)selectedGif {
    
    if (selectedGif == nil) {
        return [NSArray array];
    }
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithCapacity:0];
    GifsItem *gifsItem = nil;
    
    FixedHeight *fixedHeight = selectedGif.imagesData.fixedHeight;
    gifsItem = [GifsItem new];
    gifsItem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:fixedHeight.url]]];
    gifsItem.styleName = @"Fixed Height";
    gifsItem.width = (CGFloat)fixedHeight.width.floatValue;
    gifsItem.height = (CGFloat)fixedHeight.height.floatValue;
    [mutableArray addObject:gifsItem];
    
    FixedHeightStill *fixHeightStill = selectedGif.imagesData.fixedHeighStill;
    gifsItem = nil;
    gifsItem = [GifsItem new];
    gifsItem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:fixHeightStill.url]]];
    gifsItem.styleName = @"Fixed Height Still";
    gifsItem.width = (CGFloat)fixHeightStill.width.floatValue;
    gifsItem.height = (CGFloat)fixHeightStill.height.floatValue;
    [mutableArray addObject:gifsItem];
    
    FixedHeightDownsampled *fixedHeightDownsampled = selectedGif.imagesData.fixedHeightDownsampled;
    gifsItem = nil;
    gifsItem = [GifsItem new];
    gifsItem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:fixedHeightDownsampled.url]]];
    gifsItem.styleName = @"Fixed Height Downsampled";
    gifsItem.width = (CGFloat)fixedHeightDownsampled.width.floatValue;
    gifsItem.height = (CGFloat)fixedHeightDownsampled.height.floatValue;
    [mutableArray addObject:gifsItem];
    
    FixedWidth *fixedWidth = selectedGif.imagesData.fixedWidth;
    gifsItem = nil;
    gifsItem = [GifsItem new];
    gifsItem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:fixedWidth.url]]];
    gifsItem.styleName = @"Fixed Width";
    gifsItem.width = (CGFloat)fixedWidth.width.floatValue;
    gifsItem.height = (CGFloat)fixedWidth.height.floatValue;
    [mutableArray addObject:gifsItem];
    
    FixedWidthStill *fixedWidthStill = selectedGif.imagesData.fixedWidthStill;
    gifsItem = nil;
    gifsItem = [GifsItem new];
    gifsItem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:fixedWidthStill.url]]];
    gifsItem.styleName = @"Fixed Width Still";
    gifsItem.width = (CGFloat)fixedWidthStill.width.floatValue;
    gifsItem.height = (CGFloat)fixedWidthStill.height.floatValue;
    [mutableArray addObject:gifsItem];
    
    FixedWidthDownsampled *fixedWidthDownsampled = selectedGif.imagesData.fixedWidthDownsampled;
    gifsItem = nil;
    gifsItem = [GifsItem new];
    gifsItem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:fixedWidthDownsampled.url]]];
    gifsItem.styleName = @"Fixed Width Downsampled";
    gifsItem.width = (CGFloat)fixedWidthDownsampled.width.floatValue;
    gifsItem.height = (CGFloat)fixedWidthDownsampled.height.floatValue;
    [mutableArray addObject:gifsItem];
    
    FixedHeightSmall *fixedHeightSmall = selectedGif.imagesData.fixedHeightSmall;
    gifsItem = nil;
    gifsItem = [GifsItem new];
    gifsItem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:fixedHeightSmall.url]]];
    gifsItem.styleName = @"Fixed Height Small";
    gifsItem.width = (CGFloat)fixedHeightSmall.width.floatValue;
    gifsItem.height = (CGFloat)fixedHeightSmall.height.floatValue;
    [mutableArray addObject:gifsItem];
    
    FixedHeightSmallStill *fixedHeightSmallStill = selectedGif.imagesData.fixedHeightSmallStill;
    gifsItem = nil;
    gifsItem = [GifsItem new];
    gifsItem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:fixedHeightSmallStill.url]]];
    gifsItem.styleName = @"Fixed Height Small Still";
    gifsItem.width = (CGFloat)fixedHeightSmallStill.width.floatValue;
    gifsItem.height = (CGFloat)fixedHeightSmallStill.height.floatValue;
    [mutableArray addObject:gifsItem];
    
    FixedWidthSmall *fixedWidthSmall = selectedGif.imagesData.fixedWidthSmall;
    gifsItem = nil;
    gifsItem = [GifsItem new];
    gifsItem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:fixedWidthSmall.url]]];
    gifsItem.styleName = @"Fixed Width Small";
    gifsItem.width = (CGFloat)fixedWidthSmall.width.floatValue;
    gifsItem.height = (CGFloat)fixedWidthSmall.height.floatValue;
    [mutableArray addObject:gifsItem];
    
    FixedWidthSmallStill *fixedWidthSmallStill = selectedGif.imagesData.fixedWidthSmallStill;
    gifsItem = nil;
    gifsItem = [GifsItem new];
    gifsItem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:fixedWidthSmallStill.url]]];
    gifsItem.styleName = @"Fixed Width Small Still";
    gifsItem.width = (CGFloat)fixedWidthSmallStill.width.floatValue;
    gifsItem.height = (CGFloat)fixedWidthSmallStill.height.floatValue;
    [mutableArray addObject:gifsItem];
    
    Downsized *downsized = selectedGif.imagesData.downsized;
    gifsItem = nil;
    gifsItem = [GifsItem new];
    gifsItem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:downsized.url]]];
    gifsItem.styleName = @"Downsized";
    gifsItem.width = (CGFloat)downsized.width.floatValue;
    gifsItem.height = (CGFloat)downsized.height.floatValue;
    [mutableArray addObject:gifsItem];
    
    DownsizedStill *downsizedStill = selectedGif.imagesData.downsizedStill;
    gifsItem = nil;
    gifsItem = [GifsItem new];
    gifsItem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:downsizedStill.url]]];
    gifsItem.styleName = @"Downsized Still";
    gifsItem.width = (CGFloat)downsizedStill.width.floatValue;
    gifsItem.height = (CGFloat)downsizedStill.height.floatValue;
    [mutableArray addObject:gifsItem];
    
    DownsizedLarge *downsizedLarge = selectedGif.imagesData.downsizedLarge;
    gifsItem = nil;
    gifsItem = [GifsItem new];
    gifsItem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:downsizedLarge.url]]];
    gifsItem.styleName = @"Downsized Large";
    gifsItem.width = (CGFloat)downsizedLarge.width.floatValue;
    gifsItem.height = (CGFloat)downsizedLarge.height.floatValue;
    [mutableArray addObject:gifsItem];
    
    Original *original = selectedGif.imagesData.original;
    gifsItem = nil;
    gifsItem = [GifsItem new];
    gifsItem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:original.url]]];
    gifsItem.styleName = @"Original";
    gifsItem.width = (CGFloat)original.width.floatValue;
    gifsItem.height = (CGFloat)original.height.floatValue;
    [mutableArray addObject:gifsItem];
    
    OriginalStill *originalStill = selectedGif.imagesData.originalStill;
    gifsItem = nil;
    gifsItem = [GifsItem new];
    gifsItem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:originalStill.url]]];
    gifsItem.styleName = @"Original Still";
    gifsItem.width = (CGFloat)originalStill.width.floatValue;
    gifsItem.height = (CGFloat)originalStill.height.floatValue;
    [mutableArray addObject:gifsItem];
    
    return [NSArray arrayWithArray:mutableArray];
}

@end

