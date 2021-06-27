//
//  ContentView.swift
//  Milestone1to3
//
//  Created by Bruce Gilmour on 2021-06-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Section(header: Text("Binding1")) {
                Binding1()
            }
            Section(header: Text("Binding2")) {
                Binding2()
            }
            Section(header: Text("ForEach1")) {
                ForEach1()
            }
            Section(header: Text("ForEach2")) {
                ForEach2()
            }
            Section(header: Text("ForEach3")) {
                ForEach3()
            }
        }
    }
}

struct Binding1: View {
    @State private var selection = 0

    var body: some View {
        let binding = Binding<Int>(
            get: { self.selection },
            set: { self.selection = $0 }
        )
        return Picker("Select a number", selection: binding) {
            ForEach(0 ..< 3) {
                Text("Item \($0)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct Binding2: View {
    @State private var agreedToTerms = false
    @State private var agreedToPrivacyPolicy = false
    @State private var agreedToEmails = false

    var body: some View {
        let agreedToAll = Binding<Bool>(
            get: { self.agreedToTerms && self.agreedToPrivacyPolicy && self.agreedToEmails },
            set: {
                self.agreedToTerms = $0
                self.agreedToPrivacyPolicy = $0
                self.agreedToEmails = $0
            }
        )
        return VStack {
            Toggle(isOn: $agreedToTerms) {
                Text("Agree to terms")
            }
            Toggle(isOn: $agreedToPrivacyPolicy) {
                Text("Agree to privacy policy")
            }
            Toggle(isOn: $agreedToEmails) {
                Text("Agree to receive shipping emails")
            }
            Toggle(isOn: agreedToAll) {
                Text("Agree to all")
            }
        }
    }
}

struct ForEach1: View {
    var body: some View {
        ForEach(0 ..< 20) {
            Text("Row \($0)")
        }
    }
}

struct ForEach2: View {
    let agents = ["Cyril", "Lana", "Pam", "Sterling"]
    var body: some View {
        ForEach(0 ..< agents.count) {
            Text(agents[$0])
        }
    }
}

struct ForEach3: View {
    let agents = ["Cyril", "Lana", "Pam", "Sterling"]
    var body: some View {
        ForEach(agents, id: \.self) {
            Text($0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
