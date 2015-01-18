//
//  BLBookCollectionViewCell.h
//  barter.li
//
//  Created by Aditya Sinha on 1/18/15.
//  Copyright (c) 2015 Barter.Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLBook.h"
#import "BLUser.h"

@interface BLBookCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *bookImageView;
@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UILabel *bookTitleLabel; //To be used when book image is not available.


@property (nonatomic, strong) BLBook *book;
@property (nonatomic, strong) BLUser *user;

@end
