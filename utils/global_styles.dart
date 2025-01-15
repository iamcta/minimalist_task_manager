import 'package:flutter/material.dart';

class GlobalStyles {
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.blueAccent;

  static const TextStyle headingStyle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color:Colors.black,
  );
  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.grey,
  );
  static const EdgeInsets globalPadding = EdgeInsets.all(16.0);
  static final BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 4,
        offset: Offset(0,2),

      ),
    ],
  );
}

/*

import '../utils/global_styles.dart';

Text(
  'Task Manager',
  style: GlobalStyles.headingStyle,
);

Container(
  padding: GlobalStyles.globalPadding,
  decoration: GlobalStyles.cardDecoration,
  child: Text('Task details here'),
);

*/