import 'package:flutter/material.dart';
import 'package:flutter_notes_app/providers/auth_service.dart';
import 'package:flutter_notes_app/widgets/common/layout/layout.dart';
import 'package:flutter_notes_app/widgets/common/notes_elevated_button.dart';
import 'package:flutter_notes_app/widgets/common/notes_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
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
            Navigator.pushReplacementNamed(context, '/sign_up');
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
      children: [_SignInWithGoogleButton(), _SignInWithFacebookButton()],
    );
  }
}

class _SignInWithFacebookButton extends ConsumerWidget {
  const _SignInWithFacebookButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authServiceProvider);

    return FilledButton.tonalIcon(
      label: Text('Facebook'),
      icon: Icon(
        Icons.facebook_outlined,
        color: Colors.blue,
        size: 24.0,
        semanticLabel: 'Facebook Icon',
      ),

      onPressed: () {
        try {
          authService.signInWithFacebook();
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error signing in with Facebook: $e')),
          );
        }

        Navigator.pushReplacementNamed(context, '/notes');
      },
    );
  }
}

class _SignInWithGoogleButton extends ConsumerWidget {
  const _SignInWithGoogleButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authServiceProvider);

    return FilledButton.tonalIcon(
      label: Text('Google'),
      icon: SvgPicture.asset(
        'assets/icons/google_icon.svg',
        height: 24.0,
        width: 24.0,
      ),
      onPressed: () {
        try {
          authService.signInWithGoogle();
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error signing in with Google: $e')),
          );
        }

        Navigator.pushReplacementNamed(context, '/notes');
      },
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
        Text('Or Continue With'),
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
    return NotesElevatedButton(text: 'Login', onPressed: () {});
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
