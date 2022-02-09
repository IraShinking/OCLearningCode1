//
//  Playlist.h
//  OCProject
//  include the playlist of several songs
//  Created by IraShinking on 2022/1/30.
//

#import"Song.h"

NS_ASSUME_NONNULL_BEGIN

@interface Playlist : NSObject

@property(nonatomic,copy) NSString* playlistName;
@property(nonatomic,copy) NSMutableArray* songList;

-(instancetype) initWithName:(NSString *)name;

-(void)addSong:(Song *)theSong;
-(void)removeSong:(Song *)theSong;

-(int)entries;
-(void)list;

-(void)sort;

-(BOOL)findSong:(Song *)theSongtoFind;

@end

NS_ASSUME_NONNULL_END
