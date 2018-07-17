#import "UICollectionView+ReloadItemsAnimated.h"
#import <QuartzCore/QuartzCore.h>

@implementation UICollectionView (ReloadItemsAnimated)

- (void)reloadItemsAtIndexPaths:(NSArray *)indexPaths animated:(BOOL)animated {
    if (!animated) {
        [CATransaction begin];
        [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    }

    [self reloadItemsAtIndexPaths:indexPaths];

    if (!animated) {
        [CATransaction commit];
    }
}

@end
