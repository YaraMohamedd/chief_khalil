
import 'package:chief_khalil/Models/cheif_model.dart';
import 'package:flutter/material.dart';
class ChiefGridView  extends StatelessWidget {
  final List<Chiefs> chiefs;

   ChiefGridView({ this.chiefs});

  Card getStructuredGridCell(Chiefs chiefs) {
    return new Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Image.asset(chiefs.image, fit: BoxFit.cover,),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(chiefs.fname +'' +chiefs.lname),
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      primary: true,
      crossAxisCount: 2,
      childAspectRatio: 0.80,
      children: List.generate(chiefs.length, (index) {
        return getStructuredGridCell(chiefs[index]);
      }),
    );
  }
}
