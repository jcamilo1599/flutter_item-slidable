import 'package:flutter/material.dart';

class SlidablePage extends StatefulWidget {
  const SlidablePage({Key? key}) : super(key: key);

  @override
  State<SlidablePage> createState() => _SlidablePageState();
}

class _SlidablePageState extends State<SlidablePage> {
  List<String> items = <String>[
    '📚 Libro',
    '🎓 Graduación',
    '🎨 Paleta de pintura',
    '🚀 Cohete',
    '🍔 Hamburguesa',
    '💻 Computadora',
    '🌞 Sol',
    '🏠 Casa',
    '🚴 Bicicleta',
    '🌈 Arcoiris',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slidable')),
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Container(
              color: Colors.blue,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.access_alarm, color: Colors.white),
                    SizedBox(width: 6),
                    Text('Posponer', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.delete, color: Colors.white),
                    SizedBox(width: 6),
                    Text('Eliminar', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            key: ValueKey<String>(items[index]),
            onDismissed: (DismissDirection direction) {
              items.removeAt(index);
              setState(() {});
            },
            confirmDismiss: (DismissDirection direction) async {
              return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Titulo'),
                    content: const Text('Descripción'),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Si'),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('No'),
                      ),
                    ],
                  );
                },
              );
            },
            child: ListTile(title: Text(items[index])),
          );
        },
      ),
    );
  }
}
