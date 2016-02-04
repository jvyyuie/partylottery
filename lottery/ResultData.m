//
//  ResultData.m
//  lottery
//
//  Created by toor on 16/2/2.
//  Copyright © 2016年 toor. All rights reserved.
//

#import "ResultData.h"

@interface ResultData() <NSCoding>
@end

@implementation ResultData
-(NSMutableArray*) resultAll
{
	if(!_resultAll)
	{
		NSLog(@"初始化resultall");
		_resultAll = [NSMutableArray arrayWithCapacity:1];
	}
	return _resultAll;
}

-(NSMutableArray*) result51
{
	if(!_result51)
	{
		_result51 = [NSMutableArray arrayWithCapacity:1];
	}
	return _result51;
}
-(NSMutableArray*) result52
{
	if(!_result52)
	{
		_result52 = [NSMutableArray arrayWithCapacity:1];
	}
	return _result52;
}
-(NSMutableArray*) result41
{
	if(!_result41)
	{
		_result41 = [NSMutableArray arrayWithCapacity:1];
	}
	return _result41;
}
-(NSMutableArray*) result42
{
	if(!_result42)
	{
		_result42 = [NSMutableArray arrayWithCapacity:1];
	}
	return _result42;
}
-(NSMutableArray*) result31
{
	if(!_result31)
	{
		_result31 = [NSMutableArray arrayWithCapacity:1];
	}
	return _result31;
}
-(NSMutableArray*) result21
{
	if(!_result21)
	{
		_result21 = [NSMutableArray arrayWithCapacity:1];
	}
	return _result21;
}
-(NSMutableArray*) result11
{
	if(!_result11)
	{
		_result11 = [NSMutableArray arrayWithCapacity:1];
	}
	return _result11;
}
-(NSMutableArray*) result01
{
	if(!_result01)
	{
		_result01 = [NSMutableArray arrayWithCapacity:1];
	}
	return _result01;
}



-(void) save
{
	NSLog(@"储存数据");
	NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
	NSString *path = [doc stringByAppendingPathComponent:@"user.dat"];
//	NSLog(@"%@", self);
	BOOL result = [NSKeyedArchiver archiveRootObject:self toFile:path];
	if(result)
	{
		NSLog(@"存档成功");
	}
	else
	{
		NSLog(@"存档失败");
	}
//	NSLog(@"%d", result);
}
-(id) init
{
	NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
	NSString *path = [doc stringByAppendingPathComponent:@"user.dat"];
	id ret = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
	if(ret == nil)
	{
		ret = [super init];
	}
	return ret;
}
-(void) clearData
{
	NSLog(@"清空数据");
	NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
	NSString *path = [doc stringByAppendingPathComponent:@"user.dat"];
	NSFileManager *defaultManager = [NSFileManager defaultManager];
	if([defaultManager isDeletableFileAtPath:path])
	{
		NSLog(@"删除归档");
		[defaultManager removeItemAtPath:path error:nil];
	}
}



-(void) encodeWithCoder:(NSCoder *)aCoder
{
//	NSLog(@"encode");
	[aCoder encodeObject:self.result51             forKey:@"result51"];
	[aCoder encodeObject:self.result52           forKey:@"result52"];
	[aCoder encodeObject:self.result41         forKey:@"result41"];
	[aCoder encodeObject:self.result42              forKey:@"result42"];
	[aCoder encodeObject:self.result31              forKey:@"result31"];
	[aCoder encodeObject:self.result21           forKey:@"result21"];
	[aCoder encodeObject:self.result11           forKey:@"result11"];
	[aCoder encodeObject:self.result01         forKey:@"result01"];
	[aCoder encodeObject:self.resultAll       forKey:@"resultAll"];
}
-(id) initWithCoder:(NSCoder *)aDecoder
{
//	NSLog(@"pp decode");
	if (self=[super init])
	{
//		NSLog(@"decode");
		self.result51             = [aDecoder decodeObjectForKey:@"result51"];
		self.result52           = [aDecoder decodeObjectForKey:@"result52"];
		self.result41         = [aDecoder decodeObjectForKey:@"result41"];
		self.result42              = [aDecoder decodeObjectForKey:@"result42"];
		self.result31              = [aDecoder decodeObjectForKey:@"result31"];
		self.result21           = [aDecoder decodeObjectForKey:@"result21"];
		self.result11           = [aDecoder decodeObjectForKey:@"result11"];
		self.result01         = [aDecoder decodeObjectForKey:@"result01"];
		self.resultAll       = [aDecoder decodeObjectForKey:@"resultAll"];
	}
	return self;
}




@end
