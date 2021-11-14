def print_file
  file = File.open($0, "r") # __FILE__ is the magic variable that contains the name of the current file
                            # $0 is the name of the file used to start the program.
    file.readlines.each do |line|
      puts line
    end
  file.close
end

print_file
