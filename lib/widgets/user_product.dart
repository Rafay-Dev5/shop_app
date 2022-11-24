import 'package:flutter/material.dart';

import '../screens/edit_product_screen.dart';

class UserProduct extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Function deleteHandler;

  UserProduct(this.id, this.title, this.imageUrl, this.deleteHandler);

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
              icon: Icon(Icons.edit,
                  color: Theme.of(context).colorScheme.primary)),
          IconButton(
              onPressed: () async {
                try {
                  await deleteHandler(id);
                } catch (error) {
                  scaffold.showSnackBar(const SnackBar(
                      content: Text(
                    'Deleting Failed',
                    textAlign: TextAlign.center,
                  )));
                }
              },
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).errorColor,
              ))
        ]),
      ),
    );
  }
}
