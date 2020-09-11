view: chrome_usage {
  sql_table_name: `looker-private-demo.classroom_staging.chrome_usage`
    ;;

  dimension: is_active_day {
    type: yesno
    sql:  ${duration} > 0;;
  }

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: concat(${device_id},${usage_date}) ;;
  }

  dimension_group: usage {
    type:time
    timeframes: [date,day_of_week,day_of_month,month,raw]
    sql: timestamp(${TABLE}.date) ;;
  }

  dimension: device_id {
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: device_os_version {
    group_label: "Device"
    type: string
    sql: ${TABLE}.device_os_version ;;
  }

  dimension: duration {
    description: "Daily usage in minutes"
    type: number
    sql: ${TABLE}.duration ;;
  }

  dimension: location {
    description: "Approximate Usage Location"
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: mac_address {
    group_label: "Device"
    type: string
    sql: ${TABLE}.mac_address ;;
  }

  dimension: model {
    group_label: "Device"
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: org_unit_path {
    type: string
    sql: ${TABLE}.org_unit_path ;;
  }

  dimension: school_name {
    sql: replace(split(${org_unit_path},'/')[offset(2)],'_',' ') ;;
  }

  dimension: private_ip_address {
    group_label: "Device"
    type: string
    sql: ${TABLE}.private_ip_address ;;
  }

  dimension: public_ip_address {
    group_label: "Device"
    type: string
    sql: ${TABLE}.public_ip_address ;;
  }

  dimension: serial_number {
    group_label: "Device"
    type: string
    sql: ${TABLE}.serial_number ;;
  }

  dimension: user {
    hidden: no
    type: string
    sql: ${TABLE}.user ;;
  }

  measure: total_duration {
    value_format_name: decimal_1
    type: sum
    sql: ${duration} ;;
  }

  measure: average_daily_duration {
    value_format_name: decimal_1
    type: average
    sql: ${duration} ;;
  }

}
