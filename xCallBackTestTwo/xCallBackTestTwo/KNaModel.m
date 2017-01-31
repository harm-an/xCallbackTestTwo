//
//  KNaModel.m
//  xCallBackTestTwo
//
//  Created by Harman on 18/01/17.
//  Copyright © 2017 Harman. All rights reserved.
//

#import "KNaModel.h"

@implementation KNaModel
    
-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }else {
        self.potassium = @"21";
        self.sodium = @"29";
        return self;
    }
    
}


@end
