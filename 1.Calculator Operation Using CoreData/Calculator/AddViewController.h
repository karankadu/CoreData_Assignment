//
//  AddViewController.h
//  Calculator
//
//  Created by Felix-ITS 04 on 04/11/16.
//  Copyright © 2016 Felix-KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *tf1;


@property (weak, nonatomic) IBOutlet UITextField *tf2;

- (IBAction)resultBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *addtf;

@property int tempResult;



@end
