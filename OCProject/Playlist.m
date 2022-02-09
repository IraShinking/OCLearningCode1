//
//  Playlist.m
//  OCProject
//
//  Created by IraShinking on 2022/1/30.
//

#import "Playlist.h"

@implementation Playlist

@synthesize playlistName,songList;

-(instancetype) initWithName:(NSString *)name
{
    self=[super init];
    if(self)
    {
        playlistName=[NSString stringWithString:name];
        songList=[NSMutableArray array];
    }
    return self;
}

-(void)addSong:(Song *)theSong
{
    if([self findSong:theSong]==NO)
    {
        [songList addObject:theSong];
        NSLog(@"successful to add song to %s",[playlistName UTF8String]);
    }
    else
    {
        NSLog(@"The song is alreaday exist in %s",[playlistName UTF8String]);
    }
        
}
-(void)removeSong:(Song *)theSong
{
    if([self findSong:theSong]==YES)
    {
        [songList removeObject:theSong];
        NSLog(@"successful to remove song from %s",[playlistName UTF8String]);
    }
    else
    {
        NSLog(@"The song is not exist in %s",[playlistName UTF8String]);
    }
}

-(int)entries
{
    return (int)[songList count];
}
-(void)list
{
    NSLog(@"======= Content of %@ =========",playlistName);
      
      for(Song *theSong in songList)
      {
          [theSong print];
      }
      
      NSLog(@"============================");
}

-(void)sort
{
    //[songList sortUsingSelector:@selector(compareNames:)];
    [songList sortUsingComparator:^(id obj1,id obj2){
        return [[obj1 songName] compare: [obj2 songName]];
    }];
}

//可以变成重载containsObject方法
-(BOOL)findSong:(Song *)theSongtoFind
{
    for(Song *theSong in songList)
    {
        //对歌名全字匹配，找到了就是找到了
        NSString *theName=theSongtoFind.songName;
        if([theName caseInsensitiveCompare:theSong.songName]==NSOrderedSame)
        {
            return YES;
        }
    }
    return NO;
}


@end
