//
//  CustomTableViewCell.h
//  EmployeeDBUsingCoreDataWithSorting
//
//  Created by Karan on 10/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *idlbl;

@property (weak, nonatomic) IBOutlet UILabel *fnamelbl;

@property (weak, nonatomic) IBOutlet UILabel *lnamelbl;

@property (weak, nonatomic) IBOutlet UILabel *salarylbl;


@end
