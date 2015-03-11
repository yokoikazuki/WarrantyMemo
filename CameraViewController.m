//
//  CameraViewController.m
//  WrrantyMemo
//
//  Created by 横井一樹 on 2015/03/11.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// カメラロールの起動と画像選択処理
- (IBAction)addPhoto:(id)sender {
    UIImagePickerControllerSourceType sourceType
    = UIImagePickerControllerSourceTypePhotoLibrary;
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = sourceType;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

// 画像選択後の処理
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    // カメラロールの画面が閉じられたあとの処理を記述
    [self dismissViewControllerAnimated:YES completion:^{
        // ①選択した画像をUIimageViewに表示
        self.userImage.image = image;
        // ②Parseに保存するため、Data型にコンバートして格納
//        self.imgData = UIImageJPEGRepresentation(image, 0.5f);
    }];
}

@end
