//
//  ImagesLoader.h
//  GifsFinder
//
//  Created by Johnson Liu on 9/10/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ImagesLoaderDelegate <NSObject>
- (void)didReceiveImagesArray:(NSArray *)array;
@end


@interface ImagesLoader : NSObject

@property (weak, nonatomic) id<ImagesLoaderDelegate> delegate;

- (void)gifsWithLink:(NSString *)link;

@end
