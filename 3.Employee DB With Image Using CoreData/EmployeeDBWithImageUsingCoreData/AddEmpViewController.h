//
//  AddEmpViewController.h
//  EmployeeDBWithImageUsingCoreData
//
//  Created by Karan on 10/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEmpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *empIDtxt;

@property (weak, nonatomic) IBOutlet UITextField *fnametxt;

@property (weak, nonatomic) IBOutlet UITextField *lname;

@property (weak, nonatomic) IBOutlet UITextField *imgNametxt;

- (IBAction)AddRecord:(id)sender;




@end
