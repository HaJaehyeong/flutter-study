import 'package:flutter/material.dart';
import 'package:vertical_factory/screens/signin_view_model.dart';
import 'package:vertical_factory/widgets/custom_text_field.dart';
import 'package:vertical_factory/widgets/primary_button.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final SigninViewModel viewModel = SigninViewModel();

  Future<void> _handleLogin() async {
    try {
      await viewModel.login();

      if (!mounted || !context.mounted) return;

      Navigator.pushNamed(context, '/');
    } catch (e) {
      if (!mounted) return;
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('로그인 실패'),
              content: Text(e.toString()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('확인'),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // NOTE(hajae): Scaffold -> Layout (전체 페이지 틀)
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Baro Factory',
                  style: TextStyle(
                    fontSize: 32,
                    height: 1,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                  ),
                ),
                const Text(
                  'Monitoring for Mobile',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(height: 50),
                FractionallySizedBox(
                  widthFactor: 0.6,
                  child: CustomTextField(
                    hintText: 'ID',
                    onChanged: viewModel.setId,
                  ),
                ),
                const SizedBox(height: 24),
                FractionallySizedBox(
                  widthFactor: 0.6,
                  child: CustomTextField(
                    hintText: 'Password',
                    obscureText: true,
                    onChanged: viewModel.setPassword,
                  ),
                ),
                const SizedBox(height: 48),
                FractionallySizedBox(
                  widthFactor: 0.6,
                  child: PrimaryButton(
                    text: 'Sign In',
                    onPressed: _handleLogin,
                  ),
                ),
              ],
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
