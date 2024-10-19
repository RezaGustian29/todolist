import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:todolist/config/theme.dart';
import 'package:todolist/view/auth/login_view.dart';
import 'package:todolist/view/home/home_view.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key, this.restorationId});
  final String? restorationId;

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;
  int selectedIndex = 0;
  int currentPageIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      currentPageIndex = index; // Update currentPageIndex here
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(defaultRadius),
                        topRight: Radius.circular(defaultRadius),
                      ),
                      color: contentColor,
                    ),
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          20.0, 20.0, 20.0, 0.0), // content padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add Task',
                            style: primaryTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: semiBold,
                            ),
                          ),
                          TextFormField(
                            style: primaryTextStyle.copyWith(
                                fontSize: 16, fontWeight: regular),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultRadius),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: secondaryColor),
                              ),
                              hintText: 'Enter your username',
                              hintStyle: subtitleTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: regular,
                              ),
                            ),
                          ),
                          const SizedBox(width: 13),
                          Text(
                            'Description',
                            style: primaryTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: regular,
                              color: subtitleColor,
                            ),
                          ),
                          SizedBox(height: defaultMargin / 2),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  //TODO DATETIME
                                  final DateTime? dateTime =
                                      await showOmniDateTimePicker(
                                          theme: ThemeData(
                                              colorScheme: ColorScheme.fromSeed(
                                            seedColor: Colors.grey,
                                            brightness: Brightness.dark,
                                          )),
                                          context: context);
                                  debugPrint('datetime: $dateTime');
                                },
                                child: Image.asset(
                                  'assets/icons/icons_timer.png',
                                  width: 24,
                                ),
                              ),
                              const SizedBox(width: 32),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (BuildContext context) {
                                        return SingleChildScrollView(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    defaultRadius),
                                                topRight: Radius.circular(
                                                    defaultRadius),
                                              ),
                                              color: contentColor,
                                            ),
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20.0,
                                                      20.0,
                                                      20.0,
                                                      0.0), // content padding
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Task Priority',
                                                    style: primaryTextStyle
                                                        .copyWith(
                                                            fontSize: 16,
                                                            fontWeight: bold),
                                                  ),
                                                  Divider(
                                                    thickness: 2,
                                                    color: secondaryColor,
                                                  ),
                                                  GridView.count(
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10,
                                                    crossAxisCount: 3,
                                                    children: <Widget>[
                                                      ...List.generate(
                                                        12,
                                                        (context) =>
                                                            Image.asset(
                                                          'assets/icons/icons_category.png',
                                                          width: 64,
                                                          height: 90,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      //TODO LANJUTKAN
                                                      const SizedBox(width: 15),
                                                      Expanded(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                            print(
                                                                'berhasil di save');
                                                          },
                                                          child: SizedBox(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 48,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    purpleTextColor,
                                                                border:
                                                                    Border.all(
                                                                  color:
                                                                      purpleTextColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            defaultRadius),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Add Category',
                                                                    style: primaryTextStyle
                                                                        .copyWith(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          regular,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ); // From with TextField inside
                                      });
                                },
                                child: Image.asset(
                                  'assets/icons/icons_tag.png',
                                  width: 24,
                                ),
                              ),
                              const SizedBox(width: 32),
                              GestureDetector(
                                onTap: () {
                                  //TODO TASK PRIORITAS
                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (BuildContext context) {
                                        return SingleChildScrollView(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    defaultRadius),
                                                topRight: Radius.circular(
                                                    defaultRadius),
                                              ),
                                              color: contentColor,
                                            ),
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20.0,
                                                      20.0,
                                                      20.0,
                                                      0.0), // content padding
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Task Priority',
                                                    style: primaryTextStyle
                                                        .copyWith(
                                                            fontSize: 16,
                                                            fontWeight: bold),
                                                  ),
                                                  Divider(
                                                    thickness: 2,
                                                    color: secondaryColor,
                                                  ),
                                                  GridView.count(
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10,
                                                    crossAxisCount: 4,
                                                    children: <Widget>[
                                                      ...List.generate(
                                                        12,
                                                        (context) => Image.asset(
                                                            'assets/icons/icons_task.png',
                                                            width: 64),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      //TODO LANJUTKAN
                                                      Expanded(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: SizedBox(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 48,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        purpleTextColor),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            defaultRadius),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Cancel',
                                                                    style: primaryTextStyle
                                                                        .copyWith(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          regular,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 15),
                                                      Expanded(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            print(
                                                                'berhasil di save');
                                                          },
                                                          child: SizedBox(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 48,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    purpleTextColor,
                                                                border:
                                                                    Border.all(
                                                                  color:
                                                                      purpleTextColor,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            defaultRadius),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Save',
                                                                    style: primaryTextStyle
                                                                        .copyWith(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          regular,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ); // From with TextField inside
                                      });
                                },
                                child: Image.asset(
                                  'assets/icons/icons_flag.png',
                                  width: 24,
                                ),
                              ),
                              const SizedBox(width: 210),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    'assets/icons/icons_send.png',
                                    width: 24,
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ); // From with TextField inside
              });
        },
        backgroundColor: purpleTextColor,
        child: Icon(
          Icons.add,
          color: primaryTextColor,
        ),
      );
    }

    return Scaffold(
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black, // <-- This works for fixed

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(left: 28),
              child: Image.asset(
                'assets/icons/index.png',
                width: 55,
                color: selectedIndex == 0 ? Colors.red : Colors.white,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/icons/calendar.png',
                width: 55,
                color: selectedIndex == 1 ? Colors.red : Colors.white,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(left: 20),
              child: Image.asset(
                'assets/icons/focuse.png',
                width: 55,
                color: selectedIndex == 2 ? Colors.red : Colors.white,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/icons/profile.png',
                width: 55,
                color: selectedIndex == 3 ? Colors.red : Colors.white,
              ),
            ),
            label: '',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
      body: <Widget>[
        const HomeView(),
        const LoginView(),
        const HomeView(),
        const LoginView(),
      ][currentPageIndex],
    );
  }
}

