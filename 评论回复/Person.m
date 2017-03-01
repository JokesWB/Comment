//
//  Person.m
//  评论回复
//
//  Created by admin on 2017/2/28.
//  Copyright © 2017年 LaiCunBa. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype)setName:(NSString *)name CommentInfo:(NSString *)commentInfo
{
    Person *p = [[self alloc] init];
    p.name = name;
    p.commentInfo = commentInfo;
    return p;
}

@end
