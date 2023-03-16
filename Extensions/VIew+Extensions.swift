//
//  VIew+Extensions.swift
//  MENUApp
//
//  Created by Mac on 16.3.23..
//

import SwiftUI


extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct ListBackgroundModifier: ViewModifier {

    @ViewBuilder
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .scrollContentBackground(.hidden)
        } else {
            content
        }
    }
}


extension UICollectionReusableView {
    override open var backgroundColor: UIColor? {
        get { .clear }
        set { super.backgroundColor = .clear }
    }
}
