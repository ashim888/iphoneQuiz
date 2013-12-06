//
//  ViewController.m
//  betaTest
//
//  Created by DaiBhanDai on 12/3/13.
//  Copyright (c) 2013 com.uis. All rights reserved.
//

#import "ViewController.h"

#import "queRepo.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad{


    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //[self.view sendSubviewToBack:line1];
    //[self.view sendSubviewToBack:line2];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile.png"]];
    scoreLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    mainScore.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    
    [self.view sendSubviewToBack:imageView];
    //Sound Crap
    NSString *WinnerPath= [[NSBundle mainBundle] pathForResource:@"WINNER" ofType:@"WAV"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:WinnerPath],&WinSoundId);
    
    NSString *LooserPath= [[NSBundle mainBundle] pathForResource:@"LoserHorns" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:LooserPath],&LooserSoundId);
    
    [self setupGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupGame{
    //count=0;
    [point setText:@"Correct"];
    [point setHidden:YES];
    queRepo *queRepoClass =[[queRepo alloc] init];
    
    questionLabel.text= queRepoClass.questionCollection;
    indexValue= queRepoClass.randIndex;
    
    self.ansChoice;
    
    //keep track of correct answer
    correctAns=queRepoClass.answerCollection;
    if (count==500) {
        [self winner];
    }
}

- (IBAction)optA{
    if ([correctAns isEqual:@"Duck"]||[correctAns isEqual:@"50-cent"]||[correctAns isEqual:@"Balloon"]||[correctAns isEqual:@"Gambling"]||[correctAns isEqual:@"Mark"]) {
        //play sound
        AudioServicesPlaySystemSound(WinSoundId);
        
        if ([point isHidden]) {
            [point setHidden:NO];
            count+=50;
            mainScore.text=[NSString stringWithFormat:@"%i",count];
        
        }
        [self performSelector:@selector(setupGame) withObject:self afterDelay:2.0];
    }
    
    else{
        AudioServicesPlaySystemSound(LooserSoundId);
        count-=50;
        mainScore.text=[NSString stringWithFormat:@"%i",count];
        [point setText:@"GAMEOVER"];
        [point setHidden:NO];
        [self gameOver];
        //[point setHidden:YES];
        
    }
    
    
}
-(IBAction)optB{
    if ([correctAns isEqual:@"Cucumber"]||[correctAns isEqual:@"Cake"]||[correctAns isEqual:@"Elizabeth II"]||[correctAns isEqual:@"South Australia"]||[correctAns isEqual:@"Sitting"]||[correctAns isEqual:@"Polar bear"]) {
        //play sound
        AudioServicesPlaySystemSound(WinSoundId);
        
        if ([point isHidden]) {
            [point setHidden:NO];
            count+=50;
            mainScore.text=[NSString stringWithFormat:@"%i",count];
        }
        [self performSelector:@selector(setupGame) withObject:self afterDelay:2.0];
    }
    else{
        
        //play sound
        AudioServicesPlaySystemSound(LooserSoundId);
        
        count-=50;
        mainScore.text=[NSString stringWithFormat:@"%i",count];
        [point setText:@"GAMEOVER"];
        [point setHidden:NO];
        [self gameOver];
        //[point setHidden:YES];
        
    
    }

    
}

-(IBAction)optC{
    if ([correctAns isEqual:@"24"] ||[correctAns isEqual:@"Australia"] ||[correctAns isEqual:@"Toothpaste"] ||[correctAns isEqual:@"Molehill"] ||[correctAns isEqual:@"12"]) {
        //play sound
        AudioServicesPlaySystemSound(WinSoundId);
        
        if ([point isHidden]) {
            [point setHidden:NO];
            count+=50;
            mainScore.text=[NSString stringWithFormat:@"%i",count];
        }
        [self performSelector:@selector(setupGame) withObject:self afterDelay:2.0];
    }
    else{
        
        //play sound
        AudioServicesPlaySystemSound(LooserSoundId);
        
        count-=50;
        mainScore.text=[NSString stringWithFormat:@"%i",count];
        [point setText:@"GAMEOVER"];
        [point setHidden:NO];
        [self.view setNeedsDisplay];
        [self gameOver];
        
        
    }
}

-(IBAction)optD{
    if ([correctAns isEqual:@"Merry-go-round"]||[correctAns isEqual:@"Mountain"]||[correctAns isEqual:@"Drive"]||[correctAns isEqual:@"Square"]) {
        //play sound
        AudioServicesPlaySystemSound(WinSoundId);
        
        if ([point isHidden]) {
            [point setHidden:NO];
            count+=50;
            mainScore.text=[NSString stringWithFormat:@"%i",count];
        }
        [self performSelector:@selector(setupGame) withObject:self afterDelay:2.0];
    }
    else{
        //play sound
        AudioServicesPlaySystemSound(LooserSoundId);
        
        count-=50;
        mainScore.text=[NSString stringWithFormat:@"%i",count];
        [point setText:@"GAMEOVER"];
        [point setHidden:NO];
        [self gameOver];
        
        
    }
}

-(void)winner{
    UIAlertView *winDialog =[[UIAlertView alloc] initWithTitle:@"You Won" message:@"Do You Want to play again?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [winDialog show];
    
}

-(void)gameOver{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Game Over" message:@"Do You Want To Play Again?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    //mainScore.text=@"0";
    [alert show];
    
    
}
-(void)alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex ==1){
        mainScore.text=@"0";
        count=0;
        buttonA.enabled=YES;
        buttonB.enabled=YES;
        buttonC.enabled=YES;
        buttonD.enabled=YES;
        //[self viewDidLoad];
        [self setupGame];
    }
    else{
        buttonA.enabled=NO;
        buttonB.enabled=NO;
        buttonC.enabled=NO;
        buttonD.enabled=NO;
        [self performSelector:@selector(gameOver) withObject:self afterDelay:2.5];
    }
    
}
-(void)ansChoice {
    
    int ansIndex= indexValue;
    //NSLog(@"ansIndex=%i",ansIndex);
    
    answer_0=[NSMutableArray arrayWithObjects:@" Indian elephant",@" Polar bear ",@" Mountain lion ",@" Bengal tiger ",nil];
    
    answer_1=[NSMutableArray arrayWithObjects:@"Sewing",@"Sitting",@"Surfing",@"Swimming",nil];
    answer_2=[NSMutableArray arrayWithObjects:@"12",@"18",@"24",@"30",nil];
    
    answer_3=[NSMutableArray arrayWithObjects:@" Mark",@" Mike",@" Mack",@"Mork",nil];
    answer_4=[NSMutableArray arrayWithObjects:@"North Australia",@"South Australia",@" East Australia",@" West Australia",nil];
    answer_5=[NSMutableArray arrayWithObjects:@"Canada",@"Norway",@"Australia",@"Japan",nil];
    answer_6=[NSMutableArray arrayWithObjects:@"Balloon",@"Cloud",@"Feather",@"Pencil",nil];
    answer_7=[NSMutableArray arrayWithObjects:@"River",@"Sea",@"Desert",@"Mountain",nil];
    answer_8=[NSMutableArray arrayWithObjects:@"50-cent",@"20-cent",@"10-cent",@"5-cent",nil];
    answer_9=[NSMutableArray arrayWithObjects:@"Elizabeth I",@"Elizabeth II",@"Elizabeth III",@"Elizabeth IV",nil];
    answer_10=[NSMutableArray arrayWithObjects:@"Ice-cream",@"Coffee",@"Toothpaste",@"Bread",nil];
    answer_11=[NSMutableArray arrayWithObjects:@"Core",@"Cat",@"Rock",@"Drive",nil];
    answer_12=[NSMutableArray arrayWithObjects:@"Duck",@"Horse",@"Cat",@"Elephant",nil];
    answer_13=[NSMutableArray arrayWithObjects:@"Dress",@"Cake",@"Ring",@"Invitation",nil];
    answer_14=[NSMutableArray arrayWithObjects:@"Mousehill",@"Mulehill",@"Molehill",@"Moosehill",nil];
    answer_15=[NSMutableArray arrayWithObjects:@"Hexagon",@"Triangle",@"Pentagon",@"Square",nil];
    answer_16=[NSMutableArray arrayWithObjects:@"Gambling",@"Studying",@"Praying",@"Cooking",nil];
    answer_17=[NSMutableArray arrayWithObjects:@"Cockroach",@"Cucumber",@"Caterpillar",@"Cumquat",nil];
    answer_18=[NSMutableArray arrayWithObjects:@"8",@"10",@"12",@"14",nil];
    answer_19=[NSMutableArray arrayWithObjects:@"Big dipper",@"Seesaw",@"Slippery dip",@"Merry-go-round",nil];
    
    
    
    tet=[NSString stringWithFormat:@"answer_%i",indexValue];
    //NSLog(@"answer format: %@",tet);
    
    
    if (ansIndex==0) {
        
        [buttonA setTitle:answer_0[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_0[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_0[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_0[3] forState:UIControlStateNormal];
        
    }
    if (ansIndex==1) {
        
        [buttonA setTitle:answer_1[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_1[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_1[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_1[3] forState:UIControlStateNormal];
        
    }if (ansIndex==2) {
        
        [buttonA setTitle:answer_2[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_2[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_2[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_2[3] forState:UIControlStateNormal];
        
    }if (ansIndex==3) {
        
        [buttonA setTitle:answer_3[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_3[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_3[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_3[3] forState:UIControlStateNormal];
        
    }if (ansIndex==4) {
        
        [buttonA setTitle:answer_4[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_4[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_4[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_4[3] forState:UIControlStateNormal];
        
    }if (ansIndex==5) {
        
        [buttonA setTitle:answer_5[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_5[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_5[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_5[3] forState:UIControlStateNormal];
        
    }if (ansIndex==6) {
        
        [buttonA setTitle:answer_6[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_6[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_6[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_6[3] forState:UIControlStateNormal];
        
    }if (ansIndex==7) {
        
        [buttonA setTitle:answer_7[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_7[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_7[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_7[3] forState:UIControlStateNormal];
        
    }if (ansIndex==8) {
        
        [buttonA setTitle:answer_8[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_8[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_8[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_8[3] forState:UIControlStateNormal];
        
    }if (ansIndex==9) {
        
        [buttonA setTitle:answer_9[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_9[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_9[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_9[3] forState:UIControlStateNormal];
        
    }if (ansIndex==10) {
        
        [buttonA setTitle:answer_10[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_10[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_10[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_10[3] forState:UIControlStateNormal];
        
    }if (ansIndex==11) {
        
        [buttonA setTitle:answer_11[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_11[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_11[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_11[3] forState:UIControlStateNormal];
        
    }if (ansIndex==12) {
        
        [buttonA setTitle:answer_12[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_12[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_12[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_12[3] forState:UIControlStateNormal];
        
    }if (ansIndex==13) {
        
        [buttonA setTitle:answer_13[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_13[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_13[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_13[3] forState:UIControlStateNormal];
        
    }if (ansIndex==14) {
        
        [buttonA setTitle:answer_14[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_14[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_14[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_14[3] forState:UIControlStateNormal];
        
    }if (ansIndex==15) {
        
        [buttonA setTitle:answer_15[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_15[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_15[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_15[3] forState:UIControlStateNormal];
        
    }if (ansIndex==16) {
        
        [buttonA setTitle:answer_16[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_16[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_16[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_16[3] forState:UIControlStateNormal];
        
    }if (ansIndex==17) {
        
        [buttonA setTitle:answer_17[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_17[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_17[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_17[3] forState:UIControlStateNormal];
        
    }if (ansIndex==18) {
        
        [buttonA setTitle:answer_18[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_18[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_18[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_18[3] forState:UIControlStateNormal];
        
    }if (ansIndex==19) {
        
        [buttonA setTitle:answer_19[0] forState:UIControlStateNormal];
        [buttonB setTitle:answer_19[1] forState:UIControlStateNormal];
        [buttonC setTitle:answer_19[2] forState:UIControlStateNormal];
        [buttonD setTitle:answer_19[3] forState:UIControlStateNormal];
        
    }
    
}



@end
