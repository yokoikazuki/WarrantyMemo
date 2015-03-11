//
//  CameraViewController.h
//  WrrantyMemo
//
//  Created by 横井一樹 on 2015/03/11.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *userImage;
- (IBAction)addPhoto:(id)sender;
- (IBAction)insertPost:(id)sender;

@end

