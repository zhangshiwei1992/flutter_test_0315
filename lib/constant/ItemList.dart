List<Item> itemList = [
  new Item(1, '商品', '1', false),
  new Item(2, '詹姆斯', '1', false),
  new Item(3, '杜兰特', '1', false),
  new Item(4, '库里', '1', false),
  new Item(5, '哈登', '1', false),
  new Item(6, '评价', '2', false),
  new Item(7, '威少', '2', false),
  new Item(8, '欧文', '2', false),
  new Item(9, '戴维斯', '2', false),
  new Item(10, '汤神', '2', false),
  new Item(11, '格林', '2', false),
  new Item(12, '详情', '3', false),
  new Item(13, '恩比德', '3', false),
  new Item(14, '恩比德1', '3', false),
  new Item(15, '恩比德2', '3', false),
  new Item(16, '恩比德3', '3', false),
  new Item(17, '恩比德4', '3', false),
  new Item(18, '恩比德5', '3', false),
  new Item(19, '恩比德6', '3', false),
  new Item(20, '恩比德7', '3', false),
  new Item(21, '恩比德8', '3', false),
  new Item(22, '恩比德9', '3', false),
  new Item(23, '保罗', '3', false),
  new Item(24, '乔丹', '3', false),
  new Item(25, '莱昂纳德', '3', false),
  new Item(25, '塔图姆', '3', false),
  new Item(27, '利拉德', '3', false),
  new Item(28, '推荐', '4', false),
  new Item(29, '乐福', '4', false),
  new Item(30, '科比', '4', false),
  new Item(31, '科比1', '4', false),
  new Item(32, '科比2', '4', false),
  new Item(33, '科比3', '4', false),
  new Item(34, '科比4', '4', false),
  new Item(35, '科比5', '4', false),
  new Item(36, '科比6', '4', false),
  new Item(37, '科比7', '4', false),
  new Item(38, '科比8', '4', false),
  new Item(39, '科比9', '4', false),
  new Item(40, '科比10', '4', false),
  new Item(41, '科比11', '4', false),
];

class Item {
  int id;
  String name;
  String property;
  bool selected;
  Item(
    this.id,
    this.name,
    this.property,
    this.selected,
  );
}
