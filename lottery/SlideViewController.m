//
//  SlideViewController.m
//  lottery
//
//  Created by toor on 16/2/2.
//  Copyright © 2016年 toor. All rights reserved.
//

#import "SlideViewController.h"
#import "BaseImageView.h"

@implementation SlideViewController
-(NSMutableArray*) dataSource
{
	if(!_dataSource)
	{
		_dataSource = [NSMutableArray array];
	}
	return _dataSource;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"跑马灯";
	self.view.backgroundColor = [UIColor blackColor];
	
	// 添加所有的照片
	// 然后使用动画技术从左向右移动一遍
	int leftMargin = -200;
	int i=1;

	for (NSString* sName in self.dataSource)
	{
		NSString *path = [[NSBundle mainBundle] pathForResource:sName ofType:@"jpg"];
		UIImage *image = [UIImage imageWithContentsOfFile:path];
		BaseImageView* img = [BaseImageView new];
		img.userName = sName;
		img.image = image;
		float imgWidth = self.view.frame.size.width / 3;
		float imgHeight = imgWidth * image.size.height / image.size.width;


		leftMargin = -100*i;
		i++;
		
		img.frame = CGRectMake(leftMargin, (self.view.frame.size.height-imgHeight)/2, imgWidth, imgHeight);
		[self.view addSubview:img];
	
	
		[UIView beginAnimations:nil context:NULL];
		float tm = (leftMargin*(-1)/50);
		NSLog(@"%f", tm);
		[UIView setAnimationDuration:tm];
		img.center = CGPointMake(0, 0);
		img.frame = CGRectMake(self.view.frame.size.width+leftMargin*(-1), (self.view.frame.size.height-imgHeight)/2, img.frame.size.width, img.frame.size.height);
		[UIView commitAnimations];

	}

	


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
