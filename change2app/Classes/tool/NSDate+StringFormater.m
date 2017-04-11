//
//  NSDate+StringFormater.m
//  myTalk
//
//  Created by jam on 17/4/10.
//  Copyright © 2017年 jam. All rights reserved.
//

#import "NSDate+StringFormater.h"

@implementation NSDate (StringFormater)

-(NSString*)simpleDescription
{
    NSString* des=@"";
    NSTimeInterval interval=-self.timeIntervalSinceNow;
    NSDateFormatter* forma=[[NSDateFormatter alloc]init];
    
    NSInteger min1=60;
    NSInteger hour1=min1*60;
    NSInteger day1=hour1*24;
    NSInteger day3=day1*3;
    
    if (interval<=hour1) {
        NSInteger mins=interval/min1;
        des=[NSString stringWithFormat:@"%ld分钟前",(long)mins];
    }
    else if (interval<=day1) {
        NSInteger hours=interval/hour1;
        des=[NSString stringWithFormat:@"%ld小时前",(long)hours];
    }
    else if (interval<=day3) {
        NSInteger days=interval/day1;
        des=[NSString stringWithFormat:@"%ld天前",(long)days];
    }
    else
    {
        [forma setDateFormat:@"yyyy-MM-dd"];
        des=[forma stringFromDate:self];
    }
    return des;
}

+(NSDate*)dateWithString:(NSString *)str
{
    str=[str stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    str=[str stringByReplacingOccurrencesOfString:@".000Z" withString:@""];
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formater dateFromString:str];
}

@end