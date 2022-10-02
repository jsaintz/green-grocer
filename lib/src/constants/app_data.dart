import 'package:green_grocer/src/models/cart_item_model.dart';
import 'package:green_grocer/src/models/item_model.dart';
import 'package:green_grocer/src/models/order_model.dart';
import 'package:green_grocer/src/models/user_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/images/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/images/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/images/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/images/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/images/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/images/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais',
];

List<CartItemModel> cartItems = [
  CartItemModel(
    itemModel: apple,
    quantity: 2,
  ),
  CartItemModel(
    itemModel: mango,
    quantity: 1,
  ),
  CartItemModel(
    itemModel: guava,
    quantity: 3,
  ),
];

UserModel user = UserModel(
  name: 'Jonatas Santos',
  email: 'jon_@gmail.com',
  phone: '99 9 9999-9999',
  cpf: '999.999.999-99',
  password: '',
);

List<OrderModel> orders = [
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2022-06-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2022-06-08 11:00:10.458',
    ),
    id: 'a65s4d6a2s1d6a5s',
    status: 'refunded',
    total: 11.5,
    items: [
      CartItemModel(
        itemModel: guava,
        quantity: 2,
      ),
    ],
  ),
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2022-10-02 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2022-10-03 11:00:10.458',
    ),
    id: 'asd6a54da6s2d1',
    status: 'delivered',
    total: 11.0,
    items: [
      CartItemModel(
        itemModel: apple,
        quantity: 2,
      ),
      CartItemModel(
        itemModel: mango,
        quantity: 2,
      ),
    ],
  ),
];
