//
//  FirstViewController.m
//  multithreading using threads
//
//  Created by Student P_07 on 16/06/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)downloadButton:(UIButton *)sender {
    NSString *imagepath=@"https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&h=350";
    [NSThread detachNewThreadSelector:@selector(downloadImage:) toTarget:self withObject:imagepath];
}

-(void)downloadImage:(NSString *)sender
{
    NSError *error;
    NSURL *url=[NSURL URLWithString:sender];
    NSData *data=[NSData dataWithContentsOfURL:url options:NSDataReadingMapped error:&error];
    if(!error)
    {
        UIImage *myImage=[UIImage imageWithData:data];
        if(data)
        {
            [self performSelectorOnMainThread:@selector(updateUI:) withObject:myImage waitUntilDone:NO];
        }
    }
    else{
        NSLog(@"%@",error.localizedDescription);
    }
}
-(void)updateUI:(UIImage *)myImage
{
    self.myImageView.image=myImage;
}
@end
