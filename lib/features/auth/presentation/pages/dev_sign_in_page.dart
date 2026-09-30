import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';
import '../bloc/dev_sign_in_cubit.dart';
import '../bloc/dev_sign_in_state.dart';
import '../bloc/session_cubit.dart';

/// Dev-only sign-in: pick a role, call /auth/dev-login, store the session.
/// Stands in for SSO (PingOne, D6) during the sprint.
class DevSignInPage extends StatelessWidget {
  const DevSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DevSignInCubit(getIt<SessionCubit>()),
      child: const _DevSignInView(),
    );
  }
}

class _DevSignInView extends StatelessWidget {
  const _DevSignInView();

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      backgroundColor: AppTokens.page,
      body: Center(
        child: SizedBox(
          width: 380,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<DevSignInCubit, DevSignInState>(
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(t.auth.devSignInTitle,
                          style: const TextStyle(
                              fontFamily: AppTokens.fontFamily,
                              fontSize: 22,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text(t.auth.devSignInSubtitle,
                          style: const TextStyle(color: AppTokens.grey700)),
                      const SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        initialValue: state.role,
                        isExpanded: true,
                        decoration: InputDecoration(labelText: t.auth.roleLabel),
                        items: [
                          for (final r in DevSignInCubit.roles)
                            DropdownMenuItem(value: r, child: Text(r)),
                        ],
                        onChanged: (v) {
                          if (v != null) context.read<DevSignInCubit>().selectRole(v);
                        },
                      ),
                      if (state.errorMessage != null) ...[
                        const SizedBox(height: 12),
                        Text(state.errorMessage!, style: const TextStyle(color: AppTokens.red400)),
                      ],
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed:
                              state.isSubmitting ? null : () => context.read<DevSignInCubit>().submit(),
                          child: state.isSubmitting
                              ? const SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(strokeWidth: 2))
                              : Text(t.auth.signIn),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
