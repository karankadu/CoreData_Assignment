//
//  RecordTableViewController.m
//  EmployeeDBWithImageUsingCoreData
//
//  Created by Karan on 10/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import "RecordTableViewController.h"
#import "AppDelegate.h"
#import "CustomTableViewCell.h"
#import "EmpRecord.h"

@interface RecordTableViewController ()

@end

@implementation RecordTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:[NSBundle mainBundle]]forCellReuseIdentifier:@"cell"];}

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
    return _emparray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
   
    EmpRecord *e1=[_emparray objectAtIndex:indexPath.row];
    
    cell.empIDlbl.text=e1.empid;
    cell.fnamelbl.text=e1.fname;
    cell.lnamelbl.text=e1.lname;
    cell.empimg.image=[UIImage imageWithData:e1.image];
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return  80;

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
