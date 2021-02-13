//
//  ViewController.m
//  Lesson6
//
//  Created by Andrey on 13/02/2021.
//

#import "ViewController.h"

@interface ViewController ()

typedef int(^SquareBlock)(int);

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    SquareBlock square = ^(int number) {
        return number * number;
    };

    dispatch_async(mainQueue, ^{
        int result = square(3);
        NSLog(@"Result - %i", result); // Result - 9
    });
}

        
        
        


@end
