//
//  SecondViewController.m
//  einSwitch003
//
//  Created by Olivia Bornstein on 3/30/12.
//  Copyright 2012 Hoover Middle School. All rights reserved.
//

#import "SecondViewController.h"
#import "JSON.h"
#define eventURL @"http://mytopic.us/elgg/services/api/rest/json/?method=Event.getInfo&Id=42"

@implementation SecondViewController
@synthesize responseData, event1label, event2label, event3label;

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
	 
	 //choose a random loan
	 //	NSDictionary* loan = [latestLoans objectAtIndex:0];
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
	 
	 NSString *fileName = [e11 stringByAppendingString:@".jpg"];
	 [myImageE11 setImage:[UIImage imageNamed:fileName]];
	 
	 fileName = [e12 stringByAppendingString:@".jpg"];
	 [myImageE12 setImage:[UIImage imageNamed:fileName]];
	 
	 fileName = [h11 stringByAppendingString:@".jpg"];
	 [myImageH11 setImage:[UIImage imageNamed:fileName]];
	 
	 fileName = [h12 stringByAppendingString:@".jpg"];
	 [myImageH12 setImage:[UIImage imageNamed:fileName]];
	 
	 fileName = [e21 stringByAppendingString:@".jpg"];
	 [myImageE21 setImage:[UIImage imageNamed:fileName]];
	 
	 fileName = [e22 stringByAppendingString:@".jpg"];
	 [myImageE22 setImage:[UIImage imageNamed:fileName]];
	 
	 fileName = [h21 stringByAppendingString:@".jpg"];
	 [myImageH21 setImage:[UIImage imageNamed:fileName]];
	 
	 fileName = [h22 stringByAppendingString:@".jpg"];
	 [myImageH22 setImage:[UIImage imageNamed:fileName]];
	 
	 fileName = [e31 stringByAppendingString:@".jpg"];
	 [myImageE31 setImage:[UIImage imageNamed:fileName]];
	 
	 fileName = [e32 stringByAppendingString:@".jpg"];
	 [myImageE32 setImage:[UIImage imageNamed:fileName]];
	 
}

