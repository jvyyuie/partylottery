//
//  Game2ViewController.m
//  lottery
//
//  Created by toor on 16/2/2.
//  Copyright © 2016年 toor. All rights reserved.
//

#import "Game2ViewController.h"
#import "BaseImageView.h"
#import "BaseButton.h"

@interface Game2ViewController ()
@property(nonatomic, strong) NSMutableArray* dataSource;
@property(nonatomic, strong) BaseButton* startButton;
@property(nonatomic) BOOL isRunning;
@property(nonatomic, strong) UITextField* nameField;
@property(nonatomic, weak) BaseImageView* lastView;
@end

@implementation Game2ViewController
-(UITextField*) nameField
{
	if(!_nameField)
	{
		_nameField = [UITextField new];
		[_nameField setTextColor:[UIColor grayColor]];
	}
	return _nameField;
}
-(BaseButton*) startButton
{
	if(!_startButton)
	{
		_startButton = [BaseButton new];
		[_startButton setTitle:@"准备" forState:UIControlStateNormal];
		[_startButton addTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
	}
	return _startButton;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"特等奖或补开";
	self.view.backgroundColor = [UIColor darkGrayColor];
	[self.view addSubview:self.startButton];
	[self.view addSubview:self.nameField];

	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"-"
																			 style: UIBarButtonItemStylePlain
																			target: self
																			action: nil];

	// 找到所有已经出过的人名，从datasource中删除已经存在的人名
	ResultData* resultData = [ResultData new];
	NSLog(@"%ld", self.dataSource.count);
	for (NSString* tmp in resultData.resultAll)
	{
		[self.dataSource removeObject:tmp];
	}
	NSLog(@"%ld", self.dataSource.count);

	
	for (NSString* sName in self.dataSource)
	{
		dispatch_async(dispatch_get_global_queue(0, 0), ^{
			NSString* smallName = [NSString stringWithFormat:@"%@_s", sName];
			NSString *path = [[NSBundle mainBundle] pathForResource:smallName ofType:@"jpg"];
			UIImage *image = [UIImage imageWithContentsOfFile:path];
			BaseImageView* img = [BaseImageView new];
			img.userName = sName;
			dispatch_async(dispatch_get_main_queue(), ^{
				img.image = image;
				float imgWidth = self.view.frame.size.width / 4;
				float imgHeight = imgWidth * image.size.height / image.size.width;
				img.frame = CGRectMake((self.view.frame.size.width-imgWidth/2)/2, (self.view.frame.size.height-imgHeight/2)/2, imgWidth/2, imgHeight/2);
				[self.view addSubview:img];
			});
		});
	}


}
-(void) stopGame
{
	self.isRunning=NO;
	self.startButton.hidden=YES;
	[self.navigationController setNavigationBarHidden:NO animated:YES];

	
	dispatch_async(dispatch_get_global_queue(0, 0), ^{
		[NSThread sleepForTimeInterval:2.0f];
		dispatch_async(dispatch_get_main_queue(), ^{
			ResultData* resultData = [ResultData new];
			[resultData.resultAll addObject:self.nameField.text];
			[resultData.result01 addObject:self.nameField.text];
			[resultData save];
			[UIView beginAnimations:nil context:NULL];
			[UIView setAnimationDuration:3.0f];
			self.lastView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
			[self.lastView setTransform:CGAffineTransformMakeScale(4.0f, 4.0f)];
			
			NSString* bigImage = [NSString stringWithFormat:@"%@.jpg", self.lastView.userName];
			self.lastView.image = [UIImage imageNamed:bigImage];
			[UIView commitAnimations];
		});
	});
}
-(void) startGame
{
	NSLog(@"特等奖开奖开始");
	
	// 将开始按钮改成结束按钮
	[self.startButton setTitle:@"开奖" forState:UIControlStateNormal];
	[self.startButton removeTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
	self.isRunning=YES;
	[self.startButton addTarget:self action:@selector(stopGame) forControlEvents:UIControlEventTouchUpInside];
	
	
	
	dispatch_async(dispatch_get_global_queue(0, 0), ^{
		dispatch_async(dispatch_get_main_queue(), ^{
			[self.navigationController setNavigationBarHidden:YES animated:YES];
		});
		@synchronized(self)
		{
			while (self.isRunning)
			{
				int value = arc4random() % self.view.subviews.count;
				id _Node = [self.view.subviews objectAtIndex:value];
				if ([_Node isKindOfClass:[BaseImageView class]])
				{
					dispatch_async(dispatch_get_main_queue(), ^{
						[self.view bringSubviewToFront:_Node];
						self.nameField.text = [_Node userName];
						self.lastView = _Node;
					});
				}
				[NSThread sleepForTimeInterval:0.001f];
			}
		}
	});
	
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void) viewDidLayoutSubviews
{
	[super viewDidLayoutSubviews];
	self.startButton.frame = CGRectMake((self.view.frame.size.width-100-10), (self.view.frame.size.height-100-10), 100, 100);
	self.nameField.frame = CGRectMake(10, 100, 100, 50);
}
-(NSMutableArray*) dataSource
{
	// 此处罗列的全部是教师
	if(!_dataSource)
	{
		_dataSource = [@[
						 @"某人", @"某人",
						 ] mutableCopy];
	}
	return _dataSource;
}
@end
