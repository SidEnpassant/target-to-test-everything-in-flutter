void main() {
  Book book1 = Book('1984', 'George Orwell', '121212121', true);
  Book book2 = Book('GOT', 'Harper Lee', '23234123167', true);
  
  Library library = Library();
  library.addBook(book1);
  library.addBook(book2);

  library.listBook();
  
  
  Member member = Member('Siddhes', '232323424234');
  
  library.loanBook(book1, member);

  library.listBook();


  library.listLoanBook();



}


class Book {
  String title;
  String author;
  String isbn;
  bool isAvailable;

  Book(this.title , this.author , this.isbn , this.isAvailable);
}


class Library{
  List<Book> books = [];
  List<Loan> loans = [];

  void loanBook(Book book , Member member){
    
    if(book.isAvailable){
      book.isAvailable = false;
      loans.add(Loan(book, member, DateTime.now()));
    }else{
      print('${book.title} is not available');
    }

  }

  void addBook(Book book){
    books.add(book);
  }

  void listBook() {
    print('-------------LIST ALL BOOKS IN LIBRARY-------------');
    for(var book in books){
      print(
        'Title: ${book.title}, Author: ${book.author} , ISBN: ${book.isbn} , '
            'Available: ${book.isAvailable}'
      );
    }
  }
  void listLoanBook() {
    print('-------------LIST ALL BOOKS IN LIBRARY-------------');
    for(var loan  in loans){
      print(
          'Title: ${loan.book.title}, Author: ${loan.book.author} , ISBN: ${loan.book.isbn} , '
              'Available: ${loan.book.isAvailable}'
      );
    }
  }
}


class Member{
  String name;
  String memberId;

  Member(this.name , this.memberId);
}

class Loan{
  Book book;
  Member member;
  DateTime loanDate;
  DateTime? returnDate;

  Loan(this.book , this.member , this.loanDate , [this.returnDate]);

  void returnBook(){
    returnDate = DateTime.now();
    book.isAvailable = true;
  }
}