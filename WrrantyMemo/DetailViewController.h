//
//  DetailViewController.h
//  WrrantyMemo
//
//  Created by 横井一樹 on 2015/03/08.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface DetailViewController : UIViewController<UITextViewDelegate,UITextViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate> //カメラロールから画像を取得する
@property (weak, nonatomic) IBOutlet UIDatePicker *datepicker;
@property (weak, nonatomic) IBOutlet UILabel *datelabel;

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;

- (IBAction)inputText:(id)sender;
- (IBAction)changeDate:(UIDatePicker *)sender;
//- (IBAction)changeDate:(id)sender;

@end

