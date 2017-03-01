//
//  Person.h
//  评论回复
//
//  Created by admin on 2017/2/28.
//  Copyright © 2017年 LaiCunBa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic , copy) NSString *name;
@property (nonatomic , copy) NSString *commentInfo;

+ (instancetype)setName:(NSString *)name CommentInfo:(NSString *)commentInfo;

@end
