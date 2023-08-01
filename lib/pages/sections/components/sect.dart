import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../services/student_stats_on_date_basis/student_stats_network_provider.dart';

class SectionContainer extends ConsumerWidget {
  final String sectionName;
  const SectionContainer({super.key, required this.sectionName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentStatsNotifier =
        ref.watch(studentStatsNetworkProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {
          final name = sectionName.replaceAll(" ", "-");
          final todayDate = DateTime.now();
          final formatter = DateFormat('dd-MM-yyyy');
          final String formattedDate = formatter.format(todayDate);
          studentStatsNotifier.getStats(formattedDate, "CSE", name);
          GoRouter.of(context).push("/home?section=$name");
        },
        child: Container(
          width: 160,
          height: 160,
          padding: const EdgeInsets.all(20),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            children: [
              const Text(
                "Section",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFF4881),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                sectionName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF353437),
                  fontSize: 74,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -7.60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Sect extends StatelessWidget {
  const Sect({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Wrap(
        children: [
          SectionContainer(sectionName: "1 A"),
          SectionContainer(sectionName: "1 B"),
          SectionContainer(sectionName: "2 A"),
          SectionContainer(sectionName: "2 B"),
          SectionContainer(sectionName: "3 A"),
          SectionContainer(sectionName: "3 B"),
          SectionContainer(sectionName: "4 A"),
          SectionContainer(sectionName: "4 B"),
        ],
      ),
    );
  }
}
