//
//  BLBook.m
//  barter.li
//
//  Created by Shawn Noronha on 1/18/15.
//  Copyright (c) 2015 Barter.Li. All rights reserved.
//

#import "BLBook.h"

@implementation BLBook

-(NSString*) description
{
    return [NSString stringWithFormat:@"\n\nTitle = %@, Author = %@, BookID = %@, thumbnailURL = %@, ISBN10 = %@, ISBN13 = %@ \nDescription = %@", _title, _author, _bookID, _coverImage, _ISBN10, _ISBN13, _bookDescription];
}

@end
