//
//  MusicCollection.m
//  OCProject
//
//  Created by IraShinking on 2022/1/30.
//

#import "MusicCollection.h"

@implementation MusicCollection

@synthesize collectionName,libary,listOfPlayList;

-(instancetype)initWithName:(NSString *)theCollectionName
{
    self=[super init];
    if(self)
    {
        collectionName=[NSString stringWithString:theCollectionName];
        libary=[[Playlist alloc]initWithName:@"libary"];
        listOfPlayList=[NSMutableArray array];
    }
    return self;
}

/* 以下方法都要求传入类 类本身要先存在 而不是直接传入一个名字 再检查类是否存在 */
/* 全部都依赖于类已经创建并且存在 */

//默认直接添加到主列表
-(void)addSong:(Song *)theSong
{
    [libary addSong:theSong];
}
-(void)removeSong:(Song *)theSong
{
    [libary removeSong:theSong];
}
//如果一首歌不在主列表中，添加进去
//如果指定的播放列表不存在，将这个播放列表添加到集合里面
-(void)addSong:(Song *)theSong addToPlayList:(Playlist *)thePlaylist
{
    //集合里面存在这个播放列表，直接添加；不存在，将播放列表添加到集合，然后再添加
    if([self checkPlayList:thePlaylist]==YES)
    {
        [thePlaylist addSong:theSong];
        
    }
    else
    {
        [self addPlayList:thePlaylist];
        [thePlaylist addSong:theSong];
        
    }
    
    //无论有没有 都加到libary试试看
    [libary addSong:theSong];
    
}
-(void)removeSong:(Song *)theSong removeFromPlayList:(Playlist *)thePlaylist
{
    //集合里面存在这个播放列表，直接删除；不存在，报错
    if([self checkPlayList:thePlaylist]==YES)
    {
        [thePlaylist removeSong:theSong];
        [libary removeSong:theSong];
    }
    else
    {
        NSLog(@"This playlist is not exist in collection");
    }
}

-(void)addPlayList:(Playlist *)thePlayList
{
    if([self checkPlayList:thePlayList]==NO)
    {
        [listOfPlayList addObject:thePlayList];
    }
    else
    {
        NSLog(@"This playlist is already existed!");
    }
}

-(void)removePlayList:(Playlist *)thePlayList
{
    if([self checkPlayList:thePlayList]==YES)
    {
        [listOfPlayList removeObject:thePlayList];
        NSLog(@"Successfuly remove the playlist!");
    }
    else
    {
        NSLog(@"The PlayList doesnt exist");
    }
}

-(int)entries
{
    //not include libary,just count the number of playlists
    return (int)[listOfPlayList count];
}
-(void)list
{
    NSLog(@"=================== Content of %@ =========",collectionName);
      
    [libary list];
    for(Playlist *thePlayList in listOfPlayList)
    {
        [thePlayList list];
    }
      
      NSLog(@"============================");
}

-(void)sort
{
    //[listOfPlayList sortUsingSelector:@selector(compareNames:)];
    [listOfPlayList sortUsingComparator:^(id obj1,id obj2){
        return [[obj1 playlistName] compare: [obj2 playlistName]];
    }];
    [libary sort];
    for(Playlist *nextPlayList in listOfPlayList)
    {
        [nextPlayList sort];
    }
}

-(BOOL)checkPlayList:(Playlist *)thePlayList
{
    for(Playlist *nextPlayList in listOfPlayList)
    {
        NSString *playListName=nextPlayList.playlistName;
        if([playListName caseInsensitiveCompare:thePlayList.playlistName]==NSOrderedSame)
        {
            return YES;
        }
    }
    return NO;
}

@end
