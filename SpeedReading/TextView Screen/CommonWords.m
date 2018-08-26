//
//  CommonWords.m
//  SpeedReading
//
//  Created by Kit Clark-O'Neil on 2018-08-23.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "CommonWords.h"

@implementation CommonWords
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *words = @"he the have number she and like one I very want two they or need three we but use into you not can time it here go word them there do way him each is people her a was first us an were water me if be oil her all been part his up did day our down will now my about does some their with see would this at make could that in look many these on write so those under call other who over find no what of come than when to get then where for has long why from had name which by said place how out made thing new over after sound little around most work old back only man great right just sentence mean left much boy good through before year small off also take same away more give big near any say large between too live even below such know different under because follow well along another think kind next must show high open again tell last close every help country always never came plant food still ask father hand should went tree picture start read city air try become earth animal change set eye house play put light page spell end head letter point turn story found read example school study move paper world learn add group keep thought life don’t took cut land few began let home while saw leave car something got stop side hard knew talk night both heard walk mile together told grow sea often reached watch river without covered eat state second happened carry book later passed run face once pulled seem girl white cried begin mountain important gave hear family until decided miss song far brought stand list above ran remember idea young filled measure feet soon built hold men sometimes became listen body real gave draw music almost stood sing color enough didn’t figure sun complete seen travel question easy done fly fish better shown wait area best known fall mark short though stay dog low ago rest horse dry across produce birds dark during contain problem deep against bring room round upon understand piece full behind explain hot toward include door  front check special quickly notice hour heavy finally feel product warm certain shape wave clear carefully force common less correct fast fact easy slowly inch step early however street morning red since top usually base table black finally island whole ever several unit game building note strong course half nothing field green boat clear fire inside object among ball rule material cannot yet pair able thousand size rule";

        NSArray *myArray = [[NSArray alloc] init];
        myArray = [words componentsSeparatedByString:@" "];
        _commonWords = myArray;


    }
    return self;
}



@end
