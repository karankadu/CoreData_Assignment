//
//  EmpRecord+CoreDataProperties.h
//  EmployeeDBWithImageUsingCoreData
//
//  Created by Karan on 10/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "EmpRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface EmpRecord (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *empid;
@property (nullable, nonatomic, retain) NSString *fname;
@property (nullable, nonatomic, retain) NSString *lname;
@property (nullable, nonatomic, retain) NSData *image;

@end

NS_ASSUME_NONNULL_END
