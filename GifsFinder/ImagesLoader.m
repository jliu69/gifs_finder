//
//  ImagesLoader.m
//  GifsFinder
//
//  Created by Johnson Liu on 9/10/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import "ImagesLoader.h"
#import <RestKit/RestKit.h>
#import "GifObject.h"
#import "ImageObjects.h"

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


@interface ImagesLoader()

@end


@implementation ImagesLoader

@synthesize delegate;

- (void)gifsWithLink:(NSString *)link {
    
    if (link == nil || link.length == 0)
        return;
    
    
    //-- image sublevel mapping
    
    RKObjectMapping *fixedHeightMapping = [RKObjectMapping mappingForClass:[FixedHeight class]];
    [fixedHeightMapping addAttributeMappingsFromDictionary:@{@"url":@"url", @"width":@"width", @"height":@"height", @"size":@"size", @"mp4":@"mp4", @"mp4_size":@"mp4Size", @"webp":@"webp", @"webp_size":@"webpSize"}];
    
    RKObjectMapping *fixedHeightStillMapping = [RKObjectMapping mappingForClass:[FixedHeightStill class]];
    [fixedHeightStillMapping addAttributeMappingsFromDictionary:@{@"url":@"url", @"width":@"width", @"height":@"height"}];
    
    RKObjectMapping *fixedHeightDownsampledMapping = [RKObjectMapping mappingForClass:[FixedHeightDownsampled class]];
    [fixedHeightDownsampledMapping addAttributeMappingsFromDictionary:@{@"url":@"url", @"width":@"width", @"height":@"height", @"size":@"size", @"webp":@"webp", @"webp_size":@"webpSize"}];
    
    RKObjectMapping *fixedWidthMapping = [RKObjectMapping mappingForClass:[FixedWidth class]];
    [fixedWidthMapping addAttributeMappingsFromDictionary:@{@"url":@"url", @"width":@"width", @"height":@"height", @"size":@"size", @"mp4":@"mp4", @"mp4_size":@"mp4Size", @"webp":@"webp", @"webp_size":@"webpSize"}];
    
    RKObjectMapping *fixedWidthStillMapping = [RKObjectMapping mappingForClass:[FixedWidthStill class]];
    [fixedWidthStillMapping addAttributeMappingsFromDictionary:@{@"url":@"url", @"width":@"width", @"height":@"height"}];
    
    RKObjectMapping *fixedWidthDownsampledMapping = [RKObjectMapping mappingForClass:[FixedWidthDownsampled class]];
    [fixedWidthDownsampledMapping addAttributeMappingsFromDictionary:@{@"url":@"url", @"width":@"width", @"height":@"height", @"size":@"size", @"webp":@"webp", @"webp_size":@"webpSize"}];
    
    RKObjectMapping *fixedHeightSmallMapping = [RKObjectMapping mappingForClass:[FixedHeightSmall class]];
    [fixedHeightSmallMapping addAttributeMappingsFromDictionary:@{@"url":@"url", @"width":@"width", @"height":@"height", @"size":@"size", @"webp":@"webp", @"webp_size":@"webpSize"}];
    
    RKObjectMapping *fixedHeightSmallStillMapping = [RKObjectMapping mappingForClass:[FixedHeightSmallStill class]];
    [fixedHeightSmallStillMapping addAttributeMappingsFromDictionary:@{@"url":@"url", @"width":@"width", @"height":@"height"}];
    
    RKObjectMapping *fixedWidthSmallMapping = [RKObjectMapping mappingForClass:[FixedWidthSmall class]];
    [fixedWidthSmallMapping addAttributeMappingsFromDictionary:@{@"url":@"url", @"width":@"width", @"height":@"height", @"size":@"size", @"webp":@"webp", @"webp_size":@"webpSize"}];
    
    RKObjectMapping *fixedWidthSmallStillMapping = [RKObjectMapping mappingForClass:[FixedWidthSmallStill class]];
    [fixedWidthSmallStillMapping addAttributeMappingsFromDictionary:@{@"url":@"url", @"width":@"width", @"height":@"height"}];
    
    RKObjectMapping *downsizedMapping = [RKObjectMapping mappingForClass:[Downsized class]];
    [downsizedMapping addAttributeMappingsFromDictionary:@{@"url":@"url", @"width":@"width", @"height":@"height", @"size":@"size"}];
    
    RKObjectMapping *downsizedStillMapping = [RKObjectMapping mappingForClass:[DownsizedStill class]];
    [downsizedStillMapping addAttributeMappingsFromDictionary:@{@"url":@"url", @"width":@"width", @"height":@"height"}];
    
    RKObjectMapping *downsizedLargeMapping = [RKObjectMapping mappingForClass:[DownsizedLarge class]];
    [downsizedLargeMapping addAttributeMappingsFromDictionary:@{@"url":@"url", @"width":@"width", @"height":@"height", @"size":@"size"}];
    
    RKObjectMapping *originalMapping = [RKObjectMapping mappingForClass:[Original class]];
    [originalMapping addAttributeMappingsFromDictionary:@{@"url":@"url", @"width":@"width", @"height":@"height", @"size":@"size", @"frames":@"frames", @"mp4":@"mp4", @"mp4_size":@"mp4Size", @"webp":@"webp", @"webp_size":@"webpSize"}];
    
    RKObjectMapping *originalStillMapping = [RKObjectMapping mappingForClass:[OriginalStill class]];
    [originalStillMapping addAttributeMappingsFromDictionary:@{@"url":@"url", @"width":@"width", @"height":@"height"}];
    
    
    //-- image array mapping
    
    RKObjectMapping *gifsMapping = [RKObjectMapping mappingForClass:[ImageObjects class]];
    [gifsMapping addAttributeMappingsFromDictionary:@{}];
    
    [gifsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"fixed_height" toKeyPath:@"fixedHeight" withMapping:fixedHeightMapping]];
    
    [gifsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"fixed_height_still" toKeyPath:@"fixedHeighStill" withMapping:fixedHeightStillMapping]];
    
    [gifsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"fixed_height_downsampled" toKeyPath:@"fixedHeightDownsampled" withMapping:fixedHeightDownsampledMapping]];
    
    [gifsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"fixed_width" toKeyPath:@"fixedWidth" withMapping:fixedWidthMapping]];
    
    [gifsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"fixed_width_still" toKeyPath:@"fixedWidthStill" withMapping:fixedWidthStillMapping]];
    
    [gifsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"fixed_width_downsampled" toKeyPath:@"fixedWidthDownsampled" withMapping:fixedWidthDownsampledMapping]];
    
    [gifsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"fixed_height_small" toKeyPath:@"fixedHeightSmall" withMapping:fixedHeightSmallMapping]];
    
    [gifsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"fixed_height_small_still" toKeyPath:@"fixedHeightSmallStill" withMapping:fixedHeightSmallStillMapping]];
    
    [gifsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"fixed_width_small" toKeyPath:@"fixedWidthSmall" withMapping:fixedWidthSmallMapping]];
    
    [gifsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"fixed_width_small_still" toKeyPath:@"fixedWidthSmallStill" withMapping:fixedWidthSmallStillMapping]];
    
    [gifsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"downsized" toKeyPath:@"downsized" withMapping:downsizedMapping]];
    
    [gifsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"downsized_still" toKeyPath:@"downsizedStill" withMapping:downsizedStillMapping]];
    
    [gifsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"downsized_large" toKeyPath:@"downsizedLarge" withMapping:downsizedLargeMapping]];
    
    [gifsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"original" toKeyPath:@"original" withMapping:originalMapping]];
    
    [gifsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"original_still" toKeyPath:@"originalStill" withMapping:originalStillMapping]];
    
    
    //-- top level mapping
    
    RKObjectMapping *dataMapping = [RKObjectMapping mappingForClass:[GifObject class]];
    [dataMapping addAttributeMappingsFromDictionary:@{@"type":@"type", @"id":@"imageId", @"url":@"url", @"bitly_gif_url":@"bitlyGifUrl", @"bitly_url":@"bitlyUrl", @"embed_url":@"embedUrl", @"username":@"userName",@"source":@"source", @"rating":@"rating", @"caption":@"caption", @"content_url":@"contentUrl", @"import_datetime":@"importDate", @"trending_datetime":@"trendingDate"}];
    
    [dataMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"images" toKeyPath:@"imagesData" withMapping:gifsMapping]];

    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:dataMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"data" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    NSURL *URL = [NSURL URLWithString:link];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ responseDescriptor ]];
    
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        
        [self.delegate didReceiveImagesArray:mappingResult.array];
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        
        RKLogError(@"Operation failed with error: %@", error);
        
    }];
    
    [objectRequestOperation start];
}


@end

