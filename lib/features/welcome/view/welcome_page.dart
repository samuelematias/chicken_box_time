import 'package:chicken_box_time/l10n/l10n.dart';
import 'package:chicken_box_time/utils/utils.dart';
import 'package:design_system/design_system.dart' as ds;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template welcome_page}
/// The page responsabilite to render the list of movies.
/// {@endtemplate}
class WelcomePage extends StatelessWidget {
  /// {@macro welcome_page}
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _WelcomeView();
  }
}

class _WelcomeView extends StatelessWidget {
  const _WelcomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = ds.AppTheme.of(context);
    final colorTheme = theme.colors;
    final spacingTheme = theme.spacing;
    return Scaffold(
      backgroundColor: colorTheme.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(spacingTheme.large),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      minHeight: constraints.maxHeight,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: context.gridColumns5,
                                child: ds.Text(
                                  l10n.welcomeToChickenBox,
                                  key: const Key('welcome_chicken_box'),
                                  style: ds.CustomTextStyle.titleSmall,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: spacingTheme.medium),
                          SizedBox(
                            width: context.gridColumns11,
                            child: ds.Button(
                              mainAxisSize: MainAxisSize.max,
                              title: l10n.logIn,
                              onTap: () => context.push('/movie'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
