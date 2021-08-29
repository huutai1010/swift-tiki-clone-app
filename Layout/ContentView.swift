//
//  ContentView.swift
//  Layout
//
//  Created by maihuutai on 25/08/2021.
//
import Foundation
import SwiftUI
import UIKit

struct ContentView: View {
    @State private var selectedIndex = 0
    @State private var textField: String = ""
    
    var body: some View {
        VStack {
            switch selectedIndex {
            case 0:
                HomeView(textField: $textField)
            case 1:
                SearchProducts_View()
            case 2:
                NavigationView {
                    Text("")
                        .navigationTitle(Text("Add"))
                }
            case 3:
                NavigationView {
                    Text("")
                        .navigationTitle(Text("Notification"))
                }
            case 4:
                NavigationView {
                    Text("")
                        .navigationTitle(Text("Setting"))
                }
            default:
                Text("")
            }
            Divider()
            TabbarView(selectedIndex: $selectedIndex)
        }
    }
}



struct HomeView: View {
    @Binding var textField: String
    
    let listProducts: [String] = ["Thịt, rau củ", "Bách Hoá", "Nhà Cửa", "Thiết bị số", "Điện Thoại", "Mẹ & Bé", "Làm Đẹp", "Gia Dụng", "Thời trang nữ", "Thời trang nam", "Giày nữ", "Túi nữ", "Giày nam", "Túi nam", "Balo & Vali", "Phụ kiện", "Đồng hồ", "Laptop", "Quốc Tế", "Voucher", "Xe", "Sách", "Điện Tử", "Thể Thao", "Máy Ảnh"]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("FREESHIP")
                        .italic()
                    Spacer()
                    Text("Tiki").font(.system(size: 30))
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "bell")
                    }
                    Button(action: {}) {
                        Image(systemName: "cart")
                    }
                }
                .padding(.horizontal)
                //Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading)
                    TextField("Bạn tìm gì hôm nay", text: $textField)
                }
                .padding(.vertical, 10)
                .background(Color(.systemGray5))
                .cornerRadius(5)
                .padding(.horizontal)
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(listProducts, id: \.self) { product in
                                    Text("\(product)")
                                        .font(.system(size: 15)).bold()
                                }
                            }
                        }
                        Image(systemName: "square.grid.2x2")
                            .font(.system(size: 20, weight: .bold))
                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                    //NavigationLink(
                    //destination: ContentView()) {
                    BannerSalesEventView()
                    
                    //}
                    ListWonderProducts_View()
                    
                }
                .navigationBarTitle(Text("Home"), displayMode: .inline)
                .navigationBarHidden(true)
            }
        }
    }
}

