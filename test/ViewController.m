//
//  ViewController.m
//  test
//
//  Created by Anton Minin on 30.11.15.
//  Copyright © 2015 Anton Minin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UISearchBarDelegate>

@property (nonatomic, strong) UIBarButtonItem *searchButton;

@property (nonatomic, strong) UITextField *searchField;

@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.rightBarButtonItem = self.searchButton;
}

- (UIBarButtonItem *)searchButton {
    
    if (_searchButton == nil) {
        UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(actionSearch)];
        _searchButton = searchButton;
    }
    return _searchButton;
}

- (UITextField *)searchField {
    
    if (_searchField == nil) {
        UITextField *searchField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200.f, 30.f)];
        searchField.borderStyle = UITextBorderStyleRoundedRect;
        searchField.text = @"Insert Title Here";
        _searchField = searchField;
    }
    
    return _searchField;
}

- (UISearchBar *)searchBar {
    
    if (_searchBar == nil) {
        UISearchBar *searchBar = [[UISearchBar alloc] init];
        searchBar.showsCancelButton = YES;
        searchBar.delegate = self;
        _searchBar = searchBar;
    }
    
    return _searchBar;
}

- (void)actionSearch {
    
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.titleView = self.searchBar;
    
//    if (self.navigationItem.titleView == nil) {
//        
//    } else {
//        self.navigationItem.titleView = nil;
//    }
}

#pragma mark - UISearchBarDelegate

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    self.navigationItem.titleView = nil;
    self.navigationItem.rightBarButtonItem = self.searchButton;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
