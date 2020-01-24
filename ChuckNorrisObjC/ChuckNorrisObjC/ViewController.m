//
//  ViewController.m
//  ChuckNorrisObjC
//
//  Created by Maria Luiza Carvalho Sperotto on 23/01/20.
//  Copyright © 2020 Maria Luiza Carvalho Sperotto. All rights reserved.
//

#import "ViewController.h"
#import <ChuckNorrisObjC-Swift.h>


@interface ViewController ()

@property (strong, nonatomic) NSArray *myArray;



@end

@implementation ViewController

NSString *selectedCategory;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    self.navigationItem.title = @"Categories";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    [self fetchCategoryJSON];
    
    
}

-(void)fetchCategoryJSON {
    NSLog(@"Fetching categories");
    NSString *urlString = @"https://api.chucknorris.io/jokes/categories";
    NSURL *url = [NSURL URLWithString:urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString *fetch = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Fetch request: %@", fetch);
        NSError *err;
        
        NSArray *categories = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        self.myArray = categories;
        
        if (err) {
            NSLog(@"Failed to serialized into JSON: %@", err);
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }] resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _myArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString *category = _myArray[indexPath.row];
    cell.textLabel.text = category;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *category = _myArray[indexPath.row];
    selectedCategory = category;
    DetailViewController *detailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"detailSegue"];
    detailVC.selectedCategory = selectedCategory;
    [self presentViewController:detailVC animated:YES completion:nil];
    
    
    

   
    
    

    
    
}


@end
