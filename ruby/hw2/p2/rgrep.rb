#!/usr/bin/env ruby
args = ARGV

# Marc DiFilippo - 111420881
# ISE 337 HW2 Part 2

if args.size < 2
    puts "Missing required arguments"
    return
end

file = args[0]
lines = []
i = 0
File.open(file, "r") { |file|
    file.each_line { |line| 
        lines[i] = line.split("\n")[0]
        i = i + 1
    }
}

word, match_regex, not_regex, count, matched = false, false, false, false, false

invalid = true
invalidc = false
pattern = ''

option_regex = Regexp.new('^-[a-z]$')
main_option_selected = false

i = 1
while i < args.size
    if option_regex.match?(args[i]) && pattern == ''
        case args[i].split("-")[1]
        when "w"
            if word
                break
            end
            word = true
            main_option_selected = true
        when "p"
            if match_regex
                break
            end
            match_regex = true
            main_option_selected = true
        when "v"
            if not_regex
                break
            end
            not_regex = true
            main_option_selected = true
        when "c"
            if count
                break
            end
            count = true
        when "m"
            if matched
                break
            end
            matched = true
        else
            break
        end
    else
        if pattern == ''
            pattern = args[i]
        else
            pattern = pattern + " " + args[i]
        end
        invalid = false
    end
    
    i = i + 1
end

if !main_option_selected
    match_regex = true
end

if word
    if count
        #fine
    elsif matched
        #fine
    elsif (match_regex || not_regex)
        invalid = true
        invalidc = true
    else
        #fine
    end
end

if match_regex
    if count
        #fine
    elsif matched
        #fine
    elsif (word || not_regex)
        invalid = true
        invalidc = true
    else
        #fine
    end
end

if not_regex
    if count
        #fine
    elsif (matched || word || match_regex)
        invalid = true
        invalidc = true
    else
        #fine
    end
end

if count && matched
    invalid = true
    invalidc = true
end

if invalid
    if invalidc
        puts "Invalid combination of options"
    else
        puts "Invalid option"
    end
    return
end

total = 0

if word #w
    lines.each do |line|
        if line.include?(" " + pattern + " ") || line.start_with?(pattern + " ") || line.end_with?(" " + pattern) || line == pattern
            if count
                total = total + 1
            elsif matched
                puts pattern
            else
                puts line
            end
        end
    end
elsif match_regex #p
    lines.each do |line|
        rgx = Regexp.new pattern
        if line =~ rgx
            if count
                total = total + 1
            elsif matched
                puts "#{$&}"
            else
                puts line
            end
        end
    end
elsif not_regex #v
    lines.each do |line|
        rgx = Regexp.new pattern
        if line !~ rgx
            if count
                total = total + 1
            else
                puts line
            end
        end
    end
end

if count
    puts total
end
