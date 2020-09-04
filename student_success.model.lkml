connection: "looker-private-demo"

include: "/google_classroom_views/*.view.lkml"
include: "/google_classroom_views/derived_tables/*.view.lkml"
include: "/metadata_views/*.view.lkml"

# include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }


explore: courses {
  label: "Google Classrooms"
  join: coursework {
    type: full_outer
    relationship: one_to_many
    sql_on: ${courses.id} = ${coursework.course_id} ;;
  }
  join: students {
    type: full_outer
    relationship: many_to_one
    sql_on: ${students.course_id}=${courses.id} ;;
  }
  join: coursework_submissions {
    type: full_outer
    relationship: one_to_many
    sql_on: ${coursework_submissions.course_work_id}=${coursework.id} and ${students.user_id}=${coursework_submissions.user_id};;
  }
  join: student_profiles {
    relationship: one_to_one
    from: user_profiles
    view_label: "Students"
    fields: [student_profiles.name,student_profiles.email_address,student_profiles.photo_url]
    sql_on: ${students.user_id} = ${student_profiles.id} ;;
  }
  join: teachers {
    type: left_outer
    relationship: many_to_one
    sql_on: ${teachers.user_id}=${courses.owner_id} ;;
  }
  join: teacher_profiles {
    relationship: one_to_one
    from: user_profiles
    view_label: "Teachers"
    fields: [teacher_profiles.name,teacher_profiles.email_address,teacher_profiles.photo_url]
    sql_on: ${teachers.user_id} = ${teacher_profiles.id} ;;
  }
  join: guardians {
    type: left_outer
    relationship: many_to_one
    sql_on: ${guardians.student_id}=${students.user_id} ;;
  }
  join: guardian_profiles {
    relationship: one_to_one
    from: user_profiles
    view_label: "Guardians"
    fields: [guardian_profiles.name]
    sql_on: ${guardians.guardian_id} = ${guardian_profiles.id} ;;
  }
  join: schools {
    type: inner
    relationship: many_to_one
    sql_on: ${courses.section} like concat('%', ${schools.school_name},'%') ;;
  }
  join: announcements {
    type: inner
    relationship: one_to_many
    sql_on: ${announcements.course_id}=${courses.id} and  ;;
  }
  join: student_facts {
    relationship: one_to_one
    sql_on: ${student_facts.user_id}=${students.user_id} ;;
  }
}
