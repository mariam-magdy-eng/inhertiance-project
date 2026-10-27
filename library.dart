// 1. الكلاس الأب (LibraryItem)
class LibraryItem {
  String _id;
  String _title;
  bool _isBorrowed = false;

  LibraryItem(this._id, this._title);

  String get id => _id;
  String get title => _title;
  bool get isBorrowed => _isBorrowed;

  void borrowItem() {
    if (_isBorrowed) {
      print(" Sorry, '$_title' is already borrowed!");
    } else {
      _isBorrowed = true;
      print(" Success: '$_title' has been borrowed.");
    }
  }

  void returnItem() {
    if (!_isBorrowed) {
      print(" Error: '$_title' was not borrowed anyway!");
    } else {
      _isBorrowed = false;
      print(" Success: '$_title' has been returned to the library.");
    }
  }

  void displayInfo() {
    print("ID: $_id, Title: $_title, Borrowed: $_isBorrowed");
  }
}

class Book extends LibraryItem {
  String author;

  Book(String id, String title, this.author) : super(id, title);

  @override
  void displayInfo() {
    print(
      "📖 [Book] ID: $id, Title: $title, Author: $author, Borrowed: $isBorrowed",
    );
  }
}

class Magazine extends LibraryItem {
  int issueNumber;

  Magazine(String id, String title, this.issueNumber) : super(id, title);

  @override
  void displayInfo() {
    print(
      " [Magazine] ID: $id, Title: $title, Issue: $issueNumber, Borrowed: $isBorrowed",
    );
  }
}

class Member {
  String name;
  List<LibraryItem> borrowedItems = []; // قائمة العناصر المستعارة

  Member(this.name);

  void borrowLibraryItem(LibraryItem item) {
    if (borrowedItems.length >= 3) {
      print(" $name cannot borrow more than 3 items!");
      return;
    }

    if (item.isBorrowed) {
      print(
        " Action denied: '${item.title}' is already taken by someone else.",
      );
      return;
    }

    item.borrowItem();
    borrowedItems.add(item);
    print(" Member $name successfully added '${item.title}' to their list.\n");
  }

  void returnLibraryItem(LibraryItem item) {
    if (!borrowedItems.contains(item)) {
      print(
        " Action denied: $name didn't borrow '${item.title}' in the first place!\n",
      );
      return;
    }

    item.returnItem();
    borrowedItems.remove(item);
    print(" Member $name removed '${item.title}' from their list.\n");
  }
}

void main() {
  LibraryItem book1 = Book("B1", "Dart Programming", "John Smith");
  LibraryItem book2 = Book("B2", "Flutter UI Design", "Sara Ahmed");
  LibraryItem book3 = Book("B3", "Clean Code", "Robert Martin");
  LibraryItem mag1 = Magazine("M1", "Tech Weekly", 45);

  Member member1 = Member("أحمد");

  print("--- 1. اختبار استعارة العناصر بشكل طبيعي ---");
  member1.borrowLibraryItem(book1);
  member1.borrowLibraryItem(book2);

  print("--- 2. محاولة استعارة نفس الكتاب (المستعار مسبقاً) ---");
  member1.borrowLibraryItem(book1);

  print("--- 3. اختبار الحد الأقصى للإعارة (3 عناصر) ---");
  member1.borrowLibraryItem(book3);
  member1.borrowLibraryItem(mag1);

  print("--- 4. محاولة إرجاع عنصر لم يستعره العضو أصلاً ---");
  member1.returnLibraryItem(mag1);

  print("--- 5. إرجاع العناصر بشكل صحيح ---");
  member1.returnLibraryItem(book1);

  print("--- 6. عرض تفاصيل العناصر النهائية ---");
  book1.displayInfo();
  book2.displayInfo();
}
