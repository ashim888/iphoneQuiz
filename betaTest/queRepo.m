//
//  queRepo.m
//  betaTest
//
//  Created by ashim888 on 12/4/13.
//  Copyright (c) 2013 com.uis. All rights reserved.
//

#import "queRepo.h"

@implementation queRepo

-(NSString *) questionCollection{
    i =arc4random()%20;
    
    questions =@[
              
                 @"Arctic regions are home to which of these animals?",
                 @"A particularly easy target is said to be a duck that's doing what?",
                 @"How many hours are there in a day?",
                 @"What is the first name of ALP leader Latham?",
                 @"Which of these is an Australian state?",
                 @"Which of these countries lies in the Southern Hemisphere?",
                 @"Something that fails dismally is said to go down like a lead what?",
                 @"What kind of geographical feature is Everest?",
                 @"Which Australian coin is twelve-sided?",
                 @"Who was the British monarch at the turn of the millennium?",
                 @"Colgate is a top-selling brand of what?",//10
                 @"A device common in computers is the hard what?",
                 @"Which of these animals has webbed feet?",
                 @"Traditionally cut by the bride and bridegroom at a wedding reception is the wedding what?",
                 @"To turn something minor into a major problem is to make a mountain out of a what?",
                 @"A dance for four couples is a what dance?",
                 @"A casino is a place for principally what activity?",
                 @"To be calm and unruffled is to be as cool as a what?",
                 @"A standard egg carton can hold how many eggs?",
                 @"Which of these is also a carousel?"];
    
    
    
    return questions[i];
    
}
-(int) randIndex{
    int arrayIndex=i;
    
    return arrayIndex;
}

-(NSString *) answerCollection{

    int randval=i;
    
    answer_one=@[@"Polar bear",
                @"Sitting", @"24", @"Mark", @"South Australia", @"Australia", @"Balloon",@"Mountain",@"50-cent",@"Elizabeth II",@"Toothpaste",@"Drive",@"Duck",@"Cake",@"Square",@"Gambling",@"Cucumber",@"12",@"Merry-go-round"];
    return answer_one[i];
}



-(NSString *) correctAnswer{
    
}
 
 
@end
