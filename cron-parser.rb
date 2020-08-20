# Accepts a string which represents a range "1-5", with an optional step argument
# and returns a string of the unpacked range. "1-5" returns "1 2 3 4 5" 
def range_parser(cron_range, steps = 1)
    (first, last) = cron_range.split "-"
    (first..last).step(steps.to_i).to_a.join(" ")
end

def step_parser(cron_steps)
    (cron_range, step) = cron_steps.split "/"
    cron_range = range_parser(cron_range, step)
end

def list_parser(cron_list)
    puts "CRON_LIST: " + cron_list
    cron_array = cron_list.split ","
    cron_array.join " "
end

line = ARGV[0]
(minute, hour, day_of_month, month, day_of_week, cmd) = line.split

# TODO: Split all the xxx_parsed blocks into a more general sub.

minutes_parsed = ""
if minute.include? "-"
    minutes_parsed = range_parser(minute)
elsif minute.include? "/"
    minute.gsub!('*', '0-59')
    minutes_parsed = step_parser(minute)
elsif minute.include? ","
    minutes_parsed = list_parser(minute)
else
    minutes_parsed = minute
end

hours_parsed = ""
if hour.include? "-"
    hours_parsed = range_parser(hour)
elsif hour.include? "/"
    hour.gsub('*', '0-23')
    hours_parsed = step_parser(hour)
elsif hour.include? ","
    hours_parsed = list_parser(hour)
else
    hours_parsed = hour
end

days_of_month_parsed = ""
if day_of_month.include? "-"
    days_of_month_parsed = range_parser(day_of_month)
elsif day_of_month.include? "/"
    day_of_month.gsub!('*', '0-31') # TODO: Need to be more clever here (given time)
    days_of_month_parsed = step_parser(day_of_month)
elsif day_of_month.include? ","
    days_of_month_parsed = list_parser(day_of_month)
else
    days_of_month_parsed = day_of_month
end

month_parsed = ""
if month.include? "-"
    month_parsed = range_parser(month)
elsif month.include? "/"
    month.gsub!('*', '0-12')
    month_parsed = step_parser(month)
elsif month.include? ","
    month_parsed = list_parser(month_parsed)
else
    month_parsed = month
end

day_of_week_parsed = ""
if day_of_week.include? "-"
    day_of_week_parsed = range_parser(day_of_week)
elsif day_of_week.include? "/"
    day_of_week.gsub!('*', '0-6')
    day_of_week_parsed = step_parser(day_of_week)
elsif day_of_week.include? ","
    day_of_week_parsed = list_parser(day_of_week_parsed)
else
    day_of_week_parsed = day_of_week
end

puts "minute\t\t" + minutes_parsed
puts "hours\t\t" + hours_parsed
puts "day of month\t" + days_of_month_parsed
puts "day of week\t" + day_of_week_parsed
puts "command\t\t" + cmd
