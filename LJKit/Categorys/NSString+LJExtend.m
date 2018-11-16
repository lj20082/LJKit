//
//  NSString+LJExtend.m
//  LJKitDemo
//
//  Created by 李建忠 on 2018/4/20.
//  Copyright © 2018年 IFlytek. All rights reserved.
//

#import "NSString+LJExtend.h"
#import "NSData+LJExtend.h"

@implementation NSString (LJExtend)

// 苹果不建议使用stringByAddingPercentEscapesUsingEncoding 中文和后面字符 !*'();:@&=+$,/?%#[] 正常解码，适用于url或者参数中包含中文以及其它非法字符的情况，但不适用于参数包含保留字和其他特殊字符的情况。
// 苹果建议 使用 stringByAddingPercentEncodingWithAllowedCharacters
// 几种常用的NSCharacterSet：
// URLFragmentAllowedCharacterSet  "#%<>[\]^`{|}
// URLHostAllowedCharacterSet      "#%/<>?@\^`{|}
// URLPasswordAllowedCharacterSet  "#%/:<>?@[\]^`{|}
// URLPathAllowedCharacterSet      "#%;<>?[\]^`{|}
// URLQueryAllowedCharacterSet    "#%<>[\]^`{|}
// URLUserAllowedCharacterSet      "#%/:<>?@[\]^`

- (NSString *)lj_stringByURLEncode{
    static NSString * const kAFCharactersGeneralDelimitersToEncode = @"#[]@"; // does not include "?" or "/" due to RFC 3986 - Section 3.4 , does not include because when url  http: encode http%3A sdwebimage not work
    static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
    
    NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];
    static NSUInteger const batchSize = 50;
    
    NSUInteger index = 0;
    NSMutableString *escaped = @"".mutableCopy;
    
    while (index < self.length) {
        NSUInteger length = MIN(self.length - index, batchSize);
        NSRange range = NSMakeRange(index, length);
        // To avoid breaking up character sequences such as 👴🏻👮🏽
        range = [self rangeOfComposedCharacterSequencesForRange:range];
        NSString *substring = [self substringWithRange:range];
        NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
        [escaped appendString:encoded];
        
        index += range.length;
    }
    return escaped;
}

- (NSString *)lj_stringByURLEncodeExceptString:(NSString *)exceptString{
    static NSString * const kAFCharactersGeneralDelimitersToEncode = @"#[]@"; // does not include "?" or "/" due to RFC 3986 - Section 3.4 , does not include because when url  http: encode http%3A sdwebimage not work
    static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
    
    NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];
    [allowedCharacterSet addCharactersInString:exceptString];
    static NSUInteger const batchSize = 50;
    
    NSUInteger index = 0;
    NSMutableString *escaped = @"".mutableCopy;
    
    while (index < self.length) {
        NSUInteger length = MIN(self.length - index, batchSize);
        NSRange range = NSMakeRange(index, length);
        // To avoid breaking up character sequences such as 👴🏻👮🏽
        range = [self rangeOfComposedCharacterSequencesForRange:range];
        NSString *substring = [self substringWithRange:range];
        NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
        [escaped appendString:encoded];
        
        index += range.length;
    }
    return escaped;
}

- (NSString *)lj_stringByURLDecode{
    if ([self respondsToSelector:@selector(stringByRemovingPercentEncoding)]) {
        return [self stringByRemovingPercentEncoding];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CFStringEncoding en = CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding);
        NSString *decoded = [self stringByReplacingOccurrencesOfString:@"+"
                                                            withString:@" "];
        decoded = (__bridge_transfer NSString *)
        CFURLCreateStringByReplacingPercentEscapesUsingEncoding(
                                                                NULL,
                                                                (__bridge CFStringRef)decoded,
                                                                CFSTR(""),
                                                                en);
        return decoded;
#pragma clang diagnostic pop
    }
}

- (NSString *)lj_md5String{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] lj_md5String];
}
- (NSString *)lj_base64EncodedString{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] lj_base64EncodedString];
}

- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    NSMutableDictionary *attr = [NSMutableDictionary new];
    attr[NSFontAttributeName] = font;
    if (lineBreakMode != NSLineBreakByWordWrapping) {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineBreakMode = lineBreakMode;
        attr[NSParagraphStyleAttributeName] = paragraphStyle;
    }
    CGRect rect = [self boundingRectWithSize:size
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:attr context:nil];
    result = rect.size;
    return result;
}

- (id)lj_jsonObject{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] lj_jsonObject];
}

- (CGFloat)lj_widthForFont:(UIFont *)font{
    CGSize size = [self sizeForFont:font size:CGSizeMake(HUGE, HUGE) mode:NSLineBreakByWordWrapping];
    return size.width;
}

- (NSData *)lj_dataValue{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (CGFloat)lj_heightForFont:(UIFont *)font width:(CGFloat)width{
    CGSize size = [self sizeForFont:font size:CGSizeMake(width, HUGE) mode:NSLineBreakByWordWrapping];
    return size.height;
}

- (NSURL *)lj_urlEncode{
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return nil;
    }
    return [NSURL URLWithString:[self lj_stringByURLEncode]];
}

@end
