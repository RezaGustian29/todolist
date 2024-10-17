import 'package:flutter/material.dart';
import 'package:todolist/config/theme.dart';
import 'package:todolist/view/home/component/todo_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _items = [
    'Today',
    'Yesterday',
    'Tomorrow',
  ];
  bool _isDropdownOpen = false;
  String _selectedItem = 'Today';

  @override
  void initState() {
    super.initState();
    _controller.text = _selectedItem; // Set nilai awal controller
  }

  @override
  Widget build(BuildContext context) {
    Widget search() {
      return TextFormField(
        style: primaryTextStyle.copyWith(
          fontSize: 16,
          fontWeight: regular,
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
          ),
          hintText: 'Search for your task...',
          hintStyle: subtitleTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Image.asset(
              'assets/icons/icons_search.png',
              width: 24,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
          ),
        ),
      );
    }

    Widget filter() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
            ),
            child: SizedBox(
              width: 125,
              child: TextFormField(
                controller: _controller,
                readOnly: true,
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    // Menambah padding
                    horizontal: 12,
                    vertical: 8,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isDropdownOpen
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: primaryTextColor, // Warna icon
                    ),
                    onPressed: () {
                      setState(() {
                        _isDropdownOpen = !_isDropdownOpen;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // Menambah border saat tidak focus
                    borderSide: BorderSide(color: secondaryColor),
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _isDropdownOpen = !_isDropdownOpen;
                  });
                },
              ),
            ),
          ),
          if (_isDropdownOpen)
            Container(
              width: 125,
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: secondaryColor,
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    // Mengganti ListTile dengan InkWell untuk kontrol lebih baik
                    onTap: () {
                      setState(() {
                        _selectedItem = _items[index];
                        _controller.text = _selectedItem;
                        _isDropdownOpen = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Text(
                        _items[index],
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      );
    }

    Widget content() {
      return const Column(
        children: [
          TodoItem(),
          TodoItem(),
          TodoItem(),
          TodoItem(),
          TodoItem(),
          TodoItem(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: primaryColor,
        leading: Padding(
          padding: EdgeInsets.only(left: defaultMargin),
          child: Image.asset(
            'assets/icons/icons_piramid.png',
            width: 30,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: defaultMargin),
            child: Image.asset(
              'assets/images/images_profile.png',
              width: 42,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          'Your Task',
          style: primaryTextStyle.copyWith(
            fontSize: 20,
            fontWeight: regular,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            search(),
            const SizedBox(height: 20),
            filter(),
            content(),
          ],
        ),
      ),
    );
  }
}

/* Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                color: contentColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/icons_mark.png',
                      width: 16,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Do Math Homework',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          'Today At 16:45',
                          style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: regular,
                              color: subtitleColor),
                        ),
                      ],
                    ),

                    /*  Expanded(
                        child: Container(
                          width: 141,
                          height: 29,
                          color: Colors.amber,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 141,
                          height: 29,
                          color: Colors.green,
                        ),
                      ), */
                  ],
                ),
              ),
            ), */