struct BannerSalesEventView: View {
    var body: some View {
        TabView {
            ForEach(1..<5) { _ in
                
                Image("Tiki")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.horizontal)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(width: UIScreen.main.bounds.width, height: 150)
    }
}


struct ListWonderProducts_View: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .padding(.horizontal)
            .frame(height: 200)
            .foregroundColor(Color(.systemGray6))
            .shadow(radius: 15)
            .overlay(
                VStack {
                    HStack {
                        Text("Giá Sốc Hôm Nay").italic().bold().padding(.leading).padding(.leading)
                        Spacer()
                        NavigationLink(
                            destination: ContentView(),
                            label: {
                                HStack {
                                    ForEach(57..<60) { num in
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(.red)
                                            .overlay(Text("\(num)").foregroundColor(.white))
                                    }
                                    
                                }.padding(.trailing).padding(.trailing)
                            })
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            let sales = ["dienthoai", "ao", "balo", "dongho", "laptop", "xedap"]
                            ForEach(sales, id: \.self) { sale in
                                VStack {
                                    ZStack(alignment: .init(horizontal: .leading, vertical: .top)) {
                                        Image(sale)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80, height: 80)
                                            .foregroundColor(.green)
                                            .cornerRadius(10)
                                            .padding(.leading, 5)
                                        Text("-50%")
                                            .background(Color.red)
                                            .foregroundColor(.white)
                                    }
                                    Text("3.250.000 đ")
                                        .padding(.bottom, 5)
                                    Text("Đã bán 10")
                                        .padding(.horizontal)
                                        .background(Color.black)
                                        .cornerRadius(15)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            )
    }
}


struct AddView: View {
    var body: some View {
        Text("Add View")
    }
}


struct SearchProducts_View: View {
    @State private var textField: String = ""
    private var columnProducts: [String] = ["Đồ Chơi - Mẹ & Bé", "Thực Phẩm Tươi Sống", "Điện Thoại - Máy Tính Bảng", "Lảm Đẹp - Sức Khoẻ", "Điện Gia Dụng", "Thời trang nữ", "Thời trang nam", "Giày - Dép nam", "Túi thời trang nam", "Balo và Vali", "Phụ kiện thời trang", "Đồng hồ và Trang sứcv",  "Laptop - Máy Vi Tính - Linh kiện", "Nhà cửa - Đời Sống", "Hàng Quốc Tế", "Bách hoá Online", "Thiết Bị Số - Phụ Kiện Số", "Voucher - Dịch vụ", "Ô Tô - Xe Máy - Xe Đạp", "Nhà Sách Tiki", "Điện Tử - Điện Lạnh", "Thể Thao - Dã Ngoại", "Máy Ảnh - Máy Quay Phim"]
    private var gridProducts: [String] = ["Vật phẩm phong thuỷ khác", "Hub Chuyển Đổi USB Type-C", "Bộ Chuyển Đổi Tín Hiệu HDMI/VGA/DVI/DP", "Quần kaki nam dài", "Sách tư duy - Kỹ năng sống", "Áo sơ mi nam tay dài trơn", "Nhà cửa - Đời Sống", "Thời trang nam", "Nhà Sách Tiki", "Thiết Bị Số - Phụ Kiện Số", "Đồ Chơi - Mẹ & Bé", "Thực Phẩm Tươi Sống", "Điện Thoại - Máy Tính Bảng", "Làm Đẹp - Sức Khoẻ", "Điện Gia Dụng", "Thời trang nữ", "Giày - Dép nữ", "Túi thời trang nữ", "Giày - Dép nam", "Túi thời trang nam"]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading)
                        TextField("Bạn tìm gì hôm nay", text: $textField)
                    }
                    .padding(.vertical, 10)
                    .background(Color(.systemGray5))
                    .cornerRadius(5)
                    .padding(.horizontal)
                    Image(systemName: "cart")
                        .padding(.trailing)
                }
                .navigationBarTitle("Search")
                .navigationBarHidden(true)
                Spacer()
                GeometryReader { geometry in
                    HStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            ForEach(self.columnProducts, id: \.self) { product in // Data structure interchangeable
                                VStack {
                                    Image("ao")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: UIScreen.main.bounds.width * 1/4)
                                        .padding(.horizontal)
                                    Text("\(product)")
                                        .font(.system(size: 15))
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    Divider()
                                    
                                }
                                .background(Color.blue.opacity(0.05))
                                .shadow(radius: 5)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width * 1/4)
                        //.border(Color.black, width: 3)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            let widthScreen: CGFloat = (UIScreen.main.bounds.width * 3/4)/3
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: widthScreen)), GridItem(.adaptive(minimum: widthScreen)), GridItem(.adaptive(minimum: widthScreen))], content: {
                                ForEach(self.gridProducts, id: \.self) { product in
                                    VStack {
                                        Image("ao")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: UIScreen.main.bounds.width * 1/4)
                                            .padding()
                                        Text("\(product)")
                                            .font(.system(size: 15))
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                        
                                    }
                                    .frame(width: widthScreen, height: 200)//.border(Color.black, width: 3)
                                }
                            })
                        }
                        .frame(width: UIScreen.main.bounds.width * 3/4)
                        //.border(Color.black, width: 3)
                    }
                }
            }
        }
    }
}


struct TabbarView: View {
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            let tabImageNames: [String] = ["house", "magnifyingglass", "plus.circle.fill", "bell", "line.horizontal.3"]
            ForEach(tabImageNames, id: \.self) { names in
                let _number = tabImageNames.firstIndex(of: names)!
                Spacer()
                Button(action: {
                    selectedIndex = _number
                }) {
                    Image(systemName: names)
                        .font(.system(size: names == "plus.circle.fill" ? 45 : 25))
                        .foregroundColor(selectedIndex == _number ? .green : .black)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        SearchProducts_View()
    }
}


