//
//  ShowEmpTableViewController.h
//  EmployeeDBUsingCoreDataWithSorting
//
//  Created by Karan on 10/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowEmpTableViewController : UITableViewController


@property(nonatomic,retain)NSMutableArray *empdata;

- (IBAction)maxSalary:(id)sender;

@end
