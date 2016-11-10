//
//  AddEmpViewController.m
//  EmployeeDBUsingCoreDataWithSorting
//
//  Created by Karan on 10/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import "AddEmpViewController.h"
#import "AppDelegate.h"
#import "EmployeeData.h"

@interface AddEmpViewController ()

@end

@implementation AddEmpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)addEmployee:(id)sender {

    UIApplication *myapplication=[UIApplication sharedApplication];
    
    AppDelegate *mydelegate=(AppDelegate *)myapplication.delegate;
    
    NSManagedObjectContext *context=mydelegate.managedObjectContext;
    
    EmployeeData *e1=[NSEntityDescription insertNewObjectForEntityForName:@"EmployeeData" inManagedObjectContext:context];

    e1.empid=_idtxt.text;
    e1.fname=_fnametxt.text;
    e1.lname=_lnametxt.text;
    e1.salary=_salarytxt.text;
    
    [context save:nil];
    
    NSLog(@"Record Added");
    
    _idtxt.text=@"";
    _salarytxt.text=@"";
    _lnametxt.text=@"";
    _fnametxt.text=@"";
    
}





@end
