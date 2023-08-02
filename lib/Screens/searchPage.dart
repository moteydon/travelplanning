import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> _allPlaces = [
    {"name": "Pokhara"},
    {"name": "Shey phoksundo"},
    {"name": "Swoyambhu"},
    {"name": "Nagarkot"},
    {"name": "Pachal Waterfall"},
    {"name": "Phewa Lake"},
    {"name": "Machhapuchre"},
    {"name": "Tilicho Lake"},
  ];

  //This list holds data for the List View
  List<Map<String, dynamic>> _foundplaces = [];
  @override
  void initState() {
    _foundplaces = _allPlaces;
    // TODO: implement initState
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allPlaces;
    } else {
      results = _allPlaces
          .where((user) =>
              user['name'].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundplaces = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {},
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _foundplaces.isNotEmpty
                ? ListView.builder(
                    itemCount: _foundplaces.length,
                    itemBuilder: (context, index) => Card(
                      elevation: 1,
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      child: ListTile(
                        title: Text(_foundplaces[index]['name']),
                      ),
                    ),
                  )
                : const Text(
                    'No results found Please try with different search',
                    style: TextStyle(fontSize: 24),
                  ),
          ),
        ],
      ),
    );
  }
}