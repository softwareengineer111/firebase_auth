import '../models/sneaker.dart';
import 'constants.dart';

import 'package:faker_dart/faker_dart.dart';

List<T10Product> getProducts(count) {
  // List<T10Product> list = [];
  // list.add(T10Product(
  //     "Nike Shoes", "\$250", "\$350", Theme10Pot, "By Boots Category"));
  // list.add(T10Product(
  //     "Headset", "\$50", "\$100", t10_headphones, "By Headset Category"));
  // list.add(T10Product("Pot", "\$20", "\$30", t10_watch, "By Pots Category"));
  // list.add(
  //     T10Product("Watch", "\$250", "\$350", t10_ic_shoes, "By Watch Category"));
  // return list;

  final faker = Faker.instance;
  //final List<Map<String, dynamic>> data = [];

  List<T10Product> list = [];

  for (int i = 0; i < count; i++) {
    // final fakeName = faker.commerce.productName();
    // final fakeImageUrl = faker.image.loremPicsum.image();
    // final price = faker.commerce.price();

    // final item = {
    //   'filter': i.toString(),
    //   'number': price,
    //   'name': fakeName,
    //   'imageUrl': fakeImageUrl,
    // };

    list.add(T10Product(faker.commerce.productName(), faker.commerce.price(),
        faker.commerce.price(), t10_watch, faker.commerce.productMaterial()));
  }

  return list;
}

List<T10Product> getDashboardProducts(count) {
  final faker = Faker.instance;
  //final List<Map<String, dynamic>> data = [];

  List<T10Product> list = [];

  for (int i = 0; i < count; i++) {
    // final fakeName = faker.commerce.productName();
    // final fakeImageUrl = faker.image.loremPicsum.image();
    // final price = faker.commerce.price();

    // final item = {
    //   'filter': i.toString(),
    //   'number': price,
    //   'name': fakeName,
    //   'imageUrl': fakeImageUrl,
    // };

    list.add(T10Product(faker.commerce.productName(), faker.commerce.price(),
        "", t10_watch, ""));
  }

  return list;
  // List<T10Product> list = [];
  // list.add(T10Product(
  //     "Nike Shoes", "\$250", "\$350", t10_slider_3, "By Boots Category"));
  // list.add(T10Product(
  //     "Headset", "\$50", "\$100", t10_headphones, "By Headset Category"));
  // list.add(T10Product("Pot", "\$20", "\$30", Theme10Pot, "By Pots Category"));
  // list.add(
  //     T10Product("Watch", "\$250", "\$350", t10_watch, "By Watch Category"));
  // list.add(T10Product(
  //     "Headset", "\$50", "\$100", t10_slider_3, "By Headset Category"));
  // list.add(
  //     T10Product("Pot", "\$20", "\$30", t10_headphones, "By Pots Category"));
  // list.add(
  //     T10Product("Watch", "\$250", "\$350", Theme10Pot, "By Watch Category"));
  // list.add(
  //     T10Product("Watch", "\$250", "\$350", t10_watch, "By Watch Category"));
  // return list;
}

List<T10Images> getProfile() {
  List<T10Images> list = [];
  list.add(T10Images(t10_profile_1));
  list.add(T10Images(t10_profile_2));
  list.add(T10Images(t10_profile_3));
  list.add(T10Images(t10_profile_5));
  list.add(T10Images(t10_profile_6));
  return list;
}

List<T10Images> getDashboard(count) {
  List<T10Images> list = [];
  // list.add(T10Images(t10_slider_1));
  // list.add(T10Images(t10_slider_3));
  // list.add(T10Images(t10_slider_2));
  // list.add(T10Images(t10_slider_1));
  // list.add(T10Images(t10_slider_2));
  // return list;
  final faker = Faker.instance;
  //final List<Map<String, dynamic>> data = [];

  // List<T10Product> list = [];

  for (int i = 0; i < count; i++) {
    // final fakeName = faker.commerce.productName();
    // final fakeImageUrl = faker.image.loremPicsum.image();
    // final price = faker.commerce.price();

    // final item = {
    //   'filter': i.toString(),
    //   'number': price,
    //   'name': fakeName,
    //   'imageUrl': fakeImageUrl,
    // };

    list.add(T10Images(t10_slider_2));
  }

  return list;
}
