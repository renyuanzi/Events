//
//  FirstViewController.m
//  einSwitch003
//
//  Created by Olivia Bornstein on 3/30/12.
//  Copyright 2012 Hoover Middle School. All rights reserved.
//

#import "FirstViewController.h"


@implementation FirstViewController

#define eventURL @"http://mytopic.us/elgg/services/api/rest/json/?method=Event.getInfo&Id=42"

@synthesize responseData;
@synthesize pickerView, pickerArray;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/
-(void)fetchInfo{
	self.responseData = [NSMutableData data];
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:eventURL]];
	[[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[connection release];
	self.responseData = nil;
}

#pragma mark -
#pragma mark Process loan data
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [connection release];
	
	NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	self.responseData = nil;
	
	//NSArray* latestLoans = [(NSDictionary*)[responseString JSONValue] objectForKey:@"loans"];
	NSArray* latestEventStr = [(NSDictionary*)[responseString JSONValue] objectForKey:@"result"];
	[responseString release];
	

	NSString* e11 = [(NSDictionary*)[latestEventStr JSONValue] objectForKey:@"e11"];
	NSString* e12 = [(NSDictionary*)[latestEventStr JSONValue] objectForKey:@"e12"];
	NSString* h11 = [(NSDictionary*)[latestEventStr JSONValue] objectForKey:@"h11"];
	NSString* h12 = [(NSDictionary*)[latestEventStr JSONValue] objectForKey:@"h12"];
	NSString* e21 = [(NSDictionary*)[latestEventStr JSONValue] objectForKey:@"e21"];
	NSString* e22 = [(NSDictionary*)[latestEventStr JSONValue] objectForKey:@"e22"];
	NSString* h21 = [(NSDictionary*)[latestEventStr JSONValue] objectForKey:@"h21"];
	NSString* h22 = [(NSDictionary*)[latestEventStr JSONValue] objectForKey:@"h22"];
	NSString* e31 = [(NSDictionary*)[latestEventStr JSONValue] objectForKey:@"e31"];
	NSString* e32 = [(NSDictionary*)[latestEventStr JSONValue] objectForKey:@"e32"];
	NSNumber* paraller = [(NSDictionary*)[latestEventStr JSONValue] objectForKey:@"paraller"];
	
	
	//fetch the data
	
//	NSString *fileName = [e11 stringByAppendingString:@".jpg"];
//	[myImageE11 setImage:[UIImage imageNamed:fileName]];
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
 pickerArray = [[NSMutableArray alloc] init];
 [pickerArray addObject:@"Zone1"];
 [pickerArray addObject:@"Zone2"];
 [pickerArray addObject:@"Zone3"];
 [pickerArray addObject:@"Zone4"];
 [pickerArray addObject:@"Zone5"];
 
 float screenWidth = [UIScreen mainScreen].bounds.size.width;
 float pickerWidth = screenWidth;
 float xPoint = screenWidth/2 -pickerWidth/2;
 
 pickerView = [[UIPickerView alloc] init];
 [pickerView setDataSource: self];
 [pickerView setDelegate:self];
 pickerView.showsSelectionIndicator = YES;
	
 [pickerView setFrame:CGRectMake(xPoint, 50.0f, pickerWidth, 200.0f)];

	
 //preselect
 [pickerView selectRow:0 inComponent:0 animated: YES];
 [self.view addSubview: pickerView]; 
	
  time = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector (fetchInfo) userInfo:nil repeats:YES]; //10s
	
    [super viewDidLoad];
}

- (NSInteger) numberOfComponentsInPickerView: (UIPickerView *)pickerView {
	return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger) component {
	return [pickerArray count];	
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent: (NSInteger) component {
	return [pickerArray objectAtIndex: row];	
}

// Do Something with the selected row
- (void)pickerView: (UIPickerView *) pickerView didSelectRow: (NSInteger)row inComponent: 
(NSInteger)component {
	//		 NSLog(@"You selected this: %@", [pickerArray objetAtIndex:row]);
}




// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    // return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[pickerView release];
	[pickerArray release];
    [super dealloc];
}


@end
