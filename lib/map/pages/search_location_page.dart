import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../module.dart';

class SeacrhLocationPage extends StatefulWidget {
  const SeacrhLocationPage({super.key});

  @override
  State<SeacrhLocationPage> createState() => _SeacrhLocationPageState();
}

class _SeacrhLocationPageState extends State<SeacrhLocationPage> {
  final TextEditingController _textEditingController = TextEditingController();
  var searchInfo = <SearchInfo>[];
  bool isLoading = false;
  String country = '';
  List<String> countries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                    ),
                  )),
                  IconButton(
                      onPressed: () async {
                        if (_textEditingController.text.isEmpty) return;
                        var data = await addressSuggestion(
                            _textEditingController.text);
                        if (data.isNotEmpty) {
                          searchInfo = data;
                          country = searchInfo[0].address!.country!;
                          for (var element in searchInfo) {
                            countries.add(element.address!.country!);
                          }
                          setState(() {});
                        }
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Choose One',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : searchInfo.isEmpty
                      ? Container()
                      : Consumer(builder:
                          (BuildContext ctx, WidgetRef ref, Widget? _) {
                          return ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 20,
                              );
                            },
                            itemCount: searchInfo.length,
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.blueGrey,
                                padding: const EdgeInsets.all(4),
                                child: ListTile(
                                  onTap: () {
                                    ref.read(tripProvider.notifier).drawRoad(
                                        searchInfo[index].address!.city!,
                                        searchInfo[index].point!.latitude,
                                        searchInfo[index].point!.longitude);
                                    if (Navigator.canPop(context))
                                      Navigator.pop(context);
                                  },
                                  title: Text(searchInfo[index]
                                      .address!
                                      .country
                                      .toString()),
                                  subtitle: Text('${searchInfo[index].point}'),
                                ),
                              );
                            },
                          );
                        }),
            ),
          ],
        ),
      ),
    );
  }
}
