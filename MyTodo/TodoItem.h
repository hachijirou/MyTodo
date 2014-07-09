//
//  TodoItem.h
//  MyTodo
//
//  Created by usr10049697 on 2014/07/09.
//  Copyright (c) 2014年 hachijirou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoItem : NSObject <NSCopying>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *note;
@property (nonatomic) NSInteger priority;
@property (nonatomic) BOOL completed;

@end
