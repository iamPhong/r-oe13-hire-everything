categories = [
  {name: "Mẹ và Bé", icon: "sc1.png"},
  {name: "Giải trí - công nghệ", icon: "sc2.png"},
  {name: "Thể thao - Du lịch", icon: "sc3.png"},
  {name: "Sách - truyện", icon: "sc4.png"},
  {name: "Thời trang", icon: "sc5.png"},
  {name: "Bất động sản", icon: "sc6.png"},
  {name: "Xe cộ", icon: "sc7.png"},
  {name: "Gia dụng - điện - điện tử", icon: "sc8.png"},
  {name: "Dụng cụ văn phòng - sự kiện", icon: "sc9.png"},
  {name: "Sản phẩm khác", icon: "sc10.png"},
]
categories.each do |category|
  Category.create!(category)
end
