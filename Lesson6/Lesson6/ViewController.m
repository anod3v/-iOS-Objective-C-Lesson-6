//
//  ViewController.m
//  Lesson6
//
//  Created by Andrey on 13/02/2021.
//

// программа калькулятор с применением блоков и очередей

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    double (^multiplyTwoValues)(double, double) =
    ^(double firstValue, double secondValue) {
        return firstValue * secondValue;
    };
    
    dispatch_async(globalQueue, ^{
        double result1 = multiplyTwoValues(2,4);
        NSLog(@"Result1 - %f", result1);
    });
    
    double (^devideTwoValues)(double, double) =
    ^(double firstValue, double secondValue) {
        return firstValue / secondValue;
    };
    dispatch_async(globalQueue, ^{
        double result2 = devideTwoValues(2,4);
        NSLog(@"Result2 - %f", result2);
    });
    
    double (^subtractTwoValues)(double, double) =
    ^(double firstValue, double secondValue) {
        return firstValue - secondValue;
    };
    dispatch_async(globalQueue, ^{
        double result3 = subtractTwoValues(2,4);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Result3 - %f", result3);
        });
    });
    
    double (^sumTwoValues)(double, double) =
    ^(double firstValue, double secondValue) {
        return firstValue + secondValue;
    };
    
    double result4 = sumTwoValues(2,4);
    
    NSLog(@"Result4 - %f", result4);
    
    double (^raiseToPower)(double, double) =
    ^(double firstValue, double power) {
        return (double)pow((double)firstValue, (double)power);
    };
    
    double result5 = raiseToPower(2,4);
    
    NSLog(@"Result5 - %f", result5);
    
    double (^rootOfPower)(double, double) =
    ^(double firstValue, double power) {
        return (double)pow((double)firstValue, 1/(double)power);
    };
    
    double result6 = rootOfPower(2,4);
    
    NSLog(@"Result6 - %f", result6);
}




@end
