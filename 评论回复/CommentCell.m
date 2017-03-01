//
//  CommentCell.m
//  评论回复
//
//  Created by admin on 2017/2/28.
//  Copyright © 2017年 LaiCunBa. All rights reserved.
//

#import "CommentCell.h"
#import "Person.h"
#import "Student.h"

@interface CommentCell ()

@property (nonatomic , strong) UILabel *nameLabel;
@property (nonatomic , strong) UILabel *commentLabel;
@property (nonatomic , strong) UIView *lineView;


@end

@implementation CommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self nameLabel];
        [self commentLabel];
        
    }
    return self;
}

- (void)setPerson:(Person *)person
{
    _person = person;
    self.nameLabel.text = [person.name stringByAppendingString:@": "];
    self.commentLabel.text = person.commentInfo;
    
    self.lineView.frame = CGRectMake(0, 0, 375, 1);
    NSLog(@">>>>>>> = %@", person);
    
    if ([person isKindOfClass:[Student class]]) {
        self.nameLabel.frame = CGRectMake(30, 10, 60, 30);
        self.commentLabel.frame = CGRectMake(90, 10, 280, 30);
        self.lineView.frame = CGRectMake(30, 0, 335, 1);
    }
    
    CGRect rect = self.commentLabel.frame;
    rect.size.height = [self getCellHeightWithPerson:person];
    self.commentLabel.frame = rect;
}


- (CGFloat)getCellHeightWithPerson:(Person *)p
{
    CGFloat width = [p isKindOfClass:[Person class]] ? 300 : 280;
    CGRect rect = [p.commentInfo boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil];
    return rect.size.height + 10;
}





- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel= [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 60, 30)];
//        _nameLabel.backgroundColor = [UIColor redColor];
        _nameLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)commentLabel
{
    if (!_commentLabel) {
        _commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 300, 30)];
//        _commentLabel.backgroundColor = [UIColor cyanColor];
        _commentLabel.font = [UIFont systemFontOfSize:14];
        _commentLabel.numberOfLines = 0;
        [self addSubview:_commentLabel];
    }
    return _commentLabel;
}


- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor redColor];
        [self addSubview:_lineView];
    }
    return _lineView;
}








- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
