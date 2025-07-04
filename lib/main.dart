import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vertical_factory/screens/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(VerticalFactory());
}

class VerticalFactory extends StatelessWidget {
  const VerticalFactory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vertical Factory',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFF7F7F9)),
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
  final storage = FlutterSecureStorage();

  void _openSidePanel() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black.withValues(alpha: 0.3),
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

  Future<void> _signout() async {
    await storage.deleteAll();

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/signin');
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
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: _signout),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          const int boxCount = 4;
          final double totalHeight = constraints.maxHeight;

          final double totalGap = (boxCount + 1) * 10;
          final double boxHeight = (totalHeight - totalGap) / 4;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                ...List.generate(boxCount, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: boxHeight,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned(
                                  left: -boxHeight * 0.3,
                                  top: -boxHeight * 0.2,
                                  child: Container(
                                    width: boxHeight * 1.4,
                                    height: boxHeight * 1.4,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              '둘리엄마',
                                              style: TextStyle(
                                                fontSize: 28,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            // SizedBox(height: 3),
                                            Text(
                                              '123',
                                              style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: const [
                                            Text(
                                              '123/456',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'O5046(WG266D90H32-01-F)',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              '94:03:05',
                                              style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: double.infinity,
                            color: Colors.blueAccent,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: const Text(
                              'Puma SMX2600ST',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        },
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
