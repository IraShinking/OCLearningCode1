//
//  MusicCollection.h
//  OCProject
//  include several playlists
//  Created by IraShinking on 2022/1/30.
//

#import "Playlist.h"

NS_ASSUME_NONNULL_BEGIN

@interface MusicCollection : NSObject

@property(nonatomic,copy) NSString *collectionName;
@property(nonatomic,copy)NSMutableArray *listOfPlayList;
@property(nonatomic,copy)Playlist *libary;

-(instancetype)initWithName:(NSString *)theCollectionName;

-(void)addSong:(Song *)theSong;
-(void)removeSong:(Song *)theSong;

-(void)addSong:(Song *)theSong addToPlayList:(Playlist *)thePlaylist;
-(void)removeSong:(Song *)theSong removeFromPlayList:(Playlist *)thePlaylist;

//在集合里添加和删除播放列表
-(void)addPlayList:(Playlist *)thePlayList;
-(void)removePlayList:(Playlist *)thePlayList;

-(int)entries;
-(void)list;

-(void)sort;

-(BOOL)checkPlayList:(Playlist *)thePlayList;



@end

NS_ASSUME_NONNULL_END