// Rotation control
- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
	if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		event1label.frame = CGRectMake(10,40,320,44);
		event2label.frame = CGRectMake(260,40,320,44);
		event3label.frame = CGRectMake(120,150,320,44);
		
		myImageE11.frame = CGRectMake(0, 0, 40, 60);
		myImageE11.center = CGPointMake(20,110);
		
		myImageE12.frame = CGRectMake(0, 0, 40, 60);
		myImageE12.center = CGPointMake(60,110);
		
		myImageH11.frame = CGRectMake(0, 0, 24, 36);
		myImageH11.center = CGPointMake(110,120);
		
		myImageH12.frame = CGRectMake(0, 0, 24, 36);
		myImageH12.center = CGPointMake(140,120);
		
		myImageE21.frame = CGRectMake(0, 0, 40, 60);
		myImageE21.center = CGPointMake(280,110);
		
		myImageE22.frame = CGRectMake(0, 0, 40, 60);
		myImageE22.center = CGPointMake(320,110);
		
		myImageH21.frame = CGRectMake(0, 0, 24, 36);
		myImageH21.center = CGPointMake(370,120);
		
		myImageH22.frame = CGRectMake(0, 0, 24, 36);
		myImageH22.center = CGPointMake(400,120);
		
		myImageE31.frame = CGRectMake(0, 0, 40, 60);
		myImageE31.center = CGPointMake(200,220);
		
		myImageE32.frame = CGRectMake(0, 0, 40, 60);
		myImageE32.center = CGPointMake(240,220);
		
	}else{
		event1label.frame = CGRectMake(40,40,320,44);
		event2label.frame = CGRectMake(40,150,320,44);
		event3label.frame = CGRectMake(40,250,320,44);
	
		myImageE11.frame = CGRectMake(0, 0, 40, 60);
		myImageE11.center = CGPointMake(50,110);
		
		myImageE12.frame = CGRectMake(0, 0, 40, 60);
		myImageE12.center = CGPointMake(90,110);
		
		myImageH11.frame = CGRectMake(0, 0, 24, 36);
		myImageH11.center = CGPointMake(150,110);
		
		myImageH12.frame = CGRectMake(0, 0, 24, 36);
		myImageH12.center = CGPointMake(180,110);
		
		myImageE21.frame = CGRectMake(0, 0, 40, 60);
		myImageE21.center = CGPointMake(50,220);
		
		myImageE22.frame = CGRectMake(0, 0, 40, 60);
		myImageE22.center = CGPointMake(90,220);
		
		myImageH21.frame = CGRectMake(0, 0, 24, 36);
		myImageH21.center = CGPointMake(150,220);
		
		myImageH22.frame = CGRectMake(0, 0, 24, 36);
		myImageH22.center = CGPointMake(180,220);
		
		myImageE31.frame = CGRectMake(0, 0, 40, 60);
		myImageE31.center = CGPointMake(50,320);
		
		myImageE32.frame = CGRectMake(0, 0, 40, 60);
		myImageE32.center = CGPointMake(90,320);
		
		
	}
	
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	if (self.interfaceOrientation == UIInterfaceOrientationPortrait || self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		event1label=[[UILabel alloc] initWithFrame: CGRectMake(40,40,320,44)];
		event1label.backgroundColor=[UIColor clearColor];
		event1label.text = @"#1 Event   :    Heat ";
		[self.view addSubview: event1label];
		
		event2label=[[UILabel alloc] initWithFrame:CGRectMake(40,150,320,44)];
		event2label.backgroundColor=[UIColor clearColor];
		event2label.text = @"#2 Event  :    Heat ";
		[self.view addSubview: event2label];
	
		event3label=[[UILabel alloc] initWithFrame:CGRectMake(40,250,320,44)];
		event3label.backgroundColor=[UIColor clearColor];
		event3label.text = @"Published Event #: ";
		[self.view addSubview: event3label];
	
	
		myImageE11=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.jpg"]];
		[self.view addSubview:myImageE11];
	
		myImageE12=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.jpg"]];
		[self.view addSubview:myImageE12];
	
		myImageH11=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.jpg"]];
		[self.view addSubview:myImageH11];
	
		myImageH12=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.jpg"]];
		[self.view addSubview:myImageH12];
	
		myImageE21=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.jpg"]];
		[self.view addSubview:myImageE21];
	
			myImageE22=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.jpg"]];
		[self.view addSubview:myImageE22];
	
		myImageH21=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.jpg"]];
		[self.view addSubview:myImageH21];
	
		myImageH22=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.jpg"]];
		[self.view addSubview:myImageH22];
	
		myImageE31=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.jpg"]];
		[self.view addSubview:myImageE31];
	
	
		myImageE32=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.jpg"]];
		[self.view addSubview:myImageE32];
		myImageE11.frame = CGRectMake(0, 0, 40, 60);
		myImageE11.center = CGPointMake(50,110);
		
		myImageE12.frame = CGRectMake(0, 0, 40, 60);
		myImageE12.center = CGPointMake(90,110);
		
		myImageH11.frame = CGRectMake(0, 0, 24, 36);
		myImageH11.center = CGPointMake(150,110);
		
		myImageH12.frame = CGRectMake(0, 0, 24, 36);
		myImageH12.center = CGPointMake(180,110);
		
		myImageE21.frame = CGRectMake(0, 0, 40, 60);
		myImageE21.center = CGPointMake(50,220);
		
		myImageE22.frame = CGRectMake(0, 0, 40, 60);
		myImageE22.center = CGPointMake(90,220);
		
		myImageH21.frame = CGRectMake(0, 0, 24, 36);
		myImageH21.center = CGPointMake(150,220);
		
		myImageH22.frame = CGRectMake(0, 0, 24, 36);
		myImageH22.center = CGPointMake(180,220);
		
		myImageE31.frame = CGRectMake(0, 0, 40, 60);
		myImageE31.center = CGPointMake(50,320);
		
		myImageE32.frame = CGRectMake(0, 0, 40, 60);
		myImageE32.center = CGPointMake(90,320);
		
	
	} else {
		event1label=[[UILabel alloc] initWithFrame: CGRectMake(10,40,320,44)];
		event1label.backgroundColor=[UIColor clearColor];
		event1label.text = @"#1 Event    :    Heat ";
		[self.view addSubview: event1label];
		
		event2label=[[UILabel alloc] initWithFrame:CGRectMake(260,40,320,44)];
		event2label.backgroundColor=[UIColor clearColor];
		event2label.text = @"#2 Event   :    Heat ";
		[self.view addSubview: event2label];
		
		event3label=[[UILabel alloc] initWithFrame:CGRectMake(120,150,320,44)];
		event3label.backgroundColor=[UIColor clearColor];
		event3label.text = @"Published Event: ";
		[self.view addSubview: event3label];

		
		myImageE11=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.jpg"]];
		[self.view addSubview:myImageE11];
		
		myImageE12=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
		[self.view addSubview:myImageE12];
		
		myImageH11=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2.jpg"]];
		[self.view addSubview:myImageH11];
		
		myImageH12=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3.jpg"]];
		[self.view addSubview:myImageH12];
		
		myImageE21=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4.jpg"]];
		[self.view addSubview:myImageE21];
		
		myImageE22=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"5.jpg"]];
		[self.view addSubview:myImageE22];
		
		myImageH21=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"6.jpg"]];
		[self.view addSubview:myImageH21];
		
		myImageH22=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"7.jpg"]];
		[self.view addSubview:myImageH22];
		
		myImageE31=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"8.jpg"]];
		[self.view addSubview:myImageE31];
		
		
		myImageE32=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"9.jpg"]];
		[self.view addSubview:myImageE32];
		
		myImageE11.frame = CGRectMake(0, 0, 40, 60);
		myImageE11.center = CGPointMake(20,110);
		
		myImageE12.frame = CGRectMake(0, 0, 40, 60);
		myImageE12.center = CGPointMake(60,110);
		
		myImageH11.frame = CGRectMake(0, 0, 24, 36);
		myImageH11.center = CGPointMake(110,120);
		
		myImageH12.frame = CGRectMake(0, 0, 24, 36);
		myImageH12.center = CGPointMake(140,120);
		
		myImageE21.frame = CGRectMake(0, 0, 40, 60);
		myImageE21.center = CGPointMake(280,110);
		
		myImageE22.frame = CGRectMake(0, 0, 40, 60);
		myImageE22.center = CGPointMake(320,110);
		
		myImageH21.frame = CGRectMake(0, 0, 24, 36);
		myImageH21.center = CGPointMake(370,120);
		
		myImageH22.frame = CGRectMake(0, 0, 24, 36);
		myImageH22.center = CGPointMake(400,120);
		
		myImageE31.frame = CGRectMake(0, 0, 40, 60);
		myImageE31.center = CGPointMake(200,220);
		
		myImageE32.frame = CGRectMake(0, 0, 40, 60);
		myImageE32.center = CGPointMake(240,220);
		
	}

    time = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector (fetchInfo) userInfo:nil repeats:YES]; //10s
	[super viewDidLoad];
	
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
    [super dealloc];
}


@end
