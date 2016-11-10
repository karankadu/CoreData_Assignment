//
//  AddEmpViewController.h
//  EmployeeDBUsingCoreDataWithSorting
//
//  Created by Karan on 10/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEmpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *idtxt;

@property (weak, nonatomic) IBOutlet UITextField *fnametxt;

@property (weak, nonatomic) IBOutlet UITextField *lnametxt;

@property (weak, nonatomic) IBOutlet UITextField *salarytxt;

- (IBAction)addEmployee:(id)sender;


@end
