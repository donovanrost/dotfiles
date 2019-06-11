task default: %w[test]

task :test do
  # sh ". brew.sh"
  sh ". bootstrap.sh -f"
  sh "brew list"
  sh "brew cask list"
end
