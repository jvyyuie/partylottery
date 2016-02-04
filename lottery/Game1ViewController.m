//
//  Game1ViewController.m
//  lottery
//
//  Created by toor on 16/2/1.
//  Copyright © 2016年 toor. All rights reserved.
//

#import "Game1ViewController.h"
#import "BaseImageView.h"
#import "SlideViewController.h"
#import "BaseButton.h"

@interface Game1ViewController ()
@property(nonatomic, strong) NSMutableArray* dataSource;
@property (nonatomic, strong) BaseButton* startButton;
@property(nonatomic) NSInteger i;
@end

@implementation Game1ViewController
-(BaseButton*) startButton
{
	if(!_startButton)
	{
		_startButton = [BaseButton new];
		[_startButton setTitle:@"开奖" forState:UIControlStateNormal];
		[_startButton addTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
	}
	return _startButton;
}
-(void) stopGame
{
	NSLog(@"开始灭灯完成");
	[self.navigationController setNavigationBarHidden:NO animated:YES];
	float leftMargin=10;
	float topMargin=10;
	
	NSInteger cols=0;
	NSInteger rows=0;

	if(self.needOpenNumber==25)
	{
		cols = 5;
		rows = 5;
	}
	else if(self.needOpenNumber==20)
	{
		cols = 5;
		rows = 4;
	}
	else if(self.needOpenNumber==30)
	{
		cols = 6;
		rows = 5;
	}
	else if(self.needOpenNumber==5)
	{
		cols = 5;
		rows = 1;
	}
	
		
	// 找到所有没有灭的照片，放大这些照片
	ResultData* resultData = [ResultData new];
	NSInteger pi=0;
	for (id _Node in self.view.subviews)
	{
		if ([_Node isKindOfClass:[BaseImageView class]])
		{
			if([_Node alpha] == 1)
			{
				pi++;
				if(pi<=self.needOpenNumber)
				{
					BaseImageView* pp = (BaseImageView*)_Node;
					// 抽奖完成的时候，将获奖用户信息，存储到中奖数据表中
					[resultData.resultAll addObject:pp.userName];
					
					if ([self.title isEqualToString:@"五等奖第一次开奖"])						[resultData.result51 addObject:pp.userName];
					else if ([self.title isEqualToString:@"五等奖第二次开奖"])						[resultData.result52 addObject:pp.userName];
					else if ([self.title isEqualToString:@"四等奖第一次开奖"])						[resultData.result41 addObject:pp.userName];
					else if ([self.title isEqualToString:@"四等奖第二次开奖"])						[resultData.result42 addObject:pp.userName];
					else if ([self.title isEqualToString:@"三等奖开奖"])						[resultData.result31 addObject:pp.userName];
					else if ([self.title isEqualToString:@"二等奖开奖"])						[resultData.result21 addObject:pp.userName];
					else if ([self.title isEqualToString:@"一等奖开奖"])						[resultData.result11 addObject:pp.userName];
					
					[UIView beginAnimations:nil context:NULL];
					[UIView setAnimationDuration:3.0f];
					
					[self.view bringSubviewToFront:pp];
					pp.center = CGPointMake(0, 0);
					pp.frame = CGRectMake(leftMargin, topMargin, pp.frame.size.width, pp.frame.size.height);
					[pp setTransform:CGAffineTransformMakeScale(2.0f, 2.0f)];
					
					[UIView commitAnimations];
					
					leftMargin += (self.view.frame.size.width-20)/cols;
					if(leftMargin > self.view.frame.size.width-pp.frame.size.width)
					{
						topMargin+=(self.view.frame.size.height-10)/rows;
						leftMargin = 10;
					}
				}
			}
		}
	}
	[resultData save];
}

-(void) startGame
{
	dispatch_async(dispatch_get_global_queue(0, 0), ^{
		dispatch_async(dispatch_get_main_queue(), ^{
			NSLog(@"开始灭灯过程");
			self.startButton.hidden = YES;
			[self.navigationController setNavigationBarHidden:YES animated:YES];
		});
		NSInteger nowOpenNumber = 0;
		for (id _Node in self.view.subviews)
		{
			if ([_Node isKindOfClass:[BaseImageView class]])
			{
				if([_Node alpha] == 1)
				{
					nowOpenNumber++;
				}
			}
		}
		while (nowOpenNumber > self.needOpenNumber)
		{
			int value = arc4random() % [self.view.subviews count];
			id _Node = [self.view.subviews objectAtIndex:value];
			if ([_Node isKindOfClass:[BaseImageView class]])
			{
				if([_Node alpha]==1.0f)
				{
					dispatch_async(dispatch_get_main_queue(), ^{
						[_Node setAlpha:0.1f];
						NSLog(@"last %ld", nowOpenNumber);
					});
					nowOpenNumber--;
				}
			}
			[NSThread sleepForTimeInterval:0.01f];
//			[NSThread sleepForTimeInterval:0.001f];
		}
		if(nowOpenNumber == self.needOpenNumber)
		{
			dispatch_async(dispatch_get_main_queue(), ^{
				[self stopGame];
			});
		}
	});
}

-(NSMutableArray*) dataSource
{
	if(!_dataSource)
	{
		_dataSource = [@[
						 @"某人", @"某人",
						 ] mutableCopy];
	}
	return _dataSource;
}
-(void) gotoSlideView
{
	NSLog(@"跑马灯");
	SlideViewController* nextView = [SlideViewController new];

	ResultData* resultData = [ResultData new];
	if ([self.title isEqualToString:@"五等奖第一次开奖"])
	{
		NSLog(@"%@", resultData.result51);
		nextView.dataSource = resultData.result51;
	}
	else if ([self.title isEqualToString:@"五等奖第二次开奖"])
	{
		NSLog(@"%@", resultData.result52);
		nextView.dataSource = resultData.result52;
	}
	else if ([self.title isEqualToString:@"四等奖第一次开奖"])
	{
		NSLog(@"%@", resultData.result41);
		nextView.dataSource = resultData.result41;
	}
	else if ([self.title isEqualToString:@"四等奖第二次开奖"])
	{
		NSLog(@"%@", resultData.result42);
		nextView.dataSource = resultData.result42;
	}
	else if ([self.title isEqualToString:@"三等奖开奖"])
	{
		NSLog(@"%@", resultData.result31);
		nextView.dataSource = resultData.result31;
	}
	else if ([self.title isEqualToString:@"二等奖开奖"])
	{
		NSLog(@"%@", resultData.result21);
		nextView.dataSource = resultData.result21;
	}
	else if ([self.title isEqualToString:@"一等奖开奖"])
	{
		NSLog(@"%@", resultData.result11);
		nextView.dataSource = resultData.result11;
	}

	[self.navigationController pushViewController:nextView animated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.i=0;
	self.view.backgroundColor = [UIColor blackColor];
	[self.view addSubview:self.startButton];
	
	
	
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"跑马灯"
																			 style: UIBarButtonItemStylePlain
																			target: self
																			action: @selector(gotoSlideView)];

	
	
	
	ResultData* resultData = [ResultData new];
	for (NSString* sName in self.dataSource)
	{
		dispatch_async(dispatch_get_global_queue(0, 0), ^{
			dispatch_async(dispatch_get_main_queue(), ^{
				self.i++;
//				NSLog(@"ss %ld", self.i);
				[self.view bringSubviewToFront:self.startButton];
			});
			NSString* smallName = [NSString stringWithFormat:@"%@_s", sName];
			NSString *path = [[NSBundle mainBundle] pathForResource:smallName ofType:@"jpg"];
			UIImage *image = [UIImage imageWithContentsOfFile:path];
			BaseImageView* img = [BaseImageView new];
			img.userName = sName;
			if([resultData.resultAll containsObject:sName])
			{
				img.alpha=0.1f;
			}
			dispatch_async(dispatch_get_main_queue(), ^{
				img.image = image;
				float imgWidth = self.view.frame.size.width / 24;
				float imgHeightk = self.view.frame.size.height / 20;
				float imgHeight = imgWidth * image.size.height / image.size.width;
				img.frame = CGRectMake((self.i%24)*imgWidth, (self.i/24)*imgHeightk, imgWidth, imgHeight);
				[self.view addSubview:img];
			});
		});
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
	NSLog(@"内存警告");
}

-(void) viewDidLayoutSubviews
{
	[super viewDidLayoutSubviews];
	self.startButton.frame = CGRectMake((self.view.frame.size.width-100)/2, (self.view.frame.size.height-100)/2, 100, 100);
}

@end
