//
//  DLViewController.m
//  DLCustomKeyBoard
//
//  Created by 18358588190@163.com on 06/14/2019.
//  Copyright (c) 2019 18358588190@163.com. All rights reserved.
//

#import "DLViewController.h"
#import "DLCustomField.h"
@interface DLViewController ()

@end

@implementation DLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	DLCustomField *field = [[DLCustomField alloc]initWithFrame:CGRectMake(80, 80, 250, 44)];
	field.placeholder = @"测试placeholder";
	[self.view addSubview:field];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
