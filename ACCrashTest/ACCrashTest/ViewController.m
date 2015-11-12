//
//  ViewController.m
//  ACCrashTest
//
//  Created by Ashley Cabico on 12/11/2015.
//  Copyright © 2015 Ashley Cabico. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSUInteger, CrashType) {
    CrashTypeInfiniteLoop,
    CrashTypeOutOfBounds,
    CrashTypeMemoryLeak,
    CrashTypeAssertionFailure,
    CrashTypeUnrecognizedSelector
};

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *crashListTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"Received memory warning");
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods

- (void)infiniteLoop {
    //NSLog(@"Infinite loop");
    
    [self infiniteLoop];
}

- (void)outOfBounds {
    NSLog(@"Out of bounds");
    
    NSArray *strings = @[@"a", @"b"];
    NSString *c = strings[2];
}

- (void)memoryLeak {
    NSLog(@"Memory leak");
    
    NSMutableArray *arrays = [NSMutableArray array];
    while (true) {
        [arrays addObject:@[@"a"]];
    }
}

- (void)assertionFailure {
    NSLog(@"Assertion failure");
    
    int number = 6;
    NSAssert(number == 1, @"number must equal 1");
}

- (void)unrecognizedSelector {
    NSLog(@"Unrecognized selector");
    
    id string = @"a";
    int i = [string count];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case CrashTypeInfiniteLoop: cell.textLabel.text = @"Infinite Loop"; break;
        case CrashTypeOutOfBounds: cell.textLabel.text = @"Out of Bounds"; break;
        case CrashTypeMemoryLeak: cell.textLabel.text = @"Memory Leak"; break;
        case CrashTypeAssertionFailure: cell.textLabel.text = @"Assertion Failure"; break;
        case CrashTypeUnrecognizedSelector: cell.textLabel.text = @"Unrecognized Selector"; break;
        default: cell.textLabel.text = @"Undefined Type"; break;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case CrashTypeInfiniteLoop: [self infiniteLoop]; break;
        case CrashTypeOutOfBounds: [self outOfBounds]; break;
        case CrashTypeMemoryLeak: [self memoryLeak]; break;
        case CrashTypeAssertionFailure: [self assertionFailure]; break;
        case CrashTypeUnrecognizedSelector: [self unrecognizedSelector]; break;
        default: break;
    }
}

@end
