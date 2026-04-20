import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:we_the_people/app/theme/app_colors.dart';
import 'package:we_the_people/app/theme/app_spacing.dart';
import 'package:we_the_people/providers/auth_provider.dart';
import 'package:we_the_people/providers/preferences_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final preferencesProvider = context.watch<PreferencesProvider>();

    final user = authProvider.currentUser;
    final preferences = preferencesProvider.preferences;
    final hasTopics = preferences.topics.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('We the People'),
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: () async {
              await context.read<AuthProvider>().signOut();
              if (context.mounted) {
                context.go('/login');
              }
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _WelcomeHero(email: user?.email ?? 'Unknown'),
              const SizedBox(height: AppSpacing.xl),
              const _SectionHeader(
                title: 'Your next survey',
                subtitle: 'A preview of how the experience will feel.',
              ),
              const SizedBox(height: AppSpacing.md),
              const _SurveyPreviewCard(),
              const SizedBox(height: AppSpacing.xl),
              const _SectionHeader(
                title: 'Your preferences',
                subtitle: 'These settings shape which surveys you receive.',
              ),
              const SizedBox(height: AppSpacing.md),
              _PreferenceSummaryCard(
                region: preferences.region ?? '-',
                language: preferences.language ?? '-',
                topics: preferences.topics,
                notificationsEnabled: preferences.notificationsEnabled,
              ),
              const SizedBox(height: AppSpacing.xl),
              const _SectionHeader(
                title: 'Participation overview',
                subtitle: 'This is a placeholder for future engagement stats.',
              ),
              const SizedBox(height: AppSpacing.md),
              _StatsRow(
                stats: [
                  _StatItem(
                    label: 'Surveys answered',
                    value: '0',
                    icon: Icons.how_to_vote_rounded,
                  ),
                  _StatItem(
                    label: 'Response streak',
                    value: '0 days',
                    icon: Icons.local_fire_department_rounded,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color:
                      hasTopics
                          ? AppColors.primary.withValues(alpha: 0.06)
                          : AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                  border: Border.all(
                    color:
                        hasTopics
                            ? AppColors.primary.withValues(alpha: 0.15)
                            : AppColors.border,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusMd,
                        ),
                      ),
                      child: const Icon(
                        Icons.tips_and_updates_rounded,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.lg),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hasTopics
                                ? 'Your profile is ready'
                                : 'Complete your preferences',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            hasTopics
                                ? 'You are ready to start receiving targeted surveys.'
                                : 'Add your interests to improve survey relevance as we expand the onboarding flow.',
                            style: Theme.of(context).textTheme.bodyMedium,
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
      ),
    );
  }
}

class _WelcomeHero extends StatelessWidget {
  final String email;

  const _WelcomeHero({required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
            ),
            child: const Text(
              'CIVIC PULSE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 12,
                letterSpacing: 0.4,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Welcome back',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            email,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withValues(alpha: 0.88),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'A simple place to answer short surveys and help surface how people really think.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withValues(alpha: 0.92),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionHeader({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: AppSpacing.xs),
        Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class _SurveyPreviewCard extends StatelessWidget {
  const _SurveyPreviewCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.poll_rounded, color: AppColors.primary),
              SizedBox(width: AppSpacing.sm),
              Text(
                'Sample survey',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Should local governments publish more public data about budgets and spending in simple language?',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: const [
              _AnswerChip(label: 'Yes'),
              _AnswerChip(label: 'No'),
              _AnswerChip(label: "Don't know / Not sure"),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnswerChip extends StatelessWidget {
  final String label;

  const _AnswerChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _PreferenceSummaryCard extends StatelessWidget {
  final String region;
  final String language;
  final List<String> topics;
  final bool notificationsEnabled;

  const _PreferenceSummaryCard({
    required this.region,
    required this.language,
    required this.topics,
    required this.notificationsEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          _PreferenceRow(
            icon: Icons.public_rounded,
            label: 'Region',
            value: region,
          ),
          const SizedBox(height: AppSpacing.lg),
          _PreferenceRow(
            icon: Icons.language_rounded,
            label: 'Language',
            value: language,
          ),
          const SizedBox(height: AppSpacing.lg),
          _PreferenceRow(
            icon: Icons.notifications_active_rounded,
            label: 'Notifications',
            value: notificationsEnabled ? 'Enabled' : 'Disabled',
          ),
          const SizedBox(height: AppSpacing.lg),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Topics',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          if (topics.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surfaceMuted,
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: const Text(
                'No topics selected yet.',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            )
          else
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children:
                    topics
                        .map(
                          (topic) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.sm,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(
                                AppSpacing.radiusXl,
                              ),
                            ),
                            child: Text(
                              topic,
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
        ],
      ),
    );
  }
}

class _PreferenceRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _PreferenceRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.surfaceMuted,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: AppSpacing.xs),
              Text(value, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatItem {
  final String label;
  final String value;
  final IconData icon;

  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
  });
}

class _StatsRow extends StatelessWidget {
  final List<_StatItem> stats;

  const _StatsRow({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          stats
              .map(
                (stat) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: stat == stats.last ? 0 : AppSpacing.md,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusLg,
                        ),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(stat.icon, color: AppColors.primary),
                          const SizedBox(height: AppSpacing.lg),
                          Text(
                            stat.value,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            stat.label,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }
}
