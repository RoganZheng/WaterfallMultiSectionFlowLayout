//
//  ViewController.swift
//  waterfallMultiSection
//
//  Created by drogan Zheng on 2020/5/11.
//  Copyright © 2020 drogan Zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - ====== 公共成员变量 ======
  
  
  // MARK: - ====== 私有成员变量 ======
  
  
  // MARK: - ====== 覆写init初始化 ======
  
    
  // MARK: - ====== Life Cycle 生命周期 ======
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupParamter()
    setupUI()
    layoutPageSubviews()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    
  }
  
  deinit {
    print(">>>>>>>>> \(self) is deinit <<<<<<<")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  
  // MARK: - ====== View Initialization 初始化界面 ======
  // MARK: - ====== UI初始化 ======
  fileprivate func setupUI() {
    let layout = WaterfallMutiSectionFlowLayout()
    layout.delegate = self
    let collection = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
    collection.backgroundColor = .white
    collection.delegate = self
    collection.dataSource = self
    collection.register(testCell.self, forCellWithReuseIdentifier: testCell.identifiers)
    collection.register(testHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: testHeaderView.header)
    collection.register(testHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: testHeaderView.footer)
    view.addSubview(collection)
  }
  
  // MARK: - ====== 初始化布局 ======
  fileprivate func layoutPageSubviews() {
    
  }
  
  // MARK: - ====== 初始化参数 ======
  fileprivate func setupParamter() {
    self.title = "multiSectionWaterfall"
  }
  
  // MARK: - ====== 公共方法 ======
  
  
  // MARK: - ====== 私有方法 ======
  
  private func sectionName(section: Int) -> String {
    switch section {
    case 0:
      return "瀑布流布局"
    case 1:
      return "线性列表布局"
    case 2:
      return "九宫格布局"
    default:
      return ""
    }
  }
  
  // MARK: - ====== 子控件管理 ======
  
  
  // MARK: - ====== 网络请求 ======
  
  
  // MARK: - ====== 懒加载 ======
  
  
  // MARK: - ====== 测试代码 ======
  
  
}

// MARK: - ====== 代理实现 ======

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 3
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch section {
        // 瀑布流
    case 0:
      return 10
        // 线性
    case 1:
      return 8
        // 九宫格
    default:
      return 9
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: testCell.identifiers, for: indexPath) as! testCell
    cell.testLab.text = " \(indexPath.section) section \(indexPath.row) item"
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader {
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: testHeaderView.header, for: indexPath) as! testHeaderView
      header.testLab.text = "\(sectionName(section: indexPath.section)) header view"
      header.backgroundColor = .purple
      return header
    } else if kind == UICollectionView.elementKindSectionFooter {
      let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: testHeaderView.footer, for: indexPath) as! testHeaderView
      footer.testLab.text = "\(sectionName(section: indexPath.section)) footer view"
      footer.backgroundColor = .systemBlue
      return footer
    }
    return UICollectionReusableView()
  }
  
}

extension ViewController: WaterfallMutiSectionDelegate {
  func heightForRowAtIndexPath(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
    switch indexPath.section {
    case 0:
      return CGFloat((arc4random() % 3 + 1) * 30)
    case 1:
      return 135
    default:
      return 80
    }
  }
  
  func columnNumber(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> Int {
    switch section {
    case 0:
      return 2
    case 1:
      return 1
    default:
      return 3
    }
  }
  
  func referenceSizeForHeader(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGSize {
    return CGSize(width: self.view.frame.size.width, height: 40)
  }
  
  func referenceSizeForFooter(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGSize {
    return CGSize(width: self.view.frame.size.width, height: 30)
  }
  
  func insetForSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
  }
  
  
  func lineSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
    return 5
  }
  
  func interitemSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
    return 5
  }
  
  func spacingWithLastSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
    return 15
  }
}

class testCell: UICollectionViewCell {
  static let identifiers = "testcellssss"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configBaseView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configBaseView() {
    backgroundColor = .darkGray
    addSubview(testLab)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    testLab.frame = self.bounds
  }
  
  lazy var testLab: UILabel = {
    let tmp = UILabel()
    tmp.textColor = .white
    tmp.font = .systemFont(ofSize: 14)
    tmp.textAlignment = .center
    tmp.numberOfLines = 0
    return tmp
  }()
}

class testHeaderView: UICollectionReusableView {
  static let header = "testHeaderViewId"
  static let footer = "testFooterViewId"
  override init(frame: CGRect) {
    super.init(frame: frame)
    configBaseView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configBaseView() {
    addSubview(testLab)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    testLab.frame = bounds
  }
  
  lazy var testLab: UILabel = {
    let tmp = UILabel()
    tmp.textColor = .white
    tmp.font = .systemFont(ofSize: 14)
    tmp.textAlignment = .center
    tmp.numberOfLines = 0
    return tmp
  }()
}


