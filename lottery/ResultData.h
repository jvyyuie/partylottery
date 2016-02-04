//
//  ResultData.h
//  lottery
//
//  Created by toor on 16/2/2.
//  strongright © 2016年 toor. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ResultData : NSObject

@property(nonatomic, strong) NSMutableArray* result51;
@property(nonatomic, strong) NSMutableArray* result52;
@property(nonatomic, strong) NSMutableArray* result41;
@property(nonatomic, strong) NSMutableArray* result42;
@property(nonatomic, strong) NSMutableArray* result31;
@property(nonatomic, strong) NSMutableArray* result21;
@property(nonatomic, strong) NSMutableArray* result11;
@property(nonatomic, strong) NSMutableArray* result01;
@property(nonatomic, strong) NSMutableArray* resultAll;

-(void) encodeWithCoder:(NSCoder *)aCoder;
-(id) initWithCoder:(NSCoder *)aDecoder;

-(void) save;
-(id) init;
-(void) clearData;
@end
