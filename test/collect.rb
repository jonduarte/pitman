require "pathname"

test "get a list of installed gems" do
  isolated_gems = File.join(Dir.pwd, "test", "fixtures", "isolated-gems")

  ENV["GEM_HOME"] = isolated_gems
  ENV["GEM_PATH"] = isolated_gems

  installed_gems = Pitman.gems_list - Pitman::DEFAULT_GEMS

  assert_equal ["cutest", "pry", "rack"], installed_gems
end

test "extract needed gems from Gemfile.lock" do
  expected = %w(blankslate diff-lcs parslet rspec
                rspec-core rspec-expectations rspec-mocks rspec-support)

  gemfile = File.join(Dir.pwd, "test", "fixtures", "Gemfile.lock")
  needed_gems = Pitman.parse(gemfile)

  assert_equal expected, needed_gems
end

test "list all used gems" do
  expected = %w(clap cutest rack)

  projects = Pathname.new(File.join(Dir.pwd, "test", "fixtures", "projects"))
  used_gems = Pitman.used_gems(projects)

  assert_equal expected, used_gems
end

test "list all unused gems" do
  expected = %w(pry)

  projects = Pathname.new(File.join(Dir.pwd, "test", "fixtures", "projects"))
  unused_gems = Pitman.collect(projects)

  assert_equal expected, unused_gems
end

test "command line" do
  expected = "pry\n"
  command = %x{bin/pitman test/fixtures/projects}

  assert_equal expected, command
end