/// Flutter code sample for [showDatePicker].

void main() => runApp(const DatePickerApp());

class DatePickerApp extends StatelessWidget {
  const DatePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      restorationScopeId: 'app',
      home: DatePickerExample(restorationId: 'main'),
    );
  }
}

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _DatePickerExampleState extends State<DatePickerExample>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            _restorableDatePickerRouteFuture.present();
          },
          child: const Text('Open Date Picker'),
        ),
      ),
    );
  }
}

/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todolist/config/theme.dart';
import 'package:todolist/provider/page_provider.dart';
import 'package:todolist/view/auth/login_view.dart';
import 'package:todolist/view/home/home_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //int currenIndex = 0;
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleTextColor,
        child: Icon(
          Icons.add,
          color: primaryTextColor,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          color: contentColor,
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            //backgroundColor: Colors.pink,
            elevation: 0,
            currentIndex: pageProvider.currentIndex,
            onTap: (value) {
              pageProvider.currentIndex = value;
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                /*  backgroundColor: Colors.amber,
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 2.5,
                    right: 10,
                  ),
                  child: Image.asset(
                    'assets/icons/icons_univ.png',
                    width: 20,
                    color: pageProvider.currentIndex == 0
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ), */
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Home',
                /* backgroundColor: Colors.red,
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 2.5,
                    right: 50,
                  ),
                  child: Image.asset(
                    'assets/icons/icons_univ.png',
                    width: 20,
                    color: pageProvider.currentIndex == 1
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '', */
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                /* backgroundColor: contentColor,
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 2.5,
                    left: 30,
                  ),
                  child: Image.asset(
                    'assets/icons/icons_univ.png',
                    width: 20,
                    color: pageProvider.currentIndex == 2
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '', */
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                /*  backgroundColor: contentColor,
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 2.5,
                  ),
                  child: Image.asset(
                    'assets/icons/icons_univ.png',
                    width: 15,
                    color: pageProvider.currentIndex == 3
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                ),
                label: '', */
              ),
            ],
          ),
        ),
      );
    }

    Widget? body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return const HomeView();
        case 1:
          return const LoginView();
        case 2:
          return const HomeView();
        case 3:
          return const LoginView();
        default:
          return null;
      }
    }

    return Scaffold(
      backgroundColor:
          pageProvider.currentIndex == 0 ? contentColor : Colors.amber,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: SafeArea(child: body()!),
    );
  }
} */
