//
//  ViewController.m
//  lottery
//
//  Created by toor on 16/2/1.
//  Copyright © 2016年 toor. All rights reserved.
//

#import "ViewController.h"
#import "Game1ViewController.h"
#import "Game2ViewController.h"
#import "BaseButton.h"
#import "ResultData.h"
#import "DetailViewController.h"

@interface ViewController ()
@property (nonatomic, strong) BaseButton* game5_1_Button;// 五等奖25人
@property (nonatomic, strong) BaseButton* game5_2_Button;// 五等奖25人
@property (nonatomic, strong) BaseButton* game4_1_Button;// 四等奖20人
@property (nonatomic, strong) BaseButton* game4_2_Button;// 四等奖20人
@property (nonatomic, strong) BaseButton* game3_1_Button;// 三等奖30人
@property (nonatomic, strong) BaseButton* game2_1_Button;// 二等奖20人
@property (nonatomic, strong) BaseButton* game1_1_Button;// 一等奖5人
@property (nonatomic, strong) BaseButton* game0_1_Button;// 特等奖1人
@end

@implementation ViewController
-(BaseButton*) game5_1_Button
{
	if(!_game5_1_Button)
	{
		_game5_1_Button = [BaseButton new];
		[_game5_1_Button setTitle:@"五等奖（1/2）" forState:UIControlStateNormal];
		[_game5_1_Button addTarget:self action:@selector(game51Clicked) forControlEvents:UIControlEventTouchUpInside];
	}
	return _game5_1_Button;
}
-(BaseButton*) game5_2_Button
{
	if(!_game5_2_Button)
	{
		_game5_2_Button = [BaseButton new];
		[_game5_2_Button setTitle:@"五等奖（2/2）" forState:UIControlStateNormal];
		[_game5_2_Button addTarget:self action:@selector(game52Clicked) forControlEvents:UIControlEventTouchUpInside];
	}
	return _game5_2_Button;
}
-(BaseButton*) game4_1_Button
{
	if(!_game4_1_Button)
	{
		_game4_1_Button = [BaseButton new];
		[_game4_1_Button setTitle:@"四等奖（1/2）" forState:UIControlStateNormal];
		[_game4_1_Button addTarget:self action:@selector(game41Clicked) forControlEvents:UIControlEventTouchUpInside];
	}
	return _game4_1_Button;
}
-(BaseButton*) game4_2_Button
{
	if(!_game4_2_Button)
	{
		_game4_2_Button = [BaseButton new];
		[_game4_2_Button setTitle:@"四等奖（2/2）" forState:UIControlStateNormal];
		[_game4_2_Button addTarget:self action:@selector(game42Clicked) forControlEvents:UIControlEventTouchUpInside];
	}
	return _game4_2_Button;
}
-(BaseButton*) game3_1_Button
{
	if(!_game3_1_Button)
	{
		_game3_1_Button = [BaseButton new];
		[_game3_1_Button setTitle:@"三等奖" forState:UIControlStateNormal];
		[_game3_1_Button addTarget:self action:@selector(game31Clicked) forControlEvents:UIControlEventTouchUpInside];
	}
	return _game3_1_Button;
}
-(BaseButton*) game2_1_Button
{
	if(!_game2_1_Button)
	{
		_game2_1_Button = [BaseButton new];
		[_game2_1_Button setTitle:@"二等奖" forState:UIControlStateNormal];
		[_game2_1_Button addTarget:self action:@selector(game21Clicked) forControlEvents:UIControlEventTouchUpInside];
	}
	return _game2_1_Button;
}
-(BaseButton*) game1_1_Button
{
	if(!_game1_1_Button)
	{
		_game1_1_Button = [BaseButton new];
		[_game1_1_Button setTitle:@"一等奖" forState:UIControlStateNormal];
		[_game1_1_Button addTarget:self action:@selector(game11Clicked) forControlEvents:UIControlEventTouchUpInside];
	}
	return _game1_1_Button;
}
-(BaseButton*) game0_1_Button
{
	if(!_game0_1_Button)
	{
		_game0_1_Button = [BaseButton new];
		[_game0_1_Button setTitle:@"特等奖" forState:UIControlStateNormal];
		[_game0_1_Button addTarget:self action:@selector(game01Clicked) forControlEvents:UIControlEventTouchUpInside];
	}
	return _game0_1_Button;
}
- (void)viewDidLoad
{
	[super viewDidLoad];
	self.title = @"LILY英语2016年会";
	self.view.backgroundColor = [UIColor darkGrayColor];
	[self.view addSubview:self.game5_1_Button];
	[self.view addSubview:self.game5_2_Button];
	[self.view addSubview:self.game4_1_Button];
	[self.view addSubview:self.game4_2_Button];
	[self.view addSubview:self.game3_1_Button];
	[self.view addSubview:self.game2_1_Button];
	[self.view addSubview:self.game1_1_Button];
	[self.view addSubview:self.game0_1_Button];
}


