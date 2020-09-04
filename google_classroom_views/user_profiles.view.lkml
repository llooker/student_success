view: user_profiles {
  sql_table_name: `looker-private-demo.classroom_staging.user_profiles`
    ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.emailAddress ;;
  }

  dimension: name {
    type: string
    sql: TRIM(JSON_EXTRACT(${TABLE}.name,'$.fullName'),'"') ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photoUrl ;;
  }

  dimension: verified_teacher {
    hidden: yes
    type: string
    sql: ${TABLE}.verifiedTeacher ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id, name]
  }
}
