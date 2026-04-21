import 'package:clothing_app/features/catalogue/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'catalogue_provider.g.dart';

@riverpod
List<Product> catalogue(CatalogueRef ref) {
  // Mock data — later this becomes an API call
  return [
    const Product(
      id: 1,
      title: 'Green Abaya',
      category: 'Abayas',
      imageUrl:
          'https://pamellaroland.com/cdn/shop/files/Pamella_Roland_S26_look_20.jpg?v=1758645706',
      price: 29.99,
    ),
    const Product(
      id: 2,
      title: 'Red Abaya',
      category: 'Abayas',
      imageUrl:
          'https://pamellaroland.com/cdn/shop/files/Pamella_Roland_S26_look_36.jpg?v=1758645706',
      price: 59.99,
    ),
    const Product(
      id: 3,
      title: 'Cosmic Abaya',
      category: 'Abayas',
      imageUrl:
          'https://pamellaroland.com/cdn/shop/files/Pamella_Roland_S26_look_35.jpg?v=1758645707',
      price: 119.99,
    ),
  ];
}
