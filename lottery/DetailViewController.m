//
//  DetailViewController.m
//  lottery
//
//  Created by toor on 16/2/2.
//  Copyright © 2016年 toor. All rights reserved.
//

#import "DetailViewController.h"
#import "ResultData.h"
#import "BaseButton.h"
#import "ResultPageViewController.h"

@interface DetailViewController ()
@property (nonatomic, strong) BaseButton* game5_1_Button;// 五等奖25人
@property (nonatomic, strong) BaseButton* game5_2_Button;// 五等奖25人
@property (nonatomic, strong) BaseButton* game4_1_Button;// 四等奖20人
@property (nonatomic, strong) BaseButton* game4_2_Button;// 四等奖20人
@property (nonatomic, strong) BaseButton* game3_1_Button;// 三等奖30人
@property (nonatomic, strong) BaseButton* game2_1_Button;// 二等奖20人
@property (nonatomic, strong) BaseButton* game1_1_Button;// 一等奖5人
@property (nonatomic, strong) BaseButton* game0_1_Button;// 特等奖1人
@end

@implementation DetailViewController
-(BaseButton*) game5_1_Button
{
	if(!_game5_1_Button)
	{
		_game5_1_Button = [BaseButton new];
		[_game5_1_Button setTitle:@"五等奖（1/2）" forState:UIControlStateNormal];
		[_game5_1_Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[_game5_1_Button addTarget:self action:@selector(game51Clicked) forControlEvents:UIControlEventTouchUpInside];
		[_game5_1_Button setBackgroundColor:[UIColor lightGrayColor]];
	}
	return _game5_1_Button;
}
-(BaseButton*) game5_2_Button
{
	if(!_game5_2_Button)
	{
		_game5_2_Button = [BaseButton new];
		[_game5_2_Button setTitle:@"五等奖（2/2）" forState:UIControlStateNormal];
		[_game5_2_Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[_game5_2_Button addTarget:self action:@selector(game52Clicked) forControlEvents:UIControlEventTouchUpInside];
		[_game5_2_Button setBackgroundColor:[UIColor lightGrayColor]];
	}
	return _game5_2_Button;
}
-(BaseButton*) game4_1_Button
{
	if(!_game4_1_Button)
	{
		_game4_1_Button = [BaseButton new];
		[_game4_1_Button setTitle:@"四等奖（1/2）" forState:UIControlStateNormal];
		[_game4_1_Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[_game4_1_Button addTarget:self action:@selector(game41Clicked) forControlEvents:UIControlEventTouchUpInside];
		[_game4_1_Button setBackgroundColor:[UIColor lightGrayColor]];
	}
	return _game4_1_Button;
}
-(BaseButton*) game4_2_Button
{
	if(!_game4_2_Button)
	{
		_game4_2_Button = [BaseButton new];
		[_game4_2_Button setTitle:@"四等奖（2/2）" forState:UIControlStateNormal];
		[_game4_2_Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[_game4_2_Button addTarget:self action:@selector(game42Clicked) forControlEvents:UIControlEventTouchUpInside];
		[_game4_2_Button setBackgroundColor:[UIColor lightGrayColor]];
	}
	return _game4_2_Button;
}
-(BaseButton*) game3_1_Button
{
	if(!_game3_1_Button)
	{
		_game3_1_Button = [BaseButton new];
		[_game3_1_Button setTitle:@"三等奖" forState:UIControlStateNormal];
		[_game3_1_Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[_game3_1_Button addTarget:self action:@selector(game31Clicked) forControlEvents:UIControlEventTouchUpInside];
		[_game3_1_Button setBackgroundColor:[UIColor lightGrayColor]];
	}
	return _game3_1_Button;
}
-(BaseButton*) game2_1_Button
{
	if(!_game2_1_Button)
	{
		_game2_1_Button = [BaseButton new];
		[_game2_1_Button setTitle:@"二等奖" forState:UIControlStateNormal];
		[_game2_1_Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[_game2_1_Button addTarget:self action:@selector(game21Clicked) forControlEvents:UIControlEventTouchUpInside];
		[_game2_1_Button setBackgroundColor:[UIColor lightGrayColor]];
	}
	return _game2_1_Button;
}
-(BaseButton*) game1_1_Button
{
	if(!_game1_1_Button)
	{
		_game1_1_Button = [BaseButton new];
		[_game1_1_Button setTitle:@"一等奖" forState:UIControlStateNormal];
		[_game1_1_Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[_game1_1_Button addTarget:self action:@selector(game11Clicked) forControlEvents:UIControlEventTouchUpInside];
		[_game1_1_Button setBackgroundColor:[UIColor lightGrayColor]];
	}
	return _game1_1_Button;
}
-(BaseButton*) game0_1_Button
{
	if(!_game0_1_Button)
	{
		_game0_1_Button = [BaseButton new];
		[_game0_1_Button setTitle:@"特等奖" forState:UIControlStateNormal];
		[_game0_1_Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[_game0_1_Button addTarget:self action:@selector(game01Clicked) forControlEvents:UIControlEventTouchUpInside];
		[_game0_1_Button setBackgroundColor:[UIColor lightGrayColor]];
	}
	return _game0_1_Button;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"历史结果";
	self.view.backgroundColor = [UIColor whiteColor];
	self.view.backgroundColor = [UIColor darkGrayColor];
	[self.view addSubview:self.game5_1_Button];
	[self.view addSubview:self.game5_2_Button];
	[self.view addSubview:self.game4_1_Button];
	[self.view addSubview:self.game4_2_Button];
	[self.view addSubview:self.game3_1_Button];
	[self.view addSubview:self.game2_1_Button];
	[self.view addSubview:self.game1_1_Button];
	[self.view addSubview:self.game0_1_Button];
	
	ResultData* resultData = [ResultData new];
	self.game5_1_Button.enabled = (resultData.result51.count==0) ? NO : YES;
	self.game5_2_Button.enabled = (resultData.result52.count==0) ? NO : YES;
	self.game4_1_Button.enabled = (resultData.result41.count==0) ? NO : YES;
	self.game4_2_Button.enabled = (resultData.result42.count==0) ? NO : YES;
	self.game3_1_Button.enabled = (resultData.result31.count==0) ? NO : YES;
	self.game2_1_Button.enabled = (resultData.result21.count==0) ? NO : YES;
	self.game1_1_Button.enabled = (resultData.result11.count==0) ? NO : YES;
	self.game0_1_Button.enabled = (resultData.result01.count==0) ? NO : YES;

	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"-"
																			  style: UIBarButtonItemStylePlain
																			 target: self
																			 action: @selector(clearResultData)];
}
-(void) clearResultData
{
	NSString *title				= @"初始化";
	NSString *message			= @"清空开奖历史信息";
	NSString *cancelButtonTitle	= @"取消";
	NSString *otherButtonTitle	= @"确定清除";
	
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
	
	// Create the actions.
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
		NSLog(@"取消");
	}];
	
	UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
		NSLog(@"清空本地resultData数据");
		ResultData* resultData = [ResultData new];
		[resultData clearData];
	}];
	
	// Add the actions.
	[alertController addAction:cancelAction];
	[alertController addAction:otherAction];
	
	[self presentViewController:alertController animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) viewDidLayoutSubviews
{
	[super viewDidLayoutSubviews];
//	self.textView.frame = self.view.frame;
	float widthMargin = (self.view.frame.size.width-20-400)/3;
	
	self.game5_1_Button.frame = CGRectMake(10+(100+widthMargin)*0, 20, 100, 100);
	self.game5_2_Button.frame = CGRectMake(10+(100+widthMargin)*0, 150, 100, 100);
	self.game4_1_Button.frame = CGRectMake(10+(100+widthMargin)*1, 20, 100, 100);
	self.game4_2_Button.frame = CGRectMake(10+(100+widthMargin)*1, 150, 100, 100);
	self.game3_1_Button.frame = CGRectMake(10+(100+widthMargin)*2, 20, 100, 100);
	self.game2_1_Button.frame = CGRectMake(10+(100+widthMargin)*2, 150, 100, 100);
	self.game1_1_Button.frame = CGRectMake(10+(100+widthMargin)*3, 20, 100, 100);
	self.game0_1_Button.frame = CGRectMake(10+(100+widthMargin)*3, 150, 100, 100);
}

-(void) game51Clicked
{
	ResultPageViewController* nextView = [ResultPageViewController new];
	ResultData* resultData = [ResultData new];
	nextView.resultArray = resultData.result51;
	nextView.title = @"五等奖第一次开奖结果";
	[self.navigationController pushViewController:nextView animated:YES];
}
-(void) game52Clicked
{
	ResultPageViewController* nextView = [ResultPageViewController new];
	ResultData* resultData = [ResultData new];
	nextView.resultArray = resultData.result52;
	nextView.title = @"五等奖第二次开奖结果";
	[self.navigationController pushViewController:nextView animated:YES];
}
-(void) game41Clicked
{
	ResultPageViewController* nextView = [ResultPageViewController new];
	ResultData* resultData = [ResultData new];
	nextView.resultArray = resultData.result41;
	nextView.title = @"四等奖第一次开奖结果";
	[self.navigationController pushViewController:nextView animated:YES];
}
-(void) game42Clicked
{
	ResultPageViewController* nextView = [ResultPageViewController new];
	ResultData* resultData = [ResultData new];
	nextView.resultArray = resultData.result42;
	nextView.title = @"四等奖第二次开奖结果";
	[self.navigationController pushViewController:nextView animated:YES];
}
-(void) game31Clicked
{
	ResultPageViewController* nextView = [ResultPageViewController new];
	ResultData* resultData = [ResultData new];
	nextView.resultArray = resultData.result31;
	nextView.title = @"三等奖开奖结果";
	[self.navigationController pushViewController:nextView animated:YES];
}
-(void) game21Clicked
{
	ResultPageViewController* nextView = [ResultPageViewController new];
	ResultData* resultData = [ResultData new];
	nextView.resultArray = resultData.result21;
	nextView.title = @"二等奖开奖结果";
	[self.navigationController pushViewController:nextView animated:YES];
}
-(void) game11Clicked
{
	ResultPageViewController* nextView = [ResultPageViewController new];
	ResultData* resultData = [ResultData new];
	nextView.resultArray = resultData.result11;
	nextView.title = @"一等奖开奖结果";
	[self.navigationController pushViewController:nextView animated:YES];
}
-(void) game01Clicked
{
	ResultPageViewController* nextView = [ResultPageViewController new];
	ResultData* resultData = [ResultData new];
	nextView.resultArray = resultData.result01;
	nextView.title = @"特等奖开奖结果";
	[self.navigationController pushViewController:nextView animated:YES];
}
@end
