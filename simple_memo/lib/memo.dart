import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MemoListScreen(),
    );
  }
}

class Memo {
  final String title;
  final String content;

  Memo({required this.title, required this.content});
}

class MemoListScreen extends StatefulWidget {
  @override
  _MemoListScreenState createState() => _MemoListScreenState();
}

class _MemoListScreenState extends State<MemoListScreen> {
  List<Memo> memos = [];

  @override
  void initState() {
    super.initState();
    _loadMemos();
  }

  void _saveMemos() async {
    final prefs = await SharedPreferences.getInstance();
    final memoList = memos.map((memo) {
      return 'title:${memo.title},content:${memo.content}';
    }).toList();
    prefs.setStringList('memoList', memoList);
  }

  void _loadMemos() async {
    final prefs = await SharedPreferences.getInstance();
    final memoList = prefs.getStringList('memoList') ?? [];

    setState(() {
      memos = memoList.map((memo) {
        final memoMap =
            Map<String, dynamic>.fromEntries(memo.split(',').map((entry) {
          final keyValue = entry.split(':');
          return MapEntry(keyValue[0], keyValue[1]);
        }));
        return Memo(title: memoMap['title'], content: memoMap['content']);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memo List'),
      ),
      body: ListView.builder(
          itemCount: memos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(memos[index].title),
              subtitle: Text(memos[index].content),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddMemoScreen();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToAddMemoScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddMemoScreen()),
    );
    if (result != null && result is Memo) {
      addMemo(result);
    }
  }

  void addMemo(Memo memo) {
    setState(() {
      memos.add(memo);
      _saveMemos();
    });
  }
}

// class DetailView extends StatefulWidget {
//   final Memo item;

//   DetailView({required this.item});

//   @override
//   _DetailView createState() => _DetailView();
// }

class AddMemoScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  void _saveMemo(BuildContext context) {
    if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
      final newMemo =
          Memo(title: titleController.text, content: contentController.text);
      Navigator.pop(context, newMemo);
    } else {
      print('isEmpty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Memo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'Content'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _saveMemo(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
