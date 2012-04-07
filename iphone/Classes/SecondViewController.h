//
//  SecondViewController.h
//  einSwitch003
//
//  Created by Olivia Bornstein on 3/30/12.
//  Copyright 2012 Hoover Middle School. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SecondViewController : UIViewController {
	IBOutlet UILabel* label;
	IBOutlet UILabel* event2label;
	IBOutlet UILabel* event3label;
	
	UIImageView *myImageE11;
	UIImageView *myImageE12;
	UIImageView *myImageH11;
	UIImageView *myImageH12;
	UIImageView *myImageE21;
	UIImageView *myImageE22;
	UIImageView *myImageH21;
	UIImageView *myImageH22;
	UIImageView *myImageE31;
	UIImageView *myImageE32;
	
	NSTimer *time;	
	NSMutableData* responseData;
	
}

@property (retain, nonatomic) NSMutableData* responseData;
@property (retain, nonatomic) UILabel* event2label;
@property (retain, nonatomic) UILabel* event3label;
@property (retain, nonatomic) UILabel* event1label;

-(IBAction)fetchInfo;

@end
