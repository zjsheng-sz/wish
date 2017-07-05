//
//  ViewController.m
//  Transfer
//
//  Created by autel on 17/7/5.
//  Copyright © 2017年 zhongjiasheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSDictionary *dic;
@property (nonatomic, strong) NSString *originString;
@property (nonatomic, strong) NSString *transferedString;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString *)stringFromPath:(NSString *)path{

    NSString *string = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    return string;
}

- (NSDictionary *)dictionaryFromPath:(NSString *)path{
 
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return dic;
}

- (NSString *)transfer{

    NSMutableString *mstr = [[NSMutableString alloc] initWithString:self.originString];
    for (NSString *key in self.dic.allKeys) {
        
        mstr replaceOccurrencesOfString:key withString:self.dic[@"key"] options:NSCaseInsensitiveSearch range:NSMakeRange(<#NSUInteger loc#>, <#NSUInteger len#>)
        
    }
    
}

@end
