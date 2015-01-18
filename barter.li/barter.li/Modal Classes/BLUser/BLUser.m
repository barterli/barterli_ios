//
//  BLUser.m
//  barter.li
//
//  Created by Shawn Noronha on 1/18/15.
//  Copyright (c) 2015 Barter.Li. All rights reserved.
//

#import "BLUser.h"

@implementation BLUser

-(NSString*) description
{
    return [NSString stringWithFormat:@"\n\n Name = %@, ImageURL = %@, userID = %@", _userName,_userImageURL,_userID];
}

@end
