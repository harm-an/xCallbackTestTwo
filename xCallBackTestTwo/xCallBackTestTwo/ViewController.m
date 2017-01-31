//
//  ViewController.m
//  xCallBackTestTwo
//
//  Created by Harman on 18/01/17.
//  Copyright © 2017 Harman. All rights reserved.
//

#import "ViewController.h"
#import "KNaModel.h"
#import "IACClient.h"
#include "UIView+Toast.h"

@interface ViewController ()

@end

@implementation ViewController
UIGestureRecognizer *tapper;


- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.kLabel = [[UICountingLabel alloc]init];
//    self.naLabel = [[UICountingLabel alloc]init];
    
    tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];
    [self.v.layer setCornerRadius:0.0f];
    [self.update.layer setCornerRadius:5.0f];
    [self.fetch.layer setCornerRadius:5.0f];
    
    self.potassium.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"potassium"];
    [self.kLabel countFrom:0 to:30.0 withDuration:4];
    self.sodium.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"sodium"];
    [self.naLabel countFrom:0 to:40.0 withDuration:3];
    
    self.fetchedPotassium.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"fetchedPotassium"];
    self.fetchedSodium.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"fetchedSodium"];
    // drop shadow
    
    [UIView animateWithDuration:3 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.4 options:nil animations:^{
        [self.v.layer setShadowColor:[UIColor blackColor].CGColor];
        [self.v.layer setShadowOpacity:0.8];
        [self.v.layer setShadowRadius:3.0];
        [self.v.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
        
        [self.update.layer setShadowColor:[UIColor blackColor].CGColor];
        [self.update.layer setShadowOpacity:0.8];
        [self.update.layer setShadowRadius:3.0];
        [self.update.layer setShadowOffset:CGSizeMake(1.0, 1.0)];
        
        [self.fetch.layer setShadowColor:[UIColor blackColor].CGColor];
        [self.fetch.layer setShadowOpacity:0.8];
        [self.fetch.layer setShadowRadius:3.0];
        [self.fetch.layer setShadowOffset:CGSizeMake(1.0, 1.0)];
    } completion:^(BOOL finished) {
        NSLog(@"completed");
    }];
    
   
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:(BOOL)animated];
    
    
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateViewNew) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)updateView:(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults] setObject:_fetchedPotassium.text forKey:@"fetchedPotassium"];
    [[NSUserDefaults standardUserDefaults] setObject:_fetchedSodium.text forKey:@"fetchedSodium"];

    NSDictionary *values = @{@"potassium":_fetchedPotassium.text, @"sodium":_fetchedSodium.text};
    IACClient *client = [[IACClient alloc] initWithURLScheme:@"iamtestOne"];
    [client performAction:@"update" parameters:values];
}
- (IBAction)test:(UIButton *)sender {
    IACClient *client = [[IACClient alloc] initWithURLScheme:@"iamtestOne"];
    [client performAction:nil parameters:nil onSuccess:^(NSDictionary *result) {
        NSLog(@"Harman Hello");
    } onFailure:nil];
}

-(void)updateViewNew{
    [self viewDidLoad];
}

- (IBAction)fetchValues:(UIButton *)sender {
    IACClient *client = [[IACClient alloc] initWithURLScheme:@"iamtestOne"];
    [client performAction:@"allowFetch"];
}
- (IBAction)allowUpdate:(UISwitch *)sender {
    BOOL state = [sender isOn];
    if(state){
        self.fetchedPotassium.enabled = YES;
        self.fetchedSodium.enabled = YES;
        self.update.enabled = YES;
        CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle];
        
        [self.v makeToast:@"You can now update the values" duration:3.0 position:CSToastPositionBottom style:style];
    }else{
        self.fetchedPotassium.enabled = NO;
        self.fetchedSodium.enabled = NO;
        self.update.enabled = NO;
    }
    
}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.v endEditing:YES];
}


@end
