data=File.open(ARGV[0]).read
if data[data.length()-1]=="\n" then
    File.write(ARGV[0],data.strip) 
end
