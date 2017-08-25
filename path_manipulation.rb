# http://ruby-doc.org/core-2.3.0/File.html#method-c-expand_path

abs_file_name = File.expand_path("../lib/test_module.rb", __FILE__)
puts abs_file_name
