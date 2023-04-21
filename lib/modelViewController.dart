import 'package:team_d_project/item.dart';
import 'package:team_d_project/databaseController.dart';
import 'current_user.dart';

class ModelViewController {
  static final ModelViewController _instance = ModelViewController._internal();
  //create instance
  factory ModelViewController() {
    return _instance;
  }

  //constructor
  ModelViewController._internal() {
    // initialization logic
    //print("test mvc");
  }
  CurrentUser cu = CurrentUser();



  void addItemFromName(String name){
    Item newItem = Item(name, cu.getCurrentUname(), "Availabe");
    cu.addItem(newItem);
  }

  void deleteItemFromName(String name){
    cu.removeItemFromName(name);
  }

  //returns all items owned by user
  List<Item> searchMyItems(String search) {
    //search current list of persons items
    List<Item> L1;
    L1 = [Item("1", "1", "1")];
    return L1;
  }

  Future<List<Item>> getMyItems() async {
    //return list of persons items
    List<dynamic> itemmaps = await getUserInventory();
    List<Item> items = [];
    for (int i = 0; i < itemmaps.length; i++) {
      Map<String, dynamic> map = itemmaps[i];
      items.add(getItemFromMap(map));
    }
    return items;
  }

  Future<List<Item>> getBorrowedItems() async {
    //return list of items currently borrowed
    List<dynamic> borroweditemsmaps = await getBorrowedInventory();
    List<Item> borrowedItems = [];
    for (int i = 0; i < borroweditemsmaps.length; i++) {
      Map<String, dynamic> map = borroweditemsmaps[i];
      borrowedItems.add(getItemFromMap(map));
    }
    return borrowedItems;
  }

  List<Item> searchOtherItems() {
    //return list of searched items other people own
    List<Item> L1;
    L1 = [Item("1", "1", "1")];
    return L1;
  }
}