//
//  BaseNavigationViewController.m
//  lottery
//
//  Created by toor on 16/2/3.
//  Copyright © 2016年 toor. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.navigationBar.translucent=NO;
	[self.navigationBar setBarTintColor:[UIColor orangeColor]];
	[self.navigationBar setTintColor:[UIColor whiteColor]];
//	[self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//												[UIColor whiteColor], UITextAttributeTextColor,
//												[UIColor lightGrayColor], UITextAttributeTextShadowColor,
//												nil]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
