import std.stdio;

struct Books{
   char [] title;
   char [] author = "empty".dup;
   int book_id = -1;
   char [] subject = "kang".dup;
   static int id = 1000;
};
void printBook( Books book )
{
   writeln( "Book title : ", book.title);
   writeln( "Book author : ", book.author);
   writeln( "Book subject : ", book.subject);
   writeln( "Book book_id : ", book.book_id);
}


void main( )
{
   Books b3 = Books("D Programming".dup, "D Programming Tutorial".dup, Books.id++);
   printBook(b3);
   Books b4 = Books("D Programming".dup, "D Programming Tutorial".dup, Books.id++);
   printBook(b4);

   Books Book1;        /* Declare Book1 of type Book */
   Books Book2;        /* Declare Book2 of type Book */

   /* book 1 specification */
   Book1.title = "D Programming".dup;
   Book1.author = "Raj".dup;
   Book1.subject = "D Programming Tutorial".dup;
   Book1.book_id = 6495407;

   /* book 2 specification */
   Book2.title = "Lua Programming".dup;
   Book2.author = "Raj".dup;
   Book2.subject = "Lua Programming Tutorial".dup;
   Book2.book_id = 6495700;

   printBook(Book1);
   /* print Book1 info */
   writeln( "Book 1 title : ", Book1.title);
   writeln( "Book 1 author : ", Book1.author);
   writeln( "Book 1 subject : ", Book1.subject);
   writeln( "Book 1 book_id : ", Book1.book_id);

   /* print Book2 info */
   writeln( "Book 2 title : ", Book2.title);
   writeln( "Book 2 author : ", Book2.author);
   writeln( "Book 2 subject : ", Book2.subject);
   writeln( "Book 2 book_id : ", Book2.book_id);
}