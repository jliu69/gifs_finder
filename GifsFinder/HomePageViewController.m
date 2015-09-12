//
//  HomePageViewController.m
//  GifsFinder
//
//  Created by Johnson Liu on 9/9/15.
//  Copyright (c) 2015 HomeOffice. All rights reserved.
//

#import "HomePageViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ConnectionHelper.h"
#import "ImagesLoader.h"
#import "ImageHelper.h"
#import "HomePageCell.h"
#import "GifObject.h"
#import "ImageDetailsViewController.h"


@interface HomePageViewController ()

@property (strong, nonatomic) ImagesLoader *imageLoader;
@property (strong, nonatomic) NSArray *gifsImageArray;
@property (strong, nonatomic) NSArray *rowsArray;

@end


@implementation HomePageViewController

@synthesize searchBar;
@synthesize tableView;
@synthesize processingView;
@synthesize noImageMessageLabel;

@synthesize imageLoader;
@synthesize gifsImageArray;
@synthesize rowsArray;


#pragma mark - Init

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.noImageMessageLabel.hidden = YES;
    self.rowsArray = [NSArray array];
    
    if (![ConnectionHelper isConnectionAvailable]) {
        [self hideProgressView];
        [self noConnectionMessage];
        return;
    }
    
    self.processingView.layer.cornerRadius = 10;
    self.processingView.clipsToBounds = YES;
    
    //-- load trending images
    NSString *trendingLink = @"http://api.giphy.com/v1/gifs/trending?api_key=dc6zaTOxFJmzC";
    self.imageLoader = [ImagesLoader new];
    self.imageLoader.delegate = self;
    [self.imageLoader gifsWithLink:trendingLink];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - local methods

- (void)showProgressView {
    self.processingView.hidden = NO;
    [self.view bringSubviewToFront:self.processingView];
}

- (void)hideProgressView {
    self.processingView.hidden = YES;
    [self.view sendSubviewToBack:self.processingView];
}

- (void)noConnectionMessage {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:@"There is no Internet connection, please try again when it resumes."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark - image loader delegate

- (void)didReceiveImagesArray:(NSArray *)array {
    
    if (array == nil || array.count == 0)
        self.noImageMessageLabel.hidden = NO;
    
    self.gifsImageArray = [[NSArray alloc] initWithArray:array];
    
    ImageHelper *helper = [ImageHelper new];
    self.rowsArray = [helper displayImageListFrom:self.gifsImageArray];
    
    [self hideProgressView];
    [self.tableView reloadData];
    [self.tableView setContentOffset:CGPointZero animated:YES];
}

#pragma mark - table view source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.rowsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"CellId";
    HomePageCell *cell = (HomePageCell *)[self.tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HomePageCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSDictionary *item = [self.rowsArray objectAtIndex:indexPath.row];
    
    UIImage *gifImage = [item objectForKey:@"image"];
    if (gifImage == nil)
        cell.gifImageView.backgroundColor = [UIColor lightGrayColor];
    else
        cell.gifImageView.image = gifImage;
    
    NSString *imageId = [item objectForKey:@"imageId"];
    if (imageId == nil || imageId.length == 0) imageId = @"(no image)";
    cell.gifDescLabel.text = [NSString stringWithFormat:@"Image ID : %@", imageId];
    
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (![ConnectionHelper isConnectionAvailable]) {
        [self noConnectionMessage];
        return;
    }
    
    ImageDetailsViewController *details = [[ImageDetailsViewController alloc] initWithNibName:@"ImageDetailsViewController" bundle:nil];
    details.selectedGif = [self.gifsImageArray objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:details animated:YES];
}

#pragma mark - search bar delegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    self.searchBar.text = nil;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.searchBar.text = nil;
    [self.searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    self.noImageMessageLabel.hidden = YES;
    
    [self showProgressView];
    [self.searchBar resignFirstResponder];
    
    //-- load searching images
    NSString *searchContent = [self.searchBar.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *searchLink = [NSString stringWithFormat:@"http://api.giphy.com/v1/gifs/search?api_key=dc6zaTOxFJmzC&q=%@", searchContent];
    
    if (self.imageLoader != nil)
        self.imageLoader = nil;
    
    self.imageLoader = [ImagesLoader new];
    self.imageLoader.delegate = self;
    [self.imageLoader gifsWithLink:searchLink];
}


@end

