import 'package:flutter/material.dart';

class SavedPlanCard extends StatefulWidget {
  final String title;
  // final String content;
  final DateTime createdAt;

  SavedPlanCard({
    required this.title,
    // required this.content,
    required this.createdAt,
  });

  @override
  _SavedPlanCard createState() => _SavedPlanCard();
}

class _SavedPlanCard extends State<SavedPlanCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            renderTitle(),
            Container(height: 8),
            //renderContent(),
          ],
        ),
      ),
    );
  }

  // renderContent() {
  //   return Row(
  //     children: [
  //       Flexible(
  //         child: Text(
  //           widget.content,
  //           style: TextStyle(
  //             color: Colors.grey,
  //           ),
  //           maxLines: 3,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  renderTitle() {
    final ca = widget.createdAt;

    final dateStr = '${ca.year}-${ca.month}-${ca.day}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          dateStr,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}