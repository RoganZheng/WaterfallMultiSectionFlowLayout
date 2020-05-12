# WaterfallMultiSectionFlowLayout

#### 基于 UICollectionViewFlowLayout 实现，支持多 section 场景下瀑布流、线性排列、九宫格样式，纯 swift 实现。

![](https://upload-images.jianshu.io/upload_images/1243805-194b0a6584c37ccf.gif?imageMogr2/auto-orient/strip)

# 使用方法
### 1. 初始化

```
let layout = WaterfallMutiSectionFlowLayout()
layout.delegate = self
let collection = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
```

### 2. 代理实现
#### 2.1 必须实现代理方法
```
/// collectionItem高度
func heightForRowAtIndexPath(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat
```
#### 2.2 可选实现代理方法
```
  /// 每个section 列数（默认2列）
  @objc optional func columnNumber(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> Int
  
  /// header高度（默认为0）
  @objc optional func referenceSizeForHeader(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGSize
  
  /// footer高度（默认为0）
  @objc optional func referenceSizeForFooter(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGSize
  
  /// 每个section 边距（默认为0）
  @objc optional func insetForSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> UIEdgeInsets
  
  /// 每个section item上下间距（默认为0）
  @objc optional func lineSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat
  
  /// 每个section item左右间距（默认为0）
  @objc optional func interitemSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat
  
  /// section头部header与上个section尾部footer间距（默认为0）
  @objc optional func spacingWithLastSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat
```

----
我的博客链接：[简书](https://www.jianshu.com/u/38c0c4089e64) [掘金](https://juejin.im/user/5cc7af9df265da034e7e997a)
