import 'package:flutter/material.dart';
import 'package:todolist/config/theme.dart';

class AddCategoryView extends StatefulWidget {
  const AddCategoryView({super.key});

  @override
  State<AddCategoryView> createState() => _AddCategoryViewState();
}

class _AddCategoryViewState extends State<AddCategoryView> {
  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create new category',
            style: primaryTextStyle.copyWith(
              fontSize: 20,
              fontWeight: bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Category name :',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: regular),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor),
              ),
              hintText: 'Category name',
              hintStyle: subtitleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Category icon :',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: 154,
            height: 37,
            decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(defaultRadius)),
            child: Center(
              child: Text(
                'Choose icon from library',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Category Color :',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: regular,
            ),
          ),
        ],
      );
    }

    Widget categoryColor() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(
              20,
              (context) => Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Image.asset(
                  'assets/icons/icons_color.png',
                  width: 36,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget button() {
      return Row(children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: purpleTextColor),
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cancel',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: regular,
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
              print('berhasil di save');
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: Container(
                decoration: BoxDecoration(
                  color: purpleTextColor,
                  border: Border.all(
                    color: purpleTextColor,
                  ),
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Save',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: regular,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]);
    }

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            content(),
            const SizedBox(height: 16),
            categoryColor(),
            const Spacer(),
            button(),
          ],
        ),
      )),
    );
  }
}
