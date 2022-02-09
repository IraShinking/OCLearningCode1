//
//  Song.m
//  OCProject
//
//  Created by IraShinking on 2022/1/30.
//

#import "Song.h"

@implementation Song
@synthesize songName,artistName,albumName,songTimeInMin,songTimeInSec;

-(instancetype)initWithSongName:(NSString *)theSongName initWithArtistName:(NSString *)theArtistName initWithAlbumName:(NSString *)theAlbumName initWithSongTimeInMin:(int)theSongTimeInMin initWithSongTimeInSec:(int)theSongTimeInSec
{
    self=[super init];
    if(self)
    {
        [self setSongName:theSongName setArtistName:theArtistName setAlbumName:theAlbumName setSongTimeInMin:theSongTimeInMin setSongTimeInSec:theSongTimeInSec];
    }
    return self;
}
-(void)setSongName:(NSString *)theSongName setArtistName:(NSString *)theArtistName setAlbumName:(NSString *)theAblumName setSongTimeInMin:(int)theSongTimeInMin setSongTimeInSec:(int)theSongTimeInSec
{
    songName=theSongName;
    artistName=theArtistName;
    albumName=theAblumName;
    songTimeInMin=theSongTimeInMin;
    songTimeInSec=theSongTimeInSec;
}
-(void)print
{
    NSLog(@"%-20s - %-10s - %-10s %i:%i",[songName UTF8String],[artistName UTF8String],[albumName UTF8String],songTimeInMin,songTimeInSec);
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"%-20s %-20s %20s %i:%i",[songName UTF8String],[artistName UTF8String],[albumName UTF8String],songTimeInMin,songTimeInSec];
}
@end
