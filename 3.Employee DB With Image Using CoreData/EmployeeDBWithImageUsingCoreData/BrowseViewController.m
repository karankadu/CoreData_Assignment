//
//  BrowseViewController.m
//  EmployeeDBWithImageUsingCoreData
//
//  Created by Karan on 10/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import "BrowseViewController.h"
#import "AppDelegate.h"
#import "EmpRecord.h"

@interface BrowseViewController ()

@end

@implementation BrowseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _emparray=[[NSMutableArray alloc]init];
    
    UIApplication *myapplication=[UIApplication sharedApplication];
    
    AppDelegate *mydelegate=(AppDelegate *)myapplication.delegate;
    
    NSManagedObjectContext *context=mydelegate.managedObjectContext;
    
    NSFetchRequest *req=[NSFetchRequest fetchRequestWithEntityName:@"EmpRecord"];
    
    NSArray *result=[context executeFetchRequest:req error:nil];
    
    for(EmpRecord *temp in result)
    {
        [_emparray addObject:temp];
    }
    
    _numberofRecord=_emparray.count;
    
  //  _image.image=[UIImage imageNamed:[_emparray objectAtIndex:0]];
    
    EmpRecord *e1=[_emparray objectAtIndex:0];
    _image.image=[UIImage imageWithData:e1.image];
    _empIDlbl.text=e1.empid;
    _fnamelbl.text=e1.fname;
    _lnamelbl.text=e1.lname;
    _previous=0;
    _current=0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)PreviousRecord:(id)sender {
    
    if (_previous==0)
    {
        EmpRecord *e1=[_emparray objectAtIndex:0];
        _image.image=[UIImage imageWithData:e1.image];
        _empIDlbl.text=e1.empid;
        _fnamelbl.text=e1.fname;
        _lnamelbl.text=e1.lname;
        _previous+=1;
        _current++;
        
     //   NSLog(@"PreviousRecord:%d",_current);
        
    } else {
        
        EmpRecord *e1=[_emparray objectAtIndex:--_previous];
        
        _image.image=[UIImage imageWithData:e1.image];
        _empIDlbl.text=e1.empid;
        _fnamelbl.text=e1.fname;
        _lnamelbl.text=e1.lname;
        _previous-=1;
        _current--;
        
     //   NSLog(@"PreviousRecord:%d",_current);
        
    }
}

- (IBAction)nextRecord:(id)sender {
    _next=_previous+1;
    
    if (_next<_numberofRecord)
    {
        EmpRecord *e1=[_emparray objectAtIndex:_next];
        
        _image.image=[UIImage imageWithData:e1.image];
        _empIDlbl.text=e1.empid;
        _fnamelbl.text=e1.fname;
        _lnamelbl.text=e1.lname;
        _previous+=1;
        _current++;
        
     //   NSLog(@"nextRecord:%d",_current);
        
    } else {
        
        UIAlertView *AlView = [[UIAlertView alloc] initWithTitle:@"Record End Alert" message:@"You Reach at End Of Record !" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [AlView show];

    }
    
    
}

- (IBAction)DeleteRecord:(id)sender {
    
    UIApplication *myapplication=[UIApplication sharedApplication];
    
    AppDelegate *mydelegate=(AppDelegate *)myapplication.delegate;
    
    NSManagedObjectContext *context=mydelegate.managedObjectContext;
    
//    NSString *empid=[NSString stringWithFormat:@"%i",_current];
//    
//    NSEntityDescription *Entity=[NSEntityDescription entityForName:@"EmpRecord" inManagedObjectContext:context];
//   
//    NSFetchRequest *fetch=[[NSFetchRequest alloc] init];
//    
//    [fetch setEntity:Entity];
//    
//    NSPredicate *p=[NSPredicate predicateWithFormat:@"empid == %@", empid];
//    
//     [fetch setPredicate:p];
//
//    NSError *fetchError;
//    NSArray *fetchedrecords=[context executeFetchRequest:fetch error:&fetchError];
//    // handle error
//    
//    for (NSManagedObject *product in fetchedrecords) {
//        [context deleteObject:product];
//    }
//    
//    [context save:nil];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"EmpRecord"];
    
    NSString *empid=[NSString stringWithFormat:@"%i",_current];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"empid == %@", empid];
    
    [request setPredicate:predicate];
    
    NSError *error = nil;
//    NSManagedObjectContext *managedObjectContext;//Get your ManagedObjectContext;
    NSArray *result = [context executeFetchRequest:request error:&error];

    if (!error && result.count > 0) {
        for(NSManagedObject *managedObject in result){
            [context deleteObject:managedObject];
        }
        
        //Save context to write to store
        [context save:nil];
    }
}
@end
