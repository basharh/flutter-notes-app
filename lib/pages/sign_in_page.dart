import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/common/layout/layout.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Sign In',
      child: Column(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Sign In', style: Theme.of(context).textTheme.headlineMedium),
          Text(
            'Enter valid user name and password to continue',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'User Name',
                  border: OutlineInputBorder(),
                  labelStyle: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  labelStyle: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                ),
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot_password');
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  padding: WidgetStateProperty.resolveWith(
                    (states) => const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 10,
                    ),
                  ),
                ),
                onPressed: () {
                  // Implement sign-in logic here
                },
                child: const Text('Login'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.15,
                height: 1,
                color: Colors.grey,
              ),
              Text('Or Continue with'),
              Container(
                width: MediaQuery.of(context).size.width * 0.15,
                height: 1,
                color: Colors.grey,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              FilledButton.tonalIcon(
                label: Text('Google'),
                icon: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                  semanticLabel: 'Google Icon',
                ),
                onPressed: () {},
              ),
              FilledButton.tonalIcon(
                label: Text('Facebook'),
                icon: Icon(
                  Icons.facebook_outlined,
                  color: Colors.blue,
                  size: 24.0,
                  semanticLabel: 'Facebook Icon',
                ),

                onPressed: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_up');
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
