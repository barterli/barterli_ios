//
//  ViewController.m
//  Barter.Li
//
//  Created by Aditya Sinha on 1/18/15.
//  Copyright (c) 2015 Barter.Li. All rights reserved.
//

#import "ViewController.h"
#import "BLBook.h"

#define kListResultsForLocationCoordinates @"http://api.barter.li/api/v1/search.json?per=%ld&page=%ld&longitude=%.7lf&latitude=%.7lf"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *searchResultsBooksArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.searchResultsBooksArray=[[NSMutableArray alloc] init];
    
    [self fetchBooksAtCurrentLocation];
}

// Called whenever the datasource is modified or updated
-(void) refreshUIAsDataSourceUpdated
{
    ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) fetchBooksAtCurrentLocation
{
    NSString *apiRequestString=[NSString stringWithFormat:kListResultsForLocationCoordinates, (long)0, (long)0,77.6276092,12.9399408];
    
    __block __weak ViewController *weakSelf=self;
    
    NSURLSessionDataTask *dataTask=[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:apiRequestString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(!error && data)
        {
            NSError *anError;
            NSDictionary *responseDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&anError];
            NSArray *resultsArray=[responseDict objectForKey:@"search"];
            
            if(resultsArray && !anError)
            {
                NSMutableArray *parsingArray=[NSMutableArray new];
                
                for (NSDictionary *bookDict in resultsArray)
                {
                    BLBook *newBook=[BLBook new];
                    BLUser *bookOwner=[BLUser new];
                    
                    newBook.author  =[bookDict objectForKey:@"author"];
                    newBook.title   =[bookDict objectForKey:@"title"];
                    newBook.coverImage  =[bookDict objectForKey:@"image_url"];
                    newBook.bookDescription =[bookDict objectForKey:@"description"];
                    newBook.bookID  =[bookDict objectForKey:@"id_book"];
                    newBook.ISBN10  =[bookDict objectForKey:@"isbn_10"];
                    newBook.ISBN13  =[bookDict objectForKey:@"isbn_13"];

                    bookOwner.userName      =[bookDict objectForKey:@"owner_name"];
                    bookOwner.userID        =[bookDict objectForKey:@"id_user"];
                    bookOwner.userImageURL  =[bookDict objectForKey:@"owner_image_url"];
                    newBook.bookOwner=bookOwner;
                    
                    [parsingArray addObject:newBook];
                }
                
                // Update Datasource and refresh UI
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf.searchResultsBooksArray removeAllObjects];
                    [weakSelf.searchResultsBooksArray addObjectsFromArray:parsingArray];
                    [weakSelf refreshUIAsDataSourceUpdated];
                });
               
            }
      
        }
    }];

    [dataTask resume];
}

@end
