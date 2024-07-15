import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDark = false;

  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F'];
  final List<int> colorCodes = <int>[600, 500, 400, 300, 200, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://pngimg.com/d/star_wars_logo_PNG5.png",
                  fit: BoxFit.scaleDown,
                  height: 50,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 8.0)),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
              );
            }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(3, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            }),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Image.network(
                    'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjWEORn2JYfWf02eaQVXSRlJvjT11MboilwQnb6-8LHW1KKY3kaQ4Hpc3Y5nZJCnOYZUnNolCTUL-NvC3IbZRbJcGQiFVBHxWmH8vh_aVPX5M8o0IuCN60ZtMcus4Gm0Oil783EK5M9-CeCcfDxnrF4HeSGs-L8OkTJhj8nGm5-ijSNUAYRqd6m9O1z2g/w1200-h630-p-k-no-nu/star-wars-the-skywalker-saga-1280.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            
            const Align(
                alignment: Alignment.centerLeft,
                heightFactor: 2,
                child: Text('Trilogia')),
            Expanded(
              flex: 1,
              child: SizedBox(
                // height: 50.0,
                child: ListView.separated(
                  scrollDirection: axisDirectionToAxis(AxisDirection.right),
                  // padding: const EdgeInsets.only(right: 8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 80,
                      color: Colors.amber[colorCodes[index]],
                      child: Center(child: Text('Entry ${entries[index]}')),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 4,
                  ),
                ),
              ),
            ),
            const Align(
                alignment: Alignment.centerLeft,
                heightFactor: 2,
                child: Text('Trilogia')),
            Expanded(
              flex: 1,
              // child: SizedBox(
                // height: 30.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  // padding: const EdgeInsets.only(right: 8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 80,
                      color: Colors.amber[colorCodes[index]],
                      child: Center(child: Text('Entry ${entries[index]}')),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 4,
                  ),
                ),
              ),
          ]
          ),
        ),
      ),
    );
  }
}
