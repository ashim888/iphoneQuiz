//
//  queRepo.h
//  betaTest
//
//  Created by ashim888 on 12/4/13.
//  Copyright (c) 2013 com.uis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface queRepo : NSObject{
    NSArray *questions;
    //NSInteger *randIndex;
    Boolean response;
    int i;
    NSArray *answer_one;
}

//public methods

-(NSString *) questionCollection;

-(NSString *) answerCollection;

-(NSString *) correctAnswer;

-(int) randIndex;

@end
