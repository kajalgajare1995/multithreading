//
//  SecondViewController.m
//  multithreading using threads
//
//  Created by Student P_07 on 16/06/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)detectButton:(UIButton *)sender {
    [self.myActivity1 startAnimating ];
    [self.myActivity2 startAnimating];
    self.queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(self.queue, ^{
        NSError *error;
        NSString *path=@"https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg?auto=compress&cs=tinysrgb&h=350";
        NSURL *url=[NSURL URLWithString:path];
        NSData *data=[NSData dataWithContentsOfURL:url options:NSDataReadingMapped error:&error];
        if(data)
        {
            UIImage *image=[UIImage imageWithData:data];
            [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:NO];
        }
    });
    self.queue1=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    dispatch_async(self.queue1, ^{
        NSError *error;
        NSString *path1=@"https://fyf.tac-cdn.net/images/products/large/BF116-11KM.jpg";
        
        NSURL *url1=[NSURL URLWithString:path1];
        
        NSData *data1=[NSData dataWithContentsOfURL:url1 options:NSDataReadingMapped error:&error];
        if(data1)
        {
            UIImage *image=[UIImage imageWithData:data1];
            [self performSelectorOnMainThread:@selector(updateUI1:) withObject:image waitUntilDone:NO];
        }
    });
        
}
-(void)updateUI:(UIImage *)myimage
{
    self.firstImage.image=myimage;
[self.myActivity1 stopAnimating];
}
-(void)updateUI1:(UIImage *)myImage{
    self.secondImage.image=myImage;
    [self.myActivity2 stopAnimating];
}
@end
