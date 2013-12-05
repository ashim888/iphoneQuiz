//
//  ViewController.h
//  betaTest
//
//  Created by ashim888 on 12/3/13.
//  Copyright (c) 2013 com.uis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{

    IBOutlet UILabel *questionLabel;
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *point;
    NSArray *question;
    NSMutableArray *answer_0;
    NSMutableArray *answer_1;
    NSMutableArray *answer_2;
    
    NSMutableArray *answer_3;
    NSMutableArray *answer_4;
    
    NSMutableArray *answer_5;
    NSMutableArray *answer_6;
    
    NSMutableArray *answer_7;
    NSMutableArray *answer_8;
    
    NSMutableArray *answer_9;
    NSMutableArray *answer_10;
    
    NSMutableArray *answer_11;
    NSMutableArray *answer_12;
    
    
    NSMutableArray *answer_13;
    NSMutableArray *answer_14;
    
    NSMutableArray *answer_15;
    NSMutableArray *answer_16;
    NSMutableArray *answer_17;
    NSMutableArray *answer_18;
    NSMutableArray *answer_19;
    NSMutableArray *answer_20;
    NSMutableArray *answer_21;
    
    
    int indexValue;
    NSMutableArray *tet;
    IBOutlet UIButton *buttonA;
    IBOutlet UIButton *buttonB;
    IBOutlet UIButton *buttonC;
    IBOutlet UIButton *buttonD;
}


-(IBAction)optA;
-(IBAction)optB;
-(IBAction)optC;
-(IBAction)optD;

-(void) ansChoice;

@end
