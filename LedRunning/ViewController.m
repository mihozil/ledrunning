//
//  ViewController.m
//  LedRunning
//
//  Created by Apple on 12/24/15.
//  Copyright (c) 2015 AMOSC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    int widthnumber;
    int heightnumber;
    CGFloat d;
    CGFloat margin;
}
- (void) initproject{
    d=24;
    margin=30;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initproject];
    
    [self countwidthnumber];
    [self countheightnumber];
    int i;
    
    
    CGFloat space =[self countspace:widthnumber withlength:self.view.bounds.size.width];
    for (i=1;i<=heightnumber;i++){
            CGFloat y = margin + (i-1)*space;
        [self drawrowofballs:y];
        
    };

    
}
- (void) drawrowofballs: (CGFloat) y{
    int i;
    CGFloat space = [self countspace:widthnumber withlength:self.view.bounds.size.width];
    
    for (i=1; i<=widthnumber; i++){
        CGFloat x= margin+ (i-1) * space;
        
        [self placeballatx:x andy:y];
        
    }
}

- (void) placeballatx:(CGFloat)x andy:(CGFloat)y{
    UIImageView *ball= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"black"]];
    ball.center = CGPointMake(x, y);
    
    [self.view addSubview:ball];
}

- (void) countheightnumber {
    heightnumber = 3;
    CGFloat currentspace = [self countspace:heightnumber+1 withlength:self.view.bounds.size.height];
    while (currentspace>d+3){
        heightnumber++;
        currentspace = [self countspace:heightnumber+1 withlength:self.view.bounds.size.height];
    }
    
}
- (void) countwidthnumber {
    widthnumber = 3;
    CGFloat currentspace = [self countspace:widthnumber+1 withlength:self.view.bounds.size.width];
    while (currentspace>d+3) {
        widthnumber++;
        currentspace = [self countspace:widthnumber+1 withlength:self.view.bounds.size.width];
     //   NSLog(@"%f %f",currentspace,d);
    }
   
}
- (CGFloat) countspace:(int) index withlength: (float) length{
    
    return( (length - 2*margin)/( (float)index -1 ) );
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
