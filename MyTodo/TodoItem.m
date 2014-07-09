//
//  TodoItem.m
//  MyTodo
//
//  Created by usr10049697 on 2014/07/09.
//  Copyright (c) 2014年 hachijirou. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem

- (id)copyWithZone:(NSZone *)zone
{
    TodoItem *copiedObject = [[[self class] allocWithZone:zone] init];
    if (copiedObject) {
        copiedObject->_title = [_title copyWithZone:zone];
        copiedObject->_note = [_note copyWithZone:zone];
        copiedObject->_priority = _priority;
        copiedObject->_completed = _completed;
    }
    return copiedObject;
}
@end
