//
//  ViewController.h
//  xCallBackTestTwo
//
//  Created by Harman on 18/01/17.
//  Copyright © 2017 Harman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICountingLabel.h"

@interface ViewController : UIViewController
    @property (weak, nonatomic) IBOutlet UIView *v;
@property (weak, nonatomic) IBOutlet UITextField *potassium;
@property (weak, nonatomic) IBOutlet UITextField *sodium;
@property (weak, nonatomic) IBOutlet UIButton *fetch;
@property (weak, nonatomic) IBOutlet UITextField *fetchedPotassium;
@property (weak, nonatomic) IBOutlet UITextField *fetchedSodium;

    @property (weak, nonatomic) IBOutlet UIButton *update;
@property (strong, nonatomic) IBOutlet UICountingLabel *kLabel;

@property (strong, nonatomic) IBOutlet UICountingLabel *naLabel;

-(void) updateView;

@end