-(void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	ResultData* resultData = [ResultData new];
	NSString* tmp = [NSString stringWithFormat:@"%ld", [resultData.resultAll count]];
	
	

	self.game5_1_Button.enabled = (resultData.result51.count!=0) ? NO : YES;
	self.game5_2_Button.enabled = (resultData.result52.count!=0) ? NO : YES;
	self.game4_1_Button.enabled = (resultData.result41.count!=0) ? NO : YES;
	self.game4_2_Button.enabled = (resultData.result42.count!=0) ? NO : YES;
	self.game3_1_Button.enabled = (resultData.result31.count!=0) ? NO : YES;
	self.game2_1_Button.enabled = (resultData.result21.count!=0) ? NO : YES;
	self.game1_1_Button.enabled = (resultData.result11.count!=0) ? NO : YES;
	self.game0_1_Button.enabled = (resultData.result01.count!=0) ? NO : YES;
	
	
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: tmp
																			 style: UIBarButtonItemStylePlain
																			target: self
																			action: @selector(gotoDetailView)];
}
-(void) gotoDetailView
{
	NSLog(@"历史结果观察页");
	[self.navigationController pushViewController:[DetailViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

-(void) viewDidLayoutSubviews
{
	[super viewDidLayoutSubviews];
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
	Game1ViewController* nextView = [Game1ViewController new];
	nextView.needOpenNumber = 25;
	nextView.title = @"五等奖第一次开奖";
	[self.navigationController pushViewController:nextView animated:YES];
}
-(void) game52Clicked
{
	Game1ViewController* nextView = [Game1ViewController new];
	nextView.needOpenNumber = 25;
	nextView.title = @"五等奖第二次开奖";
	[self.navigationController pushViewController:nextView animated:YES];
}
-(void) game41Clicked
{
	Game1ViewController* nextView = [Game1ViewController new];
	nextView.needOpenNumber = 20;
	nextView.title = @"四等奖第一次开奖";
	[self.navigationController pushViewController:nextView animated:YES];
}
-(void) game42Clicked
{
	Game1ViewController* nextView = [Game1ViewController new];
	nextView.needOpenNumber = 20;
	nextView.title = @"四等奖第二次开奖";
	[self.navigationController pushViewController:nextView animated:YES];
}
-(void) game31Clicked
{
	Game1ViewController* nextView = [Game1ViewController new];
	nextView.needOpenNumber = 30;
	nextView.title = @"三等奖开奖";
	[self.navigationController pushViewController:nextView animated:YES];
}
-(void) game21Clicked
{
	Game1ViewController* nextView = [Game1ViewController new];
	nextView.needOpenNumber = 20;
	nextView.title = @"二等奖开奖";
	[self.navigationController pushViewController:nextView animated:YES];
}
-(void) game11Clicked
{
	Game1ViewController* nextView = [Game1ViewController new];
	nextView.needOpenNumber = 5;
	nextView.title = @"一等奖开奖";
	[self.navigationController pushViewController:nextView animated:YES];
}
-(void) game01Clicked
{
	[self.navigationController pushViewController:[Game2ViewController new] animated:YES];
}
@end
