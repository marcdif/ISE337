def showRE(a,re)
  if a =~ re
    "#{$`}<<#{$&}>>#{$'}"
  else
    "no match"
  end
end

print showRE('very interesting', /t/), "\n"
print showRE('Fats Waller', /ll/), "\n"

print showRE('are you sure?', /e\?/), "\n"
print showRE('It costs $12', /[B-F]/),"\n"

print showRE("this is\nthe time", /^the/), "\n"
print showRE("this is\nthe time", /is$/), "\n"
print showRE("this is\nthe time", /\Athis/), "\n"
print showRE("this is\nthe time", /\Athe/), "\n"
print showRE("this is\nthe time", /is\z/), "\n"
print showRE("this is\nthe time", /time\z/), "\n"
print showRE("this is\nthe time", /\bis/), "\n"
print showRE("this is\nthe time", /\Bis/), "\n"
print showRE("It costs $12", /[aeiou]/), "\n"

print showRE("This is Mississippi", /(\w+)\1/), "\n"

"12:50am" =~ /(\d\d):(\d\d)(..)/

print "Hour is #$1, minute #$2, AM/PM #{$3}", "\n"



# print "\n"
# print showRE('this is the time', /\w/)
# print "\n"
# print showRE('this is the time', /^./)
# print "\n"
# print showRE('this is the time', /\b\w/)
# print "\n"
# # print showRE('12:50am', /(\d\d):(\d\d)(..)/)
# # print "\n"
# # print "Hours is #$1, minute is #$2"
# # print "\n"
# "12:50am" =~ /(\d\d):(\d\d)(..)/
# print "Hour is #$1, minute #$2, #{$3}"
# print "\n"
# print showRE('He said "Hello"', /(\w)(\1)/)
# print "\n"
# print showRE('He said "Hello"', /(\W)/)
# print "\n"
# print showRE("This is\nthe time\n", /time\Z/)
# print "\n"
