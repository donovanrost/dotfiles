task default: %w[test]

task :test do
  sh "bash -c 'shopt -s globstar nullglob; shellcheck ./.setup/bootstrap.sh -f; shellcheck ./.brew/brew.sh;'"
  sh ". ./.brew/brew.sh -a"
  sh "bash -c 'shopt -s globstar nullglob; shellcheck ./.setup/bootstrap.sh -f'"
  sh ". ./.setup/bootstrap.sh -f"
end
