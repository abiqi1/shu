import 'package:shu/features/catalogue/models/product.dart';
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
      description: 'A beautiful green abaya perfect for any occasion.',
    ),
    const Product(
      id: 2,
      title: 'Red Gown',
      category: 'Gowns',
      imageUrl:
          'https://pamellaroland.com/cdn/shop/files/Pamella_Roland_S26_look_36.jpg?v=1758645706',
      price: 59.99,
      description: 'An elegant red gown that will make you stand out.',
    ),
    const Product(
      id: 3,
      title: 'Cosmic Dress',
      category: 'OccasionWear',
      imageUrl:
          'https://pamellaroland.com/cdn/shop/files/Pamella_Roland_S26_look_35.jpg?v=1758645707',
      price: 119.99,
      description: 'A stunning cosmic dress that is out of this world.',
    ),
  ];
}
