//
//  NSDate+LJExtend.h
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/23.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LJExtend)

// 基本属性
@property (nonatomic, readonly) NSInteger lj_year; ///< Year component
@property (nonatomic, readonly) NSInteger lj_month; ///< Month component (1~12)
@property (nonatomic, readonly) NSInteger lj_day; ///< Day component (1~31)
@property (nonatomic, readonly) NSInteger lj_hour; ///< Hour component (0~23)
@property (nonatomic, readonly) NSInteger lj_minute; ///< Minute component (0~59)
@property (nonatomic, readonly) NSInteger lj_second; ///< Second component (0~59)
@property (nonatomic, readonly) NSInteger lj_nanosecond; ///< Nanosecond component
@property (nonatomic, readonly) NSInteger lj_weekday; ///< Weekday component (1~7, first day is based on user setting)
@property (nonatomic, readonly) NSInteger lj_weekdayOrdinal; ///< WeekdayOrdinal component
@property (nonatomic, readonly) NSInteger lj_weekOfMonth; ///< WeekOfMonth component (1~5)
@property (nonatomic, readonly) NSInteger lj_weekOfYear; ///< WeekOfYear component (1~53)
@property (nonatomic, readonly) NSInteger lj_yearForWeekOfYear; ///< YearForWeekOfYear component
@property (nonatomic, readonly) BOOL lj_isToday; ///< Weather date is today (based on current locale)
@property (nonatomic, readonly) BOOL lj_isYesterday; ///< Weather date is yesterday (based on current locale)

// 时间操作
- (nullable NSDate *)lj_dateByAddingYears:(NSInteger)years;
- (nullable NSDate *)lj_dateByAddingMonths:(NSInteger)months;
- (nullable NSDate *)lj_dateByAddingWeeks:(NSInteger)weeks;
- (nullable NSDate *)lj_dateByAddingDays:(NSInteger)days;
- (nullable NSDate *)lj_dateByAddingHours:(NSInteger)hours;
- (nullable NSDate *)lj_dateByAddingMinutes:(NSInteger)minutes;
- (nullable NSDate *)lj_dateByAddingSeconds:(NSInteger)seconds;

// 转换
/*
 see http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
 for format description.
 
 @param format   String representing the desired date format.
 e.g. @"yyyy-MM-dd HH:mm:ss"
 */
- (nullable NSString *)lj_stringWithFormat:(NSString *)format;

- (nullable NSString *)lj_stringWithFormat:(NSString *)format
                               timeZone:(nullable NSTimeZone *)timeZone
                                 locale:(nullable NSLocale *)locale;

+ (nullable NSDate *)lj_dateWithString:(NSString *)dateString format:(NSString *)format;

@end
