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

  @override
  Widget build(BuildContext context) {
    // NOTE(hajae): Scaffold -> Layout (전체 페이지 틀)
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(hintText: 'ID', onChanged: viewModel.setId),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Password',
              obscureText: true,
              onChanged: viewModel.setPassword,
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'Sign In',
              onPressed: () async {
                try {
                  await viewModel.login();

                  if (!mounted) return;
                  if (!context.mounted) return;

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
              },
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
