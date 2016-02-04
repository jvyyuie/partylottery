//
//  BaseButton.m
//  lottery
//
//  Created by toor on 16/2/2.
//  Copyright © 2016年 toor. All rights reserved.
//

#import "BaseButton.h"

@implementation BaseButton

-(id) init
{
	self = [super init];
	if(self)
	{
//		[self setBackgroundColor:[UIColor colorWithRed:155.0/255.0f green:0/255.0f blue:0/255.0f alpha:1]];
		[self setBackgroundColor:[UIColor orangeColor]];
		[self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[self setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
		[self setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
		
		[self.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];

		[self.layer setMasksToBounds:YES];
		[self.layer setCornerRadius:10.0];
	}
	return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
