//
//  DetailViewController.m
//  WrrantyMemo
//
//  Created by 横井一樹 on 2015/03/08.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

#import "DetailViewController.h"


@interface DetailViewController ()

@property (strong, nonatomic) IBOutlet UITextView *contentField;
@property (strong, nonatomic) IBOutlet UITextField *titleField;
- (void)configureView;
@end

@interface DetailViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    UIImagePickerController *ipc;
} //カメラロールから画像を取得

@end

@implementation DetailViewController


#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        NSURL *FURL=(NSURL *)self.detailItem;
        NSDictionary *dic=[NSDictionary dictionaryWithContentsOfURL:FURL];
        self.titleField.text=dic[@"title"];
        self.contentField.text=dic[@"body"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    //キーから値を取得する
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *defaultStr = [defaults stringForKey:@"MY_KEY"];
    self.myTextField.text = defaultStr;
    
    //カメラロールから画像の取得
    ipc = [[UIImagePickerController alloc] init];
    ipc.delegate = self;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
}

- (IBAction)inputText:(id)sender {
    //指定したキーに入力された値を保存する
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: self.myTextField.text forKey:@"MY_KEY"];
    [defaults synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveData
{
    NSURL *FURL=(NSURL *)self.detailItem;
    NSDictionary *dic=@{@"title":self.titleField.text,@"body":self.contentField.text};
    [dic writeToURL:FURL atomically:YES];
}
-(void)textFieldDidEndEditing:(UITextField *)textFiedl
{
    [self saveData];
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    [self saveData];
}

//UIDatePickerView
- (IBAction)changeDate:(UIDatePicker *)sender {
    //初期化
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    //日付のフォーマット指定
//    df.dateFormat = @"yyyy/MM/dd HH:mm";
    df.dateFormat = @"yyyy/MM/dd";

    
    //ラベルに日付を表示
    self.datelabel.text = [df stringFromDate:self.datepicker.date];
}

- (IBAction)date:(UIDatePicker *)sender {
}

//カメラロールから画像の取得
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // picker から画像を取得する。
    UIImage *fromCamera = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // 元の画面に画像をUIImageViewとして追加する
    UIImageView *iv = [[UIImageView alloc] initWithImage:fromCamera];
    [self.view addSubview:iv];
    
//    iv.transform = CGAffineTransformMakeScale(1.0, 1.0);
    
    // picker を閉じる
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    // picker を閉じる
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self presentModalViewController:ipc animated:YES];
}



@end
