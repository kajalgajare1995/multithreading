//
//  SecondViewController.h
//  multithreading using threads
//
//  Created by Student P_07 on 16/06/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *firstImage;
@property (weak, nonatomic) IBOutlet UIImageView *secondImage;
- (IBAction)detectButton:(UIButton *)sender;

@property UIActivityIndicatorView *myActivity1;
@property UIActivityIndicatorView *myActivity2;

@property dispatch_queue_t queue;
@property dispatch_queue_t queue1;
@end

