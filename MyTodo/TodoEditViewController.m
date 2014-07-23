//
//  TodoEditViewController.m
//  MyTodo
//
//  Created by うーな on 2014/07/16.
//  Copyright (c) 2014年 hachijirou. All rights reserved.
//

#import "TodoEditViewController.h"
#import "TodoItem.h"

@interface TodoEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioritySegControl;
@property (weak, nonatomic) IBOutlet UITextView *noteTextView;
@property (weak, nonatomic) IBOutlet UISwitch *completedSwitch;
- (IBAction)priorityChanged:(UISegmentedControl *)sender;
- (IBAction)statusChanged:(UISwitch *)sender;

@end

@implementation TodoEditViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleTextField.text = self.todoItem.title;
    self.prioritySegControl.selectedSegmentIndex = self.todoItem.priority;
    self.noteTextView.text = self.todoItem.note;
    self.completedSwitch.on = self.todoItem.completed;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)priorityChanged:(UISegmentedControl *)sender {
    self.todoItem.priority = sender.selectedSegmentIndex;
}

- (IBAction)statusChanged:(UISwitch *)sender {
    self.todoItem.completed = sender.on;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.todoItem.title = textField.text;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    self.todoItem.note = textView.text;
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    // テキスト入力中の場合、画面遷移前に入力を終了させる
    if ([self.titleTextField isFirstResponder]) {
        [self.titleTextField resignFirstResponder];
    }
    if ([self.noteTextView isFirstResponder]) {
        [self.noteTextView resignFirstResponder];
    }
    
    // タイトルが空欄にならにようにチェック
    if ([identifier isEqualToString:@"EditDone"]) {
        if (self.todoItem.title == nil ||
            self.todoItem.title.length == 0) {
            UIAlertView *alert =
            [[UIAlertView alloc] initWithTitle:@"Warning"
                                       message:@"Title must not be empty."
                                      delegate:nil
                             cancelButtonTitle:@"OK"
                             otherButtonTitles:nil];
            [alert show];
            return NO;
        }
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
