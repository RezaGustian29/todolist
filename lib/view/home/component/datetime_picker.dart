/* import 'package:flutter/cupertino.dart';


class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                   _DatePickerItem(
              children: <Widget>[
                const Text('DateTime'),
                CupertinoButton(
                  // Display a CupertinoDatePicker in dateTime picker mode.
                  onPressed: () => _showDialog(
                    CupertinoDatePicker(
                      initialDateTime: dateTime,
                      use24hFormat: true,
                      // This is called when the user changes the dateTime.
                      onDateTimeChanged: (DateTime newDateTime) {
                        setState(() => dateTime = newDateTime);
                      },
                    ),
                  ),
                  // In this example, the time value is formatted manually. You
                  // can use the intl package to format the value based on the
                  // user's locale settings.
                  child: Text(
                    '${dateTime.month}-${dateTime.day}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}',
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 */