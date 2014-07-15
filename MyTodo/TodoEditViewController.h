//
//  TodoEditViewController.h
//  MyTodo
//
//  Created by うーな on 2014/07/16.
//  Copyright (c) 2014年 hachijirou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TodoItem;

@interface TodoEditViewController : UITableViewController
@property (nonatomic, copy) TodoItem *todoItem;
@end
