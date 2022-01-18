import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String? name;
  final String? numbers;

  Item({this.name, this.numbers});

  @override
  List<Object?> get props => [name, numbers];
}

List<Item> populateItems() {
  return [
    Item(name: 'Cupcake', numbers: '1.5'),
    Item(name: 'Donut', numbers: '1.6'),
    Item(name: 'Eclair', numbers: '2.0'),
    Item(name: 'Froyo', numbers: '2.2 – 2.2.3'),
    Item(name: 'Gingerbread', numbers: '2.3 – 2.3.2'),
    Item(name: 'Honeycomb', numbers: '3.0'),
    Item(name: 'Ice Cream Sandwich', numbers: '4.0 – 4.0.2'),
    Item(name: 'Jelly Bean', numbers: '4.1 – 4.1.2'),
    Item(name: 'Key Lime Pie', numbers: '4.4 – 4.4.4'),
  ];
}
