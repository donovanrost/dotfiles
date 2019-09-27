task default: %w[test]

task :test do
  sh "shellcheck ./.brew/brew.sh;"
  sh ". ./.brew/brew.sh -a"
  sh "shellcheck ./.setup/bootstrap.sh -f'"
  sh ". ./.setup/bootstrap.sh -f"
end
