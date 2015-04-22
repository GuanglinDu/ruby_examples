# CSV file IO demo. Nov. 30, 2014 Sun.
# CSV file manipulation module is Ruby's standard library.
# Empty lines do not matter in CSV files.
# See http://funonrails.com/2012/01/csv-file-import-export-in-rails-3/

require 'csv'

csv_file = "test.csv"
#Check if file exits

if File.exist?(csv_file)
  puts "File #{csv_file} exists!"
  CSV.foreach(csv_file) do |row|  
    #puts "Class type #{row.class}"
    #puts row.inspect
    if row.length > 0
      unless row[0].start_with?('#')
        if row.length >= 3
          col0 = row[0]
          col1 = row[1]
          col2 = row[2]
          puts "col0: #{col0}, col1: #{col1}, col2: #{col2}"
        else
          puts "An invalid line"        
        end
      end
    end
  end  
end  

