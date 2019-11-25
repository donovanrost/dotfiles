task default: %w[test]

task :test do

  sh ". ./.brew/brew.sh -a"
  echo 'brew completed'
  sh ". ./.setup/bootstrap.sh -f"
  echo 'bootstrap completed'
end
