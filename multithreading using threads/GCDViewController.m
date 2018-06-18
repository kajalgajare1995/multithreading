//
//  GCDViewController.m
//  multithreading using threads
//
//  Created by Student P_07 on 18/06/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"commit process will done");
    self.operationQueue=[[NSOperationQueue alloc]init];
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

- (IBAction)downloadButton:(UIButton *)sender {
    self.blockOperaton1=[NSBlockOperation blockOperationWithBlock:^{
        NSString *path=@"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToUizswGYjFLZg0OC_qr2iKp_b_9US2pgUcxMK_ucTAZyKoT3N";
        NSURL *url=[NSURL URLWithString:path];
        NSData *data=[NSData dataWithContentsOfURL:url];
        if(data)
        {
            UIImage *Image=[UIImage imageWithData:data];
            [self performSelectorOnMainThread:@selector(updateUI:) withObject:Image waitUntilDone:NO];
        }
    }];
    
    self.blockoperation2=[NSBlockOperation blockOperationWithBlock:^{
        NSString *path1=@"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8AKrL720Uwyd3_-6e9XDlArVdEsqEyHfPZzIAhdgSlDRjV80n1g";
        NSURL *url1=[NSURL URLWithString:path1];
        NSData *data1=[NSData dataWithContentsOfURL:url1];
        if(data1)
        {
            UIImage *image=[UIImage imageWithData:data1];
            [self performSelectorOnMainThread:@selector(updateUI1:) withObject:image waitUntilDone:NO];
        }
    }];
    [self.blockOperaton1 addDependency:self.blockoperation2];
    [self.operationQueue addOperation:self.blockOperaton1];
    [self.operationQueue addOperation:self.blockoperation2];
}
-(void)updateUI:(UIImage *)myimage
{
    self.myImageView1.image=myimage;
    [self.myActivityIndicator1 stopAnimating];
}
-(void)updateUI1:(UIImage *)myimage
{
    self.myImageView2.image=myimage;
    [self.myActivityIndicator2 stopAnimating];
}
@end
