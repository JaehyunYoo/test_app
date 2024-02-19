import 'package:chat_app/core/common/theme/theme.dart';
import 'package:chat_app/core/utils/logger/custom_logger.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInUpScreen extends StatelessWidget {
  const SignInUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SfCalendar(
          view: CalendarView.month,
          selectionDecoration: const BoxDecoration(color: Colors.transparent),
          monthCellBuilder: (context, cell) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black87),
              ),
              child: Text('${cell.date.day}').pOnly(left: 8, top: 4),
            );
          },
          appointmentBuilder: (context, detail) {
            final Meeting test = detail.appointments.first;

            return Container(
              color: test.background,
              child: Text(
                '${test.background}',
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
          dataSource: MeetingDataSource(
            _getDataSource(),
          ),
          monthViewSettings: const MonthViewSettings(
            showAgenda: false,
            showTrailingAndLeadingDates: false,
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          ),
        ),
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0)
            .add(Duration(days: -3));
    final DateTime endTime = startTime.add(const Duration(days: 1));
    meetings.add(
      Meeting(
          'Test123123123213123123123',
          startTime.add(
            Duration(days: 1),
          ),
          endTime.add(Duration(days: 6)),
          Colors.blue,
          false),
    );
    meetings.add(
      Meeting('Conference', startTime, endTime, const Color(0xFF0F8644), false),
    );
    meetings.add(
      Meeting('3번째', startTime.add(Duration()), endTime,
          const Color(0xFF0F8644), false),
    );

    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
