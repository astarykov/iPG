//
//  Utils.m
//  iPhotoGalery
//
//  Created by admin on 5/7/17.
//  Copyright © 2017 staryaprod. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(NSString *)getCurrentDateWithString:(NSDate *)date
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *currentDate = [NSString stringWithFormat:@"%@", [dateFormat stringFromDate:date]];
    return currentDate;
}

@end
