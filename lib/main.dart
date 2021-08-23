import 'package:flutter/material.dart';
import 'quote.dart';
void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  @override
  List<Quote> quotes = [
    Quote(author: 'Harvey', text: 'I don''t have dreams, I have goals'),
    Quote(author: 'Akshay', text: 'Do what you love and not what you told too.')
  ];

  Widget quoteTemplate(quote){
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              quote.author,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8.0),
            FlatButton.icon(
              onPressed: () {},
              label: Text('delete quote'),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) =>quoteTemplate(quote)).toList(),
      ),
    );
  }
}

