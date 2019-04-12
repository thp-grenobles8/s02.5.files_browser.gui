
abort("--- you need to specify ONE filePath !") if ARGV.length != 1

# Root PATH --------------------------
Dir.chdir("/home/guilaume3/Documents/codage_projets/hacker_project")


# CONTENTS ---------------------------

gemfile = 'source "https://rubygems.org"
ruby "2.5.1"
gem "dotenv"
# gem "pry"
gem "rspec"
gem "rubocop", "~> 0.57.2"
gem "json"'

env = ''

gitignore = '
.env'

readme = "# #{ARGV.first}
Dossier créé depuis ruby

## la team

- Guillaume Silvent @gui3"



root_path = File.expand_path(ARGV.first)
ARGV.clear
puts "create a folder as #{root_path} ?"
print "y>"
confirm = gets.chomp.to_s
abort("--- aborted") if confirm != "y"


def folder_handler (path)
  begin
    Dir.mkdir(path)
    puts "#{path}\n folder created"
  rescue Errno::EEXIST
    puts "--- #{path}\n ALREADY EXISTS ... continue ?"
    print "y>"
    confirm = gets.chomp.to_s
    abort("--- aborted") if confirm != "y"
  end
end

def file_handler (path, data, permission = "a+")
  File.open(path,permission) do
    |f|
    begin
      f.read()
      puts "--- #{path}\n ALREADY EXISTS ... rewrite ?"
      print "y>"
      confirm = gets.chomp.to_s
      if confirm == "y"
        f.write(data)
        puts "#{path}\n file created"
      end
    rescue
      f.write(data)
      puts "#{path}\n file created"
    end
  end
end

# root folder
folder_handler(root_path)

# lib
folder_handler(File.join(root_path,"lib"))

# Gemfile
file_handler(File.join(root_path,"Gemfile"),gemfile,"w+")

# git init
Dir.chdir(root_path)
system("git init")
system("rspec --init")

file_handler(File.join(root_path,".env"),env,"w+")

file_handler(File.join(root_path,".gitignore"),gitignore,"a+")

file_handler(File.join(root_path,"readme.md"),readme,"w+")


# Commands
