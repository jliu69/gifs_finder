//
//  HomePageViewController.h
//  GifsFinder
//
//  Created by Johnson Liu on 9/9/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagesLoader.h"

@interface HomePageViewController : UIViewController <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate, ImagesLoaderDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *processingView;
@property (weak, nonatomic) IBOutlet UILabel *noImageMessageLabel;

@end
