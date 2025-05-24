import 'package:flutter/material.dart';

class NumbersListProvider extends ChangeNotifier {
  List item = [
    {
      "image": "assets/images/pop1.jpg",
      "title": "burger",
      "rate": "350",
      "number": "",
      "total": "",
      "description":
          "A cheese burger is a classic variation of a traditional burger, where a slice of cheese is melted onto the cooked patty, adding a creamy, gooey layer of flavor.",
    },
    {
      "image": "assets/images/pop1.jpg",
      "title": "burger",
      "rate": "350",
      "number": "",
      "total": "",
      "description":
          "A cheese burger is a classic variation of a traditional burger, where a slice of cheese is melted onto the cooked patty, adding a creamy, gooey layer of flavor.",
    },
    {
      "image": "assets/images/pop1.jpg",
      "title": "burger",
      "rate": "350",
      "number": "",
      "total": "",
      "description":
          "A cheese burger is a classic variation of a traditional burger, where a slice of cheese is melted onto the cooked patty, adding a creamy, gooey layer of flavor.",
    },
  ];
  List<int> numbers = [1];
  List<int> amount = [350];

  void add() {
    int last = numbers.last;
    numbers.add(last + 1);
    int last1 = amount.first;
    amount.add(last1 * numbers.last);
    notifyListeners();
  }

  void sub() {
    if (numbers.last == 1) {
      return;
    } else {
      int last = numbers.last;
      numbers.add(last - 1);
      int last1 = amount.first;
      amount.add(last1 * numbers.last);
      notifyListeners();
    }
  }

  void total() {
    int last = numbers.last * amount.last;
    numbers.add(last + 1);
    notifyListeners();
  }
}
