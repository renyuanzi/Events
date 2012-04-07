//
//  FirstViewController.h
//  einSwitch003
//
//  Created by Olivia Bornstein on 3/30/12.
//  Copyright 2012 Hoover Middle School. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
	IBOutlet UIPickerView  *pickerView;
	NSMutableArray *pickerArray;
	
	NSTimer *time;	
	NSMutableData* responseData;
}

@property (retain, nonatomic) UIPickerView *pickerView;
@property (retain, nonatomic) NSMutableArray *pickerArray;
@property (retain, nonatomic) NSMutableData* responseData;

@end
