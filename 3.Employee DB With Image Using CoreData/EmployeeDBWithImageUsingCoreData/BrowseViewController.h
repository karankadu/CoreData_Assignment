//
//  BrowseViewController.h
//  EmployeeDBWithImageUsingCoreData
//
//  Created by Karan on 10/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowseViewController : UIViewController

@property(nonatomic,retain)NSMutableArray *emparray;

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *empIDlbl;

@property (weak, nonatomic) IBOutlet UILabel *fnamelbl;

@property (weak, nonatomic) IBOutlet UILabel *lnamelbl;

- (IBAction)PreviousRecord:(id)sender;

- (IBAction)nextRecord:(id)sender;

- (IBAction)DeleteRecord:(id)sender;

@property int previous,next,current,numberofRecord;
@end
