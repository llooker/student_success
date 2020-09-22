view: teacher_student_meet_facts {
  derived_table: {
    datagroup_trigger: classroom_trigger
    sql: select student_meets.student_id,
          teacher_meets.teacher_id,
          count(distinct student_meets.meet_events_meeting_code) as number_meets_attended
          from

          (SELECT
            meet_events.meeting_code  AS meet_events_meeting_code,
            student_profiles.id  AS student_id
          FROM  ${meet_activities.SQL_TABLE_NAME}
               AS meet_activities
          LEFT JOIN ${meet_events.SQL_TABLE_NAME} AS meet_events ON meet_activities.id.uniqueQualifier= meet_events.id
          INNER JOIN ${user_profiles.SQL_TABLE_NAME}
               AS student_profiles ON meet_activities.actor.profileId = student_profiles.id
          WHERE  student_profiles.id  in (select distinct students.userId from `looker-private-demo.classroom_staging.students` as students)
          AND ((meet_events.meeting_code IS NOT NULL))
          GROUP BY 1,2
          ) as student_meets

          INNER JOIN

          (SELECT
            meet_events.meeting_code  AS meet_events_meeting_code,
            teacher_profiles.id  AS teacher_id
          FROM `looker-private-demo.classroom_staging.meet_activities`
               AS meet_activities
          LEFT JOIN ${meet_events.SQL_TABLE_NAME}  AS meet_events ON meet_activities.id.uniqueQualifier= meet_events.id
          INNER JOIN ${user_profiles.SQL_TABLE_NAME}
               AS teacher_profiles ON meet_activities.actor.profileId = teacher_profiles.id
          WHERE teacher_profiles.id in (select distinct teachers.userId from `looker-private-demo.classroom_staging.teachers` as teachers)
              AND ((meet_events.meeting_code IS NOT NULL))
          GROUP BY 1,2
          ) as teacher_meets

          on student_meets.meet_events_meeting_code = teacher_meets.meet_events_meeting_code
          group by 1,2
                ;;
  }

  dimension: number_meets_attended {
    type: number
    sql: coalesce(${TABLE}.number_meets_attended,0) ;;
  }

  dimension: teacher_id {
    hidden: yes
    type: string
  }

  dimension: student_id {
    hidden: yes
    type: string
  }

  dimension: primary_key {
    primary_key: yes
    sql: concat(${student_id},${teacher_id}) ;;
  }

  measure: total_attended {
    type: sum
    sql: ${number_meets_attended} ;;
  }

  measure: percent_attended {
    description: "The percent of the meets that the student attended"
    type: number
    value_format_name: percent_1
    sql:  ${total_attended}/nullif(${meet_attendance.total_number_meets_expected},0) ;;
  }
}
