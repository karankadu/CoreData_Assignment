//
//  AddEmpViewController.m
//  EmployeeDBWithImageUsingCoreData
//
//  Created by Karan on 10/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import "AddEmpViewController.h"
#import "AppDelegate.h"
#import "EmpRecord.h"

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

- (IBAction)AddRecord:(id)sender {
    
    UIApplication *myapplication=[UIApplication sharedApplication];
    
    AppDelegate *mydelegate=(AppDelegate *)myapplication.delegate;
    
    NSManagedObjectContext *context=mydelegate.managedObjectContext;
    
    EmpRecord *e1=[NSEntityDescription insertNewObjectForEntityForName:@"EmpRecord" inManagedObjectContext:context];
    
    e1.empid=_empIDtxt.text;
    e1.fname=_fnametxt.text;
    e1.lname=_lname.text;
    
   // NSString *imagename;
    
   // imagename=_imgNametxt.text;
    
    UIImage *empimage = [UIImage imageNamed:_imgNametxt.text];
    
    NSData *dataImage = UIImageJPEGRepresentation(empimage, 0.0);
    
    e1.image=dataImage;
    
    [context save:nil];
    
    _fnametxt.text=@"";
    _imgNametxt.text=@"";
    _lname.text=@"";
    _empIDtxt.text=@"";
    
   // NSLog(@"Record added");
    
    UIAlertView *AlView = [[UIAlertView alloc] initWithTitle:@"Saving" message:@"Record Added Successfully !" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [AlView show];
}
@end
