//
//  ViewController.m
//  评论回复
//
//  Created by admin on 2017/2/28.
//  Copyright © 2017年 LaiCunBa. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "CommentCell.h"
#import "Student.h"

static NSString * const cellIdentifier = @"cell";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *listArray;
@property (nonatomic , strong) UITextView *textView;
@property (nonatomic , strong) UIButton *button;
@property (nonatomic , assign) NSInteger clickRow;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addPerson];
    
    [self.tableView registerClass:[CommentCell class] forCellReuseIdentifier:cellIdentifier];
    
    [self textView];
    [self button];
    
    
}

- (void)addPerson
{
    Person *p1 = [Person setName:@"张三" CommentInfo:@"一个重大国家战略，要坚持优势互补、互利共赢、扎实推进，加快走出一条科学持续的协同发展路子来。第二天，习近平总书记在北京主持召开座谈会，专题听取京津冀协同发展工作汇报，强调实现京津冀协同发展，是一个重大国家战略"];
    Person *p2 = [Person setName:@"李四" CommentInfo:@"哈哈，你就是个傻逼"];
    Person *p3 = [Person setName:@"王五" CommentInfo:@"俯瞰京津冀，一幅以密布环绕的高铁、城际铁路、市域铁路、高速公路为骨架，呈多节点、网格状的交通网蓝图正徐徐铺开，犹如一颗巨钻熠熠生辉。"];
    Person *p4 = [Person setName:@"赵六" CommentInfo:@"3年来，以习近平同志为核心的党中央高度重视京津冀协同发展战略，高瞻远瞩顶层设计，稳扎稳打全面实施，京津冀这方热土日新月异，正在书写中国区域发展的当代传奇，筑造着引领时代新发展的历史性工程。"];
    Person *p5 = [Person setName:@"雪琪" CommentInfo:@"北京，这座世界名城，拥有3000多年的建城史和860多年的建都史。"];
    Person *p6 = [Person setName:@"陈八" CommentInfo:@"第二天，习近平总书记在北京主持召开座谈会，专题听取京津冀协同发展工作汇报，强调实现京津冀协同发展，是一个重大国家战略，要坚持优势互补、互利共赢、扎实推进，加快走出一条科学持续的协同发展路子来。第二天，习近平总书记在北京主持召开座谈会，专题听取京津冀协同发展工作汇报，强调实现京津冀协同发展，是一个重大国家战略，要坚持优势互补、互利共赢、扎实推进，加快走出一条科学持续的协同发展路子来"];
    
    [self.listArray addObject:p1];
    [self.listArray addObject:p2];
    [self.listArray addObject:p3];
    [self.listArray addObject:p4];
    [self.listArray addObject:p5];
    [self.listArray addObject:p6];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.person = self.listArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.textView becomeFirstResponder];

    self.clickRow = indexPath.row;
//    Person *p = self.listArray[indexPath.row];
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = (CommentCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    CGFloat h = [cell getCellHeightWithPerson:self.listArray[indexPath.row]];
    return h + 20;
}

- (void)sendAction
{
    NSString *name = @"";

    if ([self.listArray[self.clickRow] isKindOfClass:[Student class]]) {
        Student *s = self.listArray[self.clickRow];
        name = [NSString stringWithFormat:@"她@%@", s.name];
    } else {
        name = @"我";
    }
    Student *ss = [[Student alloc] init];
    ss.name = name;
    ss.commentInfo = self.textView.text;
    [self.listArray insertObject:ss atIndex:self.clickRow + 1];
    self.textView.text = nil;
    [self.textView resignFirstResponder];
    [self.tableView reloadData];
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)listArray
{
    if (!_listArray) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height - 50, 300, 40)];
        _textView.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:_textView];
    }
    return _textView;
}

- (UIButton *)button
{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.frame = CGRectMake(320, self.view.frame.size.height - 50, 40, 40);
        _button.backgroundColor = [UIColor purpleColor];
        [_button setTitle:@"发送" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(sendAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_button];
    }
    return _button;
}

@end
