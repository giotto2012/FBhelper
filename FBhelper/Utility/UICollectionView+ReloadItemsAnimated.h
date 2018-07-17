#import <UIKit/UIKit.h>

@interface UICollectionView (ReloadItemsAnimated)

- (void)reloadItemsAtIndexPaths:(NSArray *)indexPaths animated:(BOOL)animated;

@end
