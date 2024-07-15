import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchAnchor(builder:
                    (BuildContext context, SearchController controller) {
                  return SearchBar(
                    controller: controller,
                    padding: const WidgetStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    leading: const Icon(Icons.search),
                    trailing: <Widget>[
                      Tooltip(
                        message: 'Change brightness mode',
                        child: IconButton(
                          isSelected: isDark,
                          onPressed: () {
                            setState(() {
                              isDark = !isDark;
                            });
                          },
                          icon: const Icon(Icons.wb_sunny_outlined),
                          selectedIcon: const Icon(Icons.brightness_2_outlined),
                        ),
                      )
                    ],
                  );
                }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
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
              ),
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
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
