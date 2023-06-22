import 'package:firebase/pages/new_bottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:faker_dart/faker_dart.dart';

List<Map<String, dynamic>> generateFakeData(int count) {
  final faker = Faker.instance;
  final List<Map<String, dynamic>> data = [];

  for (int i = 0; i < count; i++) {
    final fakeName = faker.commerce.productName();
    final fakeImageUrl = faker.image.loremPicsum.image();
    final price = faker.commerce.price();

    final item = {
      'filter': i.toString(),
      'number': price,
      'name': fakeName,
      'imageUrl': fakeImageUrl,
    };

    data.add(item);
  }

  return data;
}

class RandomUserScreen extends StatelessWidget {
  final List<Map<String, dynamic>> fakeData = generateFakeData(10000);

  FirebaseAuth auth = FirebaseAuth.instance;
  // final List<Map<String, dynamic>> users = List.generate(
  //     10000,
  //     (_) => {
  //           'name': Faker().person.name(),
  //           'email': Faker().internet.email(),
  //           'phone': Faker().image.image(),
  //         });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Products'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Perform logout actions here
              // For example, navigate to the login screen
              //Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);

              auth.signOut();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavigationScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: fakeData.length,
        itemBuilder: (context, index) {
          final item = fakeData[index];

          print(item['imageUrl']);

          return ListTile(
            title: Text(item['filter'] + " " + item['name']),
            leading: Image.network(item['imageUrl']),
            trailing: Text(item['number']),
          );
        },
      ),
      // body: ListView.builder(
      //   itemCount: fakeData.length,
      //   itemBuilder: (context, index) {
      //     final user = fakeData[index];
      //     return ListTile(
      //       title: Text(user['name']),
      //       subtitle: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text('Email: ${user['email']}'),
      //           Text('Phone: ${user['phone']}'),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
