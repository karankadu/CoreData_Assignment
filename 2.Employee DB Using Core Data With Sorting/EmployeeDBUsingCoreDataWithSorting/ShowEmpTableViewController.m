//
//  ShowEmpTableViewController.m
//  EmployeeDBUsingCoreDataWithSorting
//
//  Created by Karan on 10/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import "ShowEmpTableViewController.h"
#import "EmployeeData.h"
#import "AppDelegate.h"
#import "CustomTableViewCell.h"

@interface ShowEmpTableViewController ()

@end

@implementation ShowEmpTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _empdata=[[NSMutableArray alloc]init];
    
    UIApplication *myapplication=[UIApplication sharedApplication];
    
    AppDelegate *mydelegate=(AppDelegate *)myapplication.delegate;
    
    NSManagedObjectContext *context=mydelegate.managedObjectContext;
    
    NSFetchRequest *req=[NSFetchRequest fetchRequestWithEntityName:@"EmployeeData"];
    
    NSArray *result=[context executeFetchRequest:req error:nil];
    
    for(EmployeeData *temp in result)
    {
        [_empdata addObject:temp];
    }

    [self.tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _empdata.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    EmployeeData *e1=[_empdata objectAtIndex:indexPath.row];
    
    cell.idlbl.text=e1.empid;
    cell.fnamelbl.text=e1.fname;
    cell.lnamelbl.text=e1.lname;
    cell.salarylbl.text=e1.salary;
    
    // Configure the cell...
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 80;
    
}


- (IBAction)maxSalary:(id)sender {
    
    NSSortDescriptor *sort=[NSSortDescriptor sortDescriptorWithKey:@"salary" ascending:NO selector:@selector(caseInsensitiveCompare:)];
    
    NSArray  *sortedarray = [_empdata sortedArrayUsingDescriptors:@[sort]];
    
    self.empdata=[[NSMutableArray alloc]initWithArray:sortedarray];
    
    [self.tableView reloadData];
    

}
@end
