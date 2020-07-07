//
//  PageControl.swift
//  Landmarks
//
//  Created by Caleb Rudnicki on 7/6/20.
//  Copyright © 2020 Caleb Rudnicki. All rights reserved.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(context.coordinator,
                          action: #selector(Coordinator.updateCurrentPage(sender:)),
                          for: .valueChanged)

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var pageControl: PageControl
        
        init(_ pageControl: PageControl) {
            self.pageControl = pageControl
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            pageControl.currentPage = sender.currentPage
        }
    }
}
