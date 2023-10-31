import 'dart:math';
import 'package:malina_mobile_app/features/beauty_shop/data/models/beauty_product.dart';
import 'package:malina_mobile_app/shared/constants/names.dart';
import 'package:malina_mobile_app/shared/constants/random.dart';

final List<BeautyProductModel> beautyProductsList = List.generate(
  random.nextInt(7) + 7,
  (index) => BeautyProductModel(
    id: DateTime.now().millisecondsSinceEpoch,
    supplierId: DateTime.now().millisecondsSinceEpoch,
    name: '${firstNames[random.nextInt(firstNames.length)]} Cosmetics',
    sizeOptions: List.generate(
      random.nextInt(3) + 1,
      (index) => random.nextInt(20) * 10 + 100,
    ),
    shortDescription:
        'Шампунь интенсивно восстанавливающий Hydro Intensive Repair Shampoo',
    longDescription:
        'Данный шампунь не содержит сульфатов, сочетание его натуральных компонентов обеспечивает мягкое очищение волос. Идеально подходит для сухой кожи головы, склонной к сухости и раздражению.Шампунь имеет в своем составе белок природного происхождения, гидролизованный коллаген, за счет чего восстанавливает поврежденные волосы, пропитывая их изнутри. Разработанный на основе керамидов и масла дерева моринги, шампунь способствует восстановлению влаги в волосах, которые подвергаются высоким температурным воздействиям. Шампунь имеет изысканный, терпкий, древесно-сладостный аромат. Палитра ароматов продукта состоит из масла удового дерева и шоколадных нот. Шампунь имеет кремообразную густую текстуру, которая отлично пенится, за счет этого нормы расхода шампуня радуют своей экономичностью. баланс шампуня идеально подойдет для работы с цветом, не вымывая его.',
    price: Random().nextInt(100) * 10 + 10,
    image: (random.nextInt(3) + 1).toString(),
    category: random.nextInt(100),
  ),
);
