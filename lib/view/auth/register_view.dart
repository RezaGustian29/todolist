import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todolist/config/theme.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    Widget backButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Image.asset(
              'assets/icons/icons_back.png',
              width: 24,
            )
          ],
        ),
      );
    }

    Widget form() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Register',
            style: primaryTextStyle.copyWith(
              fontSize: 32,
              fontWeight: bold,
            ),
          ),
          SizedBox(
            height: defaultMargin * 2,
          ),
          Text(
            'Username',
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
              hintText: 'Enter your username',
              hintStyle: subtitleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Text(
            'Password',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            obscureText: isVisible,
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: regular),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor),
              ),
              hintText: '..............',
              hintStyle: subtitleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Text(
            'Confirm Password',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            obscureText: isVisible,
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: regular),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor),
              ),
              hintText: '..............',
              hintStyle: subtitleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
          ),
        ],
      );
    }

    Widget divider() {
      return Image.asset(
        'assets/images/images_divider.png',
      );
    }

    Widget loginButton() {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            backgroundColor: purpleTextColor,
          ),
          onPressed: () {},
          child: Text(
            'Register',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: regular),
          ),
        ),
      );
    }

    Widget optionButton() {
      return Column(
        children: [
          GestureDetector(
            onTap: () {},
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
                    Image.asset(
                      'assets/images/images_google.png',
                      width: 24,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Register with google',
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
          SizedBox(
            height: defaultMargin,
          ),
          GestureDetector(
            onTap: () {},
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
                    Image.asset(
                      'assets/images/images_apple.png',
                      width: 24,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Register with apple',
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
          SizedBox(
            height: defaultMargin,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Already have an account? ',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                    color: secondaryColor,
                  ),
                ),
                TextSpan(
                  text: 'Login',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, '/login');
                    },
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                backButton(),
                const SizedBox(height: 30),
                form(),
                const SizedBox(height: 30),
                loginButton(),
                const SizedBox(height: 30),
                divider(),
                const SizedBox(height: 30),
                optionButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
