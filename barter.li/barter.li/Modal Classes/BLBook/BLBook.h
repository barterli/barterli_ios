//
//  BLBook.h
//  barter.li
//
//  Created by Shawn Noronha on 1/18/15.
//  Copyright (c) 2015 Barter.Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLUser.h"

@interface BLBook : NSObject
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *bookDescription;
@property (nonatomic, strong) NSString *coverImage;
@property (nonatomic, strong) NSString *bookID;
@property (nonatomic, strong) NSString *ISBN10;
@property (nonatomic, strong) NSString *ISBN13;

@property (nonatomic, strong) BLUser *bookOwner;
@end
