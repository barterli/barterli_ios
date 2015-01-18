//
//  ViewController.m
//  Barter.Li
//
//  Created by Aditya Sinha on 1/18/15.
//  Copyright (c) 2015 Barter.Li. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
#define kListResultsForLocationCoordinates @"http://api.barter.li/api/v1/search.json?per=%ld&page=%ld&longitude=%.5lf&latitude=%.5lf"
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self fetchBooksAtCurrentLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) fetchBooksAtCurrentLocation
{
    NSString *apiRequestString=[NSString stringWithFormat:kListResultsForLocationCoordinates, (long)0, (long)0,77.6276092,12.9399408];
    
    NSURLSessionDataTask *dataTask=[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:apiRequestString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(!error && data)
        {
            NSError *anError;
            
            NSDictionary *responseDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&anError];
            
            NSLog(@"\n Response ==> %@", responseDict);
            
            
        }
    }];

    
    
    [dataTask resume];
}

@end
