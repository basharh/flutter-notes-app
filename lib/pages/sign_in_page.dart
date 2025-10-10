import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/common/layout/layout.dart';
import 'package:flutter_notes_app/widgets/common/notes_text_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Sign In',
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              spacing: 12,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Enter valid user name and password to continue',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Column(
                  children: [
                    _UsernameField(),
                    SizedBox(height: 12),
                    _PasswordField(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [_ForgotPasswordLink()],
                    ),
                    _LoginButton(),
                  ],
                ),
                SizedBox(height: 12),
                _OrContinueDivider(),
                SizedBox(height: 12),
                _SocialLoginLinks(),
              ],
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: _SignUpLink()),
        ],
      ),
    );
  }
}

/// Sign Up Link row
class _SignUpLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

/// Social Login Links row
class _SocialLoginLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

/// Or Continue with Divider row
class _OrContinueDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

/// Login Button
class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        padding: WidgetStateProperty.resolveWith(
          (states) => const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
        ),
      ),
      onPressed: () {
        // Implement sign-in logic here
      },
      child: const Text('Login'),
    );
  }
}

/// Forgot Password Link
class _ForgotPasswordLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(50, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/forgot_password');
      },
      child: const Text('Forgot Password?', style: TextStyle(fontSize: 12)),
    );
  }
}

class _PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      NotesTextField(labelText: 'Password', obscureText: true);
}

class _UsernameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) => NotesTextField(labelText: 'User Name');
}
