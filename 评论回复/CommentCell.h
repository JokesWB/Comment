//
//  CommentCell.h
//  评论回复
//
//  Created by admin on 2017/2/28.
//  Copyright © 2017年 LaiCunBa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Person;

@interface CommentCell : UITableViewCell

@property (nonatomic , strong) Person *person;

- (CGFloat)getCellHeightWithPerson:(Person *)p;

@end
