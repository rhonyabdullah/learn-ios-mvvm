//
//  AddAccountScreen.swift
//  BankApp
//
//  Created by Rhony on 10/02/25.
//  Copyright © 2025 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct AddAccountScreen: View {

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var addAccountVM = AddAccountViewModel()

    var body: some View {
        Form {
            TextField("Name", text: $addAccountVM.name)
            Picker(
                selection: $addAccountVM.accountType,
                label: EmptyView()
            ) {
                ForEach(AccountType.allCases, id: \.self) { accountType in
                    Text(accountType.title).tag(accountType)
                }
            }.pickerStyle(SegmentedPickerStyle())
            TextField("Balance", text: self.$addAccountVM.balance)

            HStack {
                Spacer()
                Button("Submit") {
                    self.addAccountVM.createAccount() { success in
                        if success {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                Spacer()
            }
        }.navigationBarTitle("Add Account")
            .embedInNavigationView()

    }
}

#Preview {
    AddAccountScreen()
}
