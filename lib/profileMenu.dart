import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'modelViewController.dart';

//menu for editing profile features
class ProfileMenu extends StatelessWidget {
  ProfileMenu({super.key});
  final nameController = TextEditingController();
  final friendController = TextEditingController();
  final pwController = TextEditingController();

  final ModelViewController mvc = ModelViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  child: Text("Change Name:", overflow: TextOverflow.ellipsis)),
                                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  child: Text("Change Password:",
                      overflow: TextOverflow.ellipsis)),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  child:
                      Text("Add a Friend:", overflow: TextOverflow.ellipsis)),

            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                // <-- SEE HERE
                width: 200,
                child: TextField(
                  textInputAction: TextInputAction.done,
                  onSubmitted: (value) {
                    mvc.changeCName(value);
                    nameController.text = "";
                  },
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Enter New Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                // <-- SEE HERE
                width: 200,
                child: TextField(
                  controller: pwController,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (value) {
                    mvc.updateCPassword(value);
                    pwController.text = "";
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Enter Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
                            SizedBox(
                // <-- SEE HERE
                width: 200,
                child: TextField(
                  controller: friendController,
                  textInputAction: TextInputAction.go,
                  onSubmitted: (value) {
                    mvc.addFriendByName(value);
                    friendController.text = "";
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter User Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
