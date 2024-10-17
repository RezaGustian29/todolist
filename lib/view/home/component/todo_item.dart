import 'package:flutter/material.dart';
import 'package:todolist/config/theme.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin / 2),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Do Math Homework',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Today At 16:45',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                    color: subtitleColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: contentCardColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/icons_univ.png',
                  width: 13,
                  height: 10,
                ),
                const SizedBox(width: 5),
                Text(
                  'University',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 15),
          Image.asset(
            'assets/icons/icons_flag1.png',
            width: 50,
            height: 32,
          ),
          /*   Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/icons_flag1.png',
                          width: 24,
                        ),
                        //const SizedBox(width: 4),
                        //const Text('1', style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ), */
        ],
      ),
    );
  }
}
