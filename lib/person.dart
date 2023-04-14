import 'package:cloud_firestore/cloud_firestore.dart';

import 'item.dart';
import 'databaseController.dart';

class Person {
  String _username = "";
  String _name = "";
  String _password = "";
  String _dob = "";
  List<Item> _myItems = <Item>[];
  List<Item> borrowedItems = <Item>[];
  List<Item> requestedItems = <Item>[];
  List<Person> friends = <Person>[];

  // Person({required String username, required String password, List? myItems}) {
  //   _username = username;
  //   _password = password;
  // }

  Person(String username, String password) {
    _username = username;
    _password = password;
    // _myItems = myItems;
  }

  String get name => _name;
  String get uname => _username;
  String get dob => _dob;
  List<Item> get myItems => _myItems;

  void setUserName(String uname) {
    _username = uname;
  }

  void setPassword(String password) {
    _password = password;
  }

  void setName(String name) {
    _name = name;
  }

  // void setUItems() async {
  //   _myItems = await getUserItems();
  // }

  // factory Person.fromFirestore(
  //   DocumentSnapshot<Map<String, dynamic>> snapshot,
  //   SnapshotOptions? options,
  // ) {
  //   final data = snapshot.data();
  //   return Person(
  //     username: data?['userName'],
  //     password: data?['password'],
  //     // country: data?['country'],
  //     // capital: data?['capital'],
  //     // population: data?['population'],
  //     myItems:
  //         data?['myItems'] is Iterable ? List.from(data?['myItems']) : null,
  //   );
  // }

  List<Map<String, dynamic>> inventoryMapping() {
    List<Map<String, dynamic>> inventory = <Map<String, dynamic>>[];
    for (int i = 0; i < myItems.length; i++) {
      inventory.add(myItems[i].toFirestore());
    }
    return inventory;
  }

  List<Map<String, dynamic>> borrowedInventoryMapping() {
    List<Map<String, dynamic>> inventory = <Map<String, dynamic>>[];
    for (int i = 0; i < borrowedItems.length; i++) {
      inventory.add(borrowedItems[i].toFirestore());
    }
    return inventory;
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (_name != null) "name": _name,
      if (uname != null) "userName": _username,
      if (_password != null) "password": _password,
      if (_dob != null) "dob": _dob,
      if (_myItems != null) "myItems": inventoryMapping(),
      if (borrowedItems != null) "borrowedItems": borrowedInventoryMapping(),
      // if (_myItems != null) "myItems": _myItems[0].toFirestore(),
      // if (country != null) "country": country,
      // if (capital != null) "capital": capital,
      // if (population != null) "population": population,
      // if (regions != null) "regions": regions,
    };
  }
  // String getName() {
  //   return _name;
  // }

  // String getDOB() {
  //   return _dob;
  // }

  // List<Item> getMyItems() {
  //   // find out how to also display status of items
  //   return myItems;
  // }

  // List<Item> getBorrowedItems() {
  //   return borrowedItems;
  // }

  // List<Item> getRequestedItems() {
  //   return requestedItems;
  // }

  // // Add friend when button selected to become friends

  // // see friend list

  void addItem(Item item) {
    // when item is added just push button to add it set owner to current user and prompt user name tool
    item.setStatus("Available");
    myItems.add(item);
  }

  void removeItem(Item item) {
    int index = myItems.indexOf(item);
    myItems.remove(index);
  }

  void borrowItem(Item item) {
    if (item.getStatus() == "Available") {
      item.setStatus("Borrowed");
      borrowedItems.add(item);
    }
  }

  void returnItem(Item item) {
    item.setStatus("Available");
    int index = myItems.indexOf(item);
    borrowedItems.remove(index);
  }

  // void requestItem(Item item) {
  //   if (item.getStatus() == "Available") {
  //     item.setStatus("Requested");
  //   }
  // }

  // void acceptRequests(Item item) {
  //   if (item.getStatus() == "Requested") {
  //     item.setStatus("Borrowed");
  //     borrowedItems.add(item);
  //   }
  // }
}
