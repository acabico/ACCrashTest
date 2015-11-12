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
    CrashTypeRetainCycle,
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
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods

- (void)infiniteLoop {
    
}

- (void)outOfBounds {
    NSArray *strings = @[@"a", @"b"];
    NSString *c = strings[2];
}

- (void)memoryLeak {
    
}

- (void)retainCycle {
    
}

- (void)assertionFailure {
    int number = 6;
    NSAssert(number == 1, @"number must equal 1");
}

- (void)unrecognizedSelector {
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return sizeof(CrashType);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case CrashTypeInfiniteLoop: cell.textLabel.text = @"Infinite Loop"; break;
        case CrashTypeOutOfBounds: cell.textLabel.text = @"Out of Bounds"; break;
        case CrashTypeMemoryLeak: cell.textLabel.text = @"Memory Leak"; break;
        case CrashTypeRetainCycle: cell.textLabel.text = @"Retain Cycle"; break;
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
        case CrashTypeRetainCycle: [self retainCycle]; break;
        case CrashTypeAssertionFailure: [self assertionFailure]; break;
        case CrashTypeUnrecognizedSelector: [self unrecognizedSelector]; break;
        default: break;
    }
}

@end
