//
//  SaveData+CoreDataProperties.h
//  Calculator
//
//  Created by Felix-ITS 04 on 04/11/16.
//  Copyright © 2016 Felix-KK. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SaveData.h"

NS_ASSUME_NONNULL_BEGIN

@interface SaveData (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *opr1;
@property (nullable, nonatomic, retain) NSNumber *opr2;
@property (nullable, nonatomic, retain) NSString *operator;
@property (nullable, nonatomic, retain) NSNumber *result;

@end

NS_ASSUME_NONNULL_END
