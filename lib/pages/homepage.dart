import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Taskly/models/tasks.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late double _deviceHeight, _deviceWidth;

  String? _newTaskContent;
  Box? _box;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  void _openBox() async {
    _box = await Hive.openBox('tasks');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: _deviceHeight * 0.15,
        title: const Text(
          "Taskly!",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: _box == null
          ? const Center(child: CircularProgressIndicator())
          : _tasksList(),
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _tasksList() {
    List tasks = _box!.values.toList();
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext _context, int _index) {
        var task = Tasks.fromMap(tasks[_index]);
        return Card(
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(
              task.content,
              style: TextStyle(
                decoration: task.done ? TextDecoration.lineThrough : null,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              task.timeStamp.toString(),
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            trailing: Icon(
              task.done
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank,
              color: Colors.red,
              size: 30,
            ),
            onTap: () {
              setState(() {
                task.done = !task.done;
                _box!.putAt(_index, task.toMap());
              });
            },
            onLongPress: () {
              setState(() {
                _box!.deleteAt(_index);
              });
            },
          ),
        );
      },
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: _displayTaskPopup,
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
      backgroundColor: Colors.red,
      elevation: 10,
    );
  }

  void _displayTaskPopup() {
    showDialog(
      context: context,
      builder: (BuildContext _context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Add New Task!"),
          content: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Task',
              labelStyle: TextStyle(fontSize: 18),
            ),
            onSubmitted: (_value) {
              if (_newTaskContent != null) {
                var _task = Tasks(
                    content: _newTaskContent!,
                    timeStamp: DateTime.now(),
                    done: false);
                _box!.add(_task.toMap());
                setState(() {
                  _newTaskContent = null;
                  Navigator.pop(context);
                });
              }
            },
            onChanged: (_value) {
              setState(() {
                _newTaskContent = _value;
              });
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_newTaskContent != null) {
                  var _task = Tasks(
                      content: _newTaskContent!,
                      timeStamp: DateTime.now(),
                      done: false);
                  _box!.add(_task.toMap());
                  setState(() {
                    _newTaskContent = null;
                    Navigator.pop(context);
                  });
                }
              },
              child: const Text("Add"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                elevation: 10,
              ),
            ),
          ],
        );
      },
    );
  }
}
