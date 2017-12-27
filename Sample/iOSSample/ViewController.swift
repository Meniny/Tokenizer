//
//  ViewController.swift
//  iOSSample
//
//  Created by 李二狗 on 2017/12/27.
//  Copyright © 2017年 Meniny. All rights reserved.
//

import UIKit
import Tokenizer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let stackoverflow = "Stack Overflow is the largest, most trusted online community for developers to learn, share their programming knowledge, and build their careers."
        let baidu = "全球最大的中文搜索引擎、最大的中文网站。1999年底,身在美国硅谷的李彦宏看到了中国互联网及中文搜索引擎服务的巨大发展潜力，抱着技术改变世界的梦想，他毅然辞掉硅谷的高薪工作，携搜索引擎专利技术，于 2000年1月1日在中关村创建了百度公司。"
        
        dump(stackoverflow.tokenize())
        dump(Tokenizer.tokenize(text: baidu))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

