import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vertical_factory/screens/signin_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const VerticalFactory());
}

class VerticalFactory extends StatelessWidget {
  const VerticalFactory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vertical Factory',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFF7F7F9)),
      initialRoute: '/',
      // NOTE(hajae): Routes Setting
      routes: {
        '/': (context) => const VerticalFactoryScreen(),
        '/signin': (context) => const SigninScreen(),
      },
    );
  }
}

class VerticalFactoryScreen extends StatefulWidget {
  const VerticalFactoryScreen({super.key});

  @override
  State<VerticalFactoryScreen> createState() => _VerticalFactoryScreenState();
}

class _VerticalFactoryScreenState extends State<VerticalFactoryScreen> {
  void _openSidePanel() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black.withValues(alpha: 128),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (_, animation, __, ___) {
        final slideAnimation = Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

        return SlideTransition(
          position: slideAnimation,
          child: const SlideFromLeftPanel(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // NOTE(hajae): Scaffold -> Layout (전체 페이지 틀)
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, size: 32),
          onPressed: _openSidePanel,
          color: Colors.black,
        ),
        flexibleSpace: const AppBarBottomBorder(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello world'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
              child: const Text('Go to Sign In'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        alignment: Alignment.center,
        color: Colors.grey.shade200,
        child: Text('© 2025 YeonHap System - Baro Factory'),
      ),
    );
  }
}

class SlideFromLeftPanel extends StatelessWidget {
  const SlideFromLeftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: size.width,
        height: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 56),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: IconButton(
                icon: const Icon(Icons.close, size: 32),
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.black,
              ),
            ),
            const AppBarBottomBorder(),
          ],
        ),
      ),
    );
  }
}

class AppBarBottomBorder extends StatelessWidget {
  const AppBarBottomBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
      ),
    );
  }
}
