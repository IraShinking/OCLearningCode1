//
//  Song.h
//  OCProject
//  include the information of a song
//
//  Created by IraShinking on 2022/1/30.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface Song : NSObject

@property(nonatomic,copy)NSString *songName,*artistName,*albumName;
@property(nonatomic)int songTimeInMin,songTimeInSec;

-(instancetype)initWithSongName:(NSString *)theSongName initWithArtistName:(NSString *)theArtistName initWithAlbumName:(NSString *)theAlbumName initWithSongTimeInMin:(int)theSongTimeInMin initWithSongTimeInSec:(int)theSongTimeInSec;
-(void)setSongName:(NSString *)theSongName setArtistName:(NSString *)theArtistName setAlbumName:(NSString *)theAblumName setSongTimeInMin:(int)theSongTimeInMin setSongTimeInSec:(int)theSongTimeInSec;
-(void)print;
-(NSString *)description;



@end

NS_ASSUME_NONNULL_END
