//
//  ResultPageViewController.m
//  lottery
//
//  Created by toor on 16/2/3.
//  Copyright © 2016年 toor. All rights reserved.
//

#import "ResultPageViewController.h"

@interface ResultPageViewController ()

@end

@implementation ResultPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor orangeColor];
	
	UITextField* welcomeField = [UITextField new];
	welcomeField.text = @"恭喜以下师职工获得大奖";
	welcomeField.textColor = [UIColor whiteColor];
	welcomeField.font = [UIFont systemFontOfSize:22.0f];
	welcomeField.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:welcomeField];
	welcomeField.frame = CGRectMake(10, 10, self.view.frame.size.width-20, 80);

	if(self.resultArray.count>0)
	{
		float leftMargin	= 10;
		float topMargin		= 100;
		
		for (NSString* name in self.resultArray)
		{
			UITextField* nameField = [UITextField new];
			nameField.text = [name stringByReplacingOccurrencesOfString:@".jpg" withString:@""];
			nameField.textColor = [UIColor whiteColor];
			nameField.font = [UIFont systemFontOfSize:16.0f];
			[nameField sizeToFit];
			[self.view addSubview:nameField];
			nameField.frame = CGRectMake(leftMargin, topMargin, nameField.frame.size.width, nameField.frame.size.height);
			
			leftMargin+=10;
			leftMargin+=nameField.frame.size.width;
			
			if(leftMargin>self.view.frame.size.width-80)
			{
				leftMargin = 10;
				topMargin+=10;
				topMargin+=nameField.frame.size.height;
			}
		}
	}
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
