//
//  DivideViewController.m
//  Calculator
//
//  Created by Felix-ITS 04 on 04/11/16.
//  Copyright © 2016 Felix-KK. All rights reserved.
//

#import "DivideViewController.h"
#import "SaveData.h"
#import "AppDelegate.h"



@interface DivideViewController ()

@end

@implementation DivideViewController

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

- (IBAction)resultbtn:(id)sender {
    
     _tempResult=[_tf1.text intValue]/[_tf2.text intValue];
    
    UIApplication *myapplication=[UIApplication sharedApplication];
    
    AppDelegate *mydelegate=(AppDelegate *)myapplication.delegate;
    
    NSManagedObjectContext *context=mydelegate.managedObjectContext;
    
    SaveData *s1=[NSEntityDescription insertNewObjectForEntityForName:@"SaveData" inManagedObjectContext:context];
    
    s1.opr1=[NSNumber numberWithInteger:[_tf1.text intValue]];
    s1.opr2=[NSNumber numberWithInteger:[_tf2.text intValue]];
    
    s1.operator=@"Divide";
   
    s1.result=[NSNumber numberWithInteger:_tempResult];
    
    _divtf.text=[NSString stringWithFormat:@"%i",_tempResult];
    
    [context save:nil];
   
}
@end
