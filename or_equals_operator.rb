# Created on Feb. 15, 2019 Fri.
# https://3rd-edition.railstutorial.org/book/_single-page#sec-modifying_built_in_classes
# 8.2.2 Current user
# Box 8.1. What the *$@! is ||= ?

# The or operator ||
foo = foo || "bar" # "bar"
puts "foo = #{foo}"
foo = foo || "baz" # "bar" 
puts "foo = #{foo}"

# The or equals operator ||= (vs +=, -=, *=)
bar ||= "baz"
puts "bar = #{bar}"
bar ||= "bas"
puts "bar = #{bar}"
