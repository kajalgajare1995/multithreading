//
//  GCDViewController.h
//  multithreading using threads
//
//  Created by Student P_07 on 18/06/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCDViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *myImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView2;
- (IBAction)downloadButton:(UIButton *)sender;

@property UIActivityIndicatorView *myActivityIndicator1;
@property UIActivityIndicatorView *myActivityIndicator2;

@property NSOperationQueue *operationQueue;
@property NSBlockOperation *blockOperaton1;
@property NSBlockOperation *blockoperation2;

@end
