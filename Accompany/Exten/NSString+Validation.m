//
//  NSString+Validation.m
//  CreditGroup
//
//  Created by ang on 14-4-2.
//  Copyright (c) 2014年 JPlay. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

/*判断输入的是否是手机号码*/
-(BOOL)isValidPhone
{
    NSString *stricterFilterString = @"\\b(1)[34578][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\\b";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    return [emailTest evaluateWithObject:self];
}

/*判断输入帐号是否为邮箱*/
-(BOOL)isValidEmail
{
    
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]";
    NSString *emailRegex = stricterFilterString ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

/*判断昵称只能是中英文、数字、下划线*/
-(BOOL)isValidNickName
{
    NSString *stricterFilterString =@"^[\u4e00-\u9fa5a-zA-Z0-9_]{1,19}$";
    NSPredicate *mtNickNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    return [mtNickNameTest evaluateWithObject:self];
}

/*帐号密码格式*/
-(BOOL)isValidPassword
{
    NSString *stricterFilterString = @"^[A-Za-z0-9!@#$%^&*.~/{}|()'\"?><,.`+-=_:;\\\\[]]\\\[]{6,16}$";
    //    NSLog(@"stricterFilterString = %@",stricterFilterString);
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    return [passwordTest evaluateWithObject:self];
}

/*判断是否有效的整数*/
-(BOOL)isValidInteger {
    NSString *stricterFilterString = @"^\\d+$";
    NSPredicate *integerTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    return [integerTest evaluateWithObject:self];
}

/*判断是否有效的正整数*/
-(BOOL)isValidPositiveInteger {
    NSString *stricterFilterString = @"^[0-9]*[1-9][0-9]*$";
    NSPredicate *integerTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    return [integerTest evaluateWithObject:self];
}

/*判断是否有效的浮点数*/
- (BOOL)isValidFloat {
    NSString *stricterFilterString = @"^(\\d*\\.)?\\d+$";
    NSPredicate *floatTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    return [floatTest evaluateWithObject:self];
}

/*判断是否有效的正浮点数*/
- (BOOL)isValidPositiveFloat {
    NSString *stricterFilterString = @"^(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9]*[1-9][0-9]*))$";
                                        
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    return [test evaluateWithObject:self];
}

/*判断是否为空字符串*/
- (BOOL)isEmpty {
    NSString *stricterFilterString = @"^\[ \t]*$";
    NSPredicate *emptyTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    return [emptyTest evaluateWithObject:self];
    
}

/*去除电话号码中的特殊字符*/
- (NSString*)extractNumber{
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@" @／：；（）¥「」、[]{}#%-*+=_\\|~＜＞$€^•’@#$%^&*()_+’\\”"];
    NSString *trimmedString = [[[self componentsSeparatedByCharactersInSet:doNotWant]componentsJoinedByString: @""] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    return trimmedString;
}
/*隐藏身份证中间的几个数字*/
- (NSString *)ittemDisposeIdcardNumber:(NSString *)idcardNumber;
{
    //星号字符串
    NSString *xinghaoStr = @"";
    //动态计算星号的个数
    for (int i  = 0; i < idcardNumber.length - 7; i++) {
        xinghaoStr = [xinghaoStr stringByAppendingString:@"*"];
    }
    //身份证号取前3后四中间以星号拼接
    idcardNumber = [NSString stringWithFormat:@"%@%@%@",[idcardNumber substringToIndex:3],xinghaoStr,[idcardNumber substringFromIndex:idcardNumber.length-4]];
    //返回处理好的身份证号
    return idcardNumber;
}


@end